using Grpc.Core;
using GrpcService1;

namespace GrpcService1.Services;

public class DemoApiService : GrpcService1.DemoService.DemoServiceBase
{
    private readonly ILogger<DemoApiService> _logger;

    public DemoApiService(ILogger<DemoApiService> logger)
    {
        _logger = logger;
    }

    public override Task<GreetingResponse> GetGreeting(GreetingRequest request, ServerCallContext context)
    {
        var greeting = request.Language?.ToLower() switch
        {
            "de" or "deutsch" => $"Hallo {request.Name}! Willkommen bei unserem gRPC Service!",
            "es" or "spanish" => $"¡Hola {request.Name}! ¡Bienvenido a nuestro servicio gRPC!",
            "fr" or "french" => $"Bonjour {request.Name}! Bienvenue dans notre service gRPC!",
            _ => $"Hello {request.Name}! Welcome to our gRPC service!"
        };

        _logger.LogInformation($"Greeting requested for {request.Name} in {request.Language}");

        return Task.FromResult(new GreetingResponse
        {
            Message = greeting,
            Timestamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss UTC")
        });
    }

    public override Task<UserResponse> GetUserInfo(UserRequest request, ServerCallContext context)
    {
        // Demo-Benutzerdaten
        var users = new Dictionary<int, UserResponse>
        {
            { 1, new UserResponse { Id = 1, Name = "Max Mustermann", Email = "max@example.com", Role = "Admin", IsActive = true } },
            { 2, new UserResponse { Id = 2, Name = "Anna Schmidt", Email = "anna@example.com", Role = "User", IsActive = true } },
            { 3, new UserResponse { Id = 3, Name = "Peter Müller", Email = "peter@example.com", Role = "Moderator", IsActive = false } }
        };

        _logger.LogInformation($"User info requested for ID: {request.UserId}");

        if (users.TryGetValue(request.UserId, out var user))
        {
            return Task.FromResult(user);
        }

        throw new RpcException(new Status(StatusCode.NotFound, $"User with ID {request.UserId} not found"));
    }

    public override Task<ProductsResponse> GetProducts(ProductsRequest request, ServerCallContext context)
    {
        var allProducts = new List<Product>
        {
            new Product { Id = 1, Name = "Smartphone", Description = "Neuestes Android Smartphone", Price = 699.99, Category = "Electronics", InStock = true },
            new Product { Id = 2, Name = "Laptop", Description = "Gaming Laptop mit RTX Grafikkarte", Price = 1299.99, Category = "Electronics", InStock = true },
            new Product { Id = 3, Name = "Kopfhörer", Description = "Noise-Cancelling Kopfhörer", Price = 299.99, Category = "Electronics", InStock = false },
            new Product { Id = 4, Name = "Kaffeetasse", Description = "Keramik Kaffeetasse", Price = 12.99, Category = "Home", InStock = true },
            new Product { Id = 5, Name = "Buch", Description = "Programmierung lernen", Price = 39.99, Category = "Books", InStock = true },
            new Product { Id = 6, Name = "T-Shirt", Description = "100% Baumwolle T-Shirt", Price = 24.99, Category = "Clothing", InStock = true }
        };

        var filteredProducts = string.IsNullOrEmpty(request.Category)
            ? allProducts
            : allProducts.Where(p => p.Category.Equals(request.Category, StringComparison.OrdinalIgnoreCase)).ToList();

        var limit = request.Limit > 0 ? request.Limit : filteredProducts.Count;
        var products = filteredProducts.Take(limit).ToList();

        _logger.LogInformation($"Products requested - Category: {request.Category}, Limit: {request.Limit}, Returned: {products.Count}");

        var response = new ProductsResponse
        {
            TotalCount = filteredProducts.Count
        };
        response.Products.AddRange(products);

        return Task.FromResult(response);
    }

    public override Task<TimeResponse> GetServerTime(Empty request, ServerCallContext context)
    {
        var now = DateTime.UtcNow;

        _logger.LogInformation("Server time requested");

        return Task.FromResult(new TimeResponse
        {
            CurrentTime = now.ToString("yyyy-MM-dd HH:mm:ss"),
            Timezone = "UTC",
            TimestampUnix = ((DateTimeOffset)now).ToUnixTimeSeconds()
        });
    }

    public override async Task GetLiveUpdates(Empty request, IServerStreamWriter<UpdateMessage> responseStream, ServerCallContext context)
    {
        _logger.LogInformation("Live updates stream started");

        var updateTypes = new[] { "info", "warning", "success", "error" };
        var messages = new[]
        {
            "System ist online",
            "Neue Benutzer registriert",
            "Backup abgeschlossen",
            "Wartung geplant",
            "Performance Update verfügbar",
            "Neue Features hinzugefügt"
        };

        var random = new Random();
        var counter = 1;

        try
        {
            while (!context.CancellationToken.IsCancellationRequested)
            {
                var update = new UpdateMessage
                {
                    Id = counter.ToString(),
                    Message = messages[random.Next(messages.Length)],
                    Timestamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss UTC"),
                    Type = updateTypes[random.Next(updateTypes.Length)]
                };

                await responseStream.WriteAsync(update);
                _logger.LogInformation($"Sent update #{counter}: {update.Message}");

                counter++;
                await Task.Delay(3000, context.CancellationToken); // Alle 3 Sekunden ein Update
            }
        }
        catch (OperationCanceledException)
        {
            _logger.LogInformation("Live updates stream cancelled by client");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error in live updates stream");
        }
    }
}

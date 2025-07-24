Demo on how to use grpc 

unsing gRPC for the Server and Flutter for the Client

🧩 1. Architektur & Protokoll
REST API	gRPC
Nutzt HTTP 1.1	Nutzt HTTP/2
Architektur basiert auf Ressourcen (z. B. GET /users)	Architektur basiert auf Methoden/Aktionen (z. B. GetUser())
Verwendet standardisierte HTTP-Verben: GET, POST, PUT, DELETE	Verwendet RPC-Methoden, die in .proto-Dateien definiert sind

🧾 2. Datenformat
REST API	gRPC
Typischerweise JSON	Protocol Buffers (Protobuf) – binäres, kompaktes Format
Menschlich lesbar	Sehr effizient, aber nicht lesbar ohne Decoder

⚡ 3. Performance
REST API	gRPC
Langsamer (größere Datenpakete, kein Streaming bei HTTP/1.1)	Schneller und effizienter (HTTP/2, Binary, Streaming)
Keine eingebauten Streams	Unterstützt bidirektionales Streaming

⚙️ 4. Code-Generierung
REST API	gRPC
Muss oft manuell geschrieben werden	Erzeugt automatisch Client- und Server-Code aus .proto-Dateien
Weniger strikt typisiert	Starke Typisierung durch Protobuf

🌐 5. Kompatibilität
REST API	gRPC
Funktioniert gut im Browser (einfach mit JavaScript)	Direkt im Browser nicht ohne Proxy nutzbar (z. B. über gRPC-Web)
Sehr gut geeignet für öffentliche APIs	Besser für interne, hochperformante Microservices-Kommunikation

📦 6. Use Cases
REST API	gRPC
Web-Apps, mobile Apps, einfache HTTP-Kommunikation	Microservices, High-Performance-Anwendungen, Echtzeit-Streaming

🧠 Fazit
REST API	gRPC
Einfach, universell, lesbar, aber langsamer	Schnell, effizient, skalierbar, aber komplexer und nicht nativ browserkompatibel

Wann solltest du was verwenden?
✅ REST, wenn:

du Browser-Kompatibilität brauchst

du eine einfache API mit JSON willst

Interoperabilität mit vielen Clients (z. B. externe Entwickler) wichtig ist

✅ gRPC, wenn:

Performance, Streaming oder Microservices im Fokus stehen

du interne Systeme entwickelst

du stark typisierte Schnittstellen bevorzugst



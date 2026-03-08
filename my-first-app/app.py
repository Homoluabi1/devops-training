#!/usr/bin/env python3

# Simple web server for Docker demo

from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        html = """
        <html>
        <body style="font-family: Arial; text-align: center; padding: 50px;">
            <h1>Hello from Docker!</h1>
            <p>This app is running inside a container.</p>
            <p>Built by Samuel Olukunle Aribikolasi - DevOps Training</p>
        </body>
        </html>
        """
        self.wfile.write(html.encode())
    
    def log_message(self, format, *args):
        pass  # Suppress logs for cleanliness

print("Server starting on port 8080...")
server = HTTPServer(('0.0.0.0', 8080), Handler)
server.serve_forever()

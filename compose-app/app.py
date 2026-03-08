#!/usr/bin/env python3

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import os

# Track visits in memory
visit_count = 0

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        global visit_count
        visit_count += 1
        
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        
        html = f"""
        <html>
        <body style="font-family: Arial; text-align: center; padding: 50px; background: #1a1a2e; color: white;">
            <h1 style="color: #00d4ff;">🐳 Docker Compose App</h1>
            <p>Built by Samuel Olukunle - DevOps Training</p>
            <div style="background: #16213e; padding: 20px; border-radius: 10px; margin: 20px auto; max-width: 400px;">
                <h2>Page Visits: {visit_count}</h2>
                <p>Environment: {os.environ.get('APP_ENV', 'development')}</p>
                <p>App Version: {os.environ.get('APP_VERSION', '1.0')}</p>
            </div>
            <p style="color: #888;">Refresh the page to increase the visit count!</p>
        </body>
        </html>
        """
        self.wfile.write(html.encode())
    
    def log_message(self, format, *args):
        print(f"Request received - Visit #{visit_count}")

print("Server starting on port 8080...")
server = HTTPServer(('0.0.0.0', 8080), Handler)
server.serve_forever()

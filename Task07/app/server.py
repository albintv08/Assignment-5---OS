from http.server import BaseHTTPRequestHandler, HTTPServer

class PortalHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"healthy")
            return

        self.send_response(200)
        self.send_header("Content-Type", "text/html")
        self.end_headers()

        page = """
        <html>
        <head><title>University Result Portal</title></head>
        <body>
          <h1>University Result Portal</h1>
          <p>Docker container application is running.</p>
          <p>Service: Web Application</p>
        </body>
        </html>
        """
        self.wfile.write(page.encode())

server = HTTPServer(("0.0.0.0", 8080), PortalHandler)
print("Result Portal running on port 8080")
server.serve_forever()

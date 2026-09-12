from http.server import BaseHTTPRequestHandler, HTTPServer
import json


class VehicleHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == "/vehicles":
            try:
                with open("vehicles.json", "r") as file:
                    vehicles = json.load(file)

                response = json.dumps(vehicles).encode("utf-8")

                self.send_response(200)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(response)))
                self.end_headers()

                self.wfile.write(response)

            except Exception:
                self.send_response(500)
                self.end_headers()

        else:
            self.send_response(404)
            self.end_headers()


server = HTTPServer(("localhost", 8000), VehicleHandler)

print("Mock API running at http://localhost:8000/vehicles")

server.serve_forever()

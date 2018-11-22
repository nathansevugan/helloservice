from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import os




class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello, world!')



def run():
  print('http server is starting...')

  #ip and port of server
  #by default http server port is 80
  server_address = ('127.0.0.1', 8080)
  httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
  print('http server is running...')
  httpd.serve_forever()

if __name__ == '__main__':
  run()
"""

JSON Server in python

author: Atsushi Sakai (@Atsushi_twi)

"""

from http.server import HTTPServer, SimpleHTTPRequestHandler
from urllib.parse import parse_qs, urlparse
import json
from datetime import datetime
import math


class MyHandler(SimpleHTTPRequestHandler):

    def do_POST(self):

        # show request
        print(self.headers)
        print(vars(self))
        content_len = int(self.headers.getheader('content-length', 0))
        post_body = self.rfile.read(content_len)
        print(post_body)

        uri = self.path
        ret = parse_qs(urlparse(uri).query, keep_blank_values=True)

        content = {}
        content["title"] = "Python JSON server"
        content["time"] = datetime.now().strftime("%Y%m%d%H%M%S")
        content["PI"] = math.pi
        ret = json.dumps(content)

        body = bytes(ret, 'utf-8')
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-length', len(body))
        self.end_headers()
        self.wfile.write(body)


def main():
    host = 'localhost'
    port = 8000
    httpd = HTTPServer((host, port), MyHandler)
    print('serving at port', port)
    httpd.serve_forever()

    print(__file__ + " start!!")


if __name__ == '__main__':
    main()

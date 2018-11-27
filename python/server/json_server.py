"""

JSON Server with python

author: Atsushi Sakai (@Atsushi_twi)

"""

from http.server import HTTPServer, SimpleHTTPRequestHandler
from urllib.parse import parse_qs, urlparse
import json
from datetime import datetime
import math


class MyHandler(SimpleHTTPRequestHandler):

    def do_POST(self):

        # get request
        content_len = int(self.headers.get('content-length'))
        req = json.loads(self.rfile.read(content_len))
        print("request")
        print(req)

        uri = self.path
        ret = parse_qs(urlparse(uri).query, keep_blank_values=True)

        res = {}
        res["title"] = "Python JSON server"
        res["time"] = datetime.now().strftime("%Y%m%d%H%M%S")
        res["PI"] = math.pi
        print("response")
        print(res)

        ret = json.dumps(res)

        body = bytes(ret, 'utf-8')
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-length', len(body))
        self.end_headers()
        self.wfile.write(body)


def main():
    print("Start python json server")
    host = '0.0.0.0'
    port = 8000
    httpd = HTTPServer((host, port), MyHandler)
    print('serving at port', port)
    httpd.serve_forever()

    print(__file__ + " start!!")


if __name__ == '__main__':
    main()

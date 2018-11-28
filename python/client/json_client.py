"""

JSON Client with python

author: Atsushi Sakai (@Atsushi_twi)

"""

import requests
import json
import os


def get_config():
    ip = os.environ.get('SERVER_IP', 'localhost')
    port = os.environ.get('SERVER_PORT', '8000')
    return ip, port


def main():

    ip, port = get_config()

    url = "http://" + ip + ":" + port
    print("url:", url)

    headers = {"content-type": "application/json"}
    obj = {"Type": "python json client", 123: 123}
    json_data = json.dumps(obj)
    print("request:")
    print(json_data)
    response = requests.post(url, headers=headers, data=json_data)

    res = response.json()
    print("response:")
    print(res)


if __name__ == '__main__':
    main()

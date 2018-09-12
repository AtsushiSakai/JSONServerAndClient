"""

JSON Client with python

author: Atsushi Sakai (@Atsushi_twi)

"""

import requests
import json


def main():

    headers = {"content-type": "application/json"}
    url = "http://localhost:8000"

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

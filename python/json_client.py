"""

JSON Client in python

author: Atsushi Sakai (@Atsushi_twi)

"""

import requests


def main():

    headers = {"content-type": "application/json"}
    url = "http://localhost:8000"
    response = requests.get(url, headers=headers)

    json = response.json()
    print(json)


if __name__ == '__main__':
    main()

"""
A websocket server example

author: Atsushi Sakai

"""

import asyncio
import websockets
import time


def main():
    print("start!!")

    async def hello(websocket, path):
        name = await websocket.recv()
        print(f"< {name}")

        for i in range(10):
            greeting = f"Hey {name}!"
            await websocket.send(greeting)
            print(f"> {greeting}")
            time.sleep(3)

    start_server = websockets.serve(hello, "localhost", 8765)

    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_forever()

    print("done!!")


if __name__ == '__main__':
    main()


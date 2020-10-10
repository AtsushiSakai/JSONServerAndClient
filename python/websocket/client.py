"""
A websocket client example

author: Atsushi Sakai

"""

import asyncio
import websockets

def main():
    print("start!!")

    async def hello():
        uri = "ws://localhost:8765"
        async with websockets.connect(uri) as websocket:
            name = input("What's your name? ")

            await websocket.send(name)
            print(f"> {name}")

            while True:
                greeting = await websocket.recv()
                print(f"< {greeting}")

    asyncio.get_event_loop().run_until_complete(hello())

    print("done!!")


if __name__ == '__main__':
    main()


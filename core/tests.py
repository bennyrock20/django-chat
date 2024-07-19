import pytest
from channels.testing import WebsocketCommunicator
from chat.asgi import application


@pytest.mark.asyncio
async def test_websocket_connection():
    communicator = WebsocketCommunicator(application, "/ws/chat/")
    connected, subprotocol = await communicator.connect()
    assert connected

    # Test sending and receiving messages
    message = {'message': 'hello'}
    await communicator.send_json_to(message)
    response = await communicator.receive_json_from()
    assert response == message

    # Close the connection
    await communicator.disconnect()

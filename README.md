# Django WebSocket Chat Application

This project is a simple chat application built with Django, Django Channels, and WebSockets. The project is
containerized using Docker and includes setup for Redis. Testing is done using `pytest`.

## Features

- Real-time chat using WebSockets
- Dockerized environment
- Redis for channel layers
- Testing with `pytest`

## Prerequisites

- Docker
- Docker Compose

## Installation

``
make build
``
## Usage

1. Start the Docker containers: 

```
make up
```
2. Open the chat application in your browser at http://localhost:8000/chat/.
3. Type a message in the input box and click "Send".
4. Open multiple browser tabs to see the real-time chat functionality.


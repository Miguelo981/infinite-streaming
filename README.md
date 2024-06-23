# Infinite Twitch Stream

This repository provides a solution to create infinite streams on Twitch using a Docker script. Special thanks to [EsteveSegura](https://github.com/EsteveSegura) for the inspiration from their [publication](https://x.com/girlazote/status/1803181481059340443).

## Table of Contents

- [Requirements](#requirements)
- [Setup](#setup)
  - [Docker](#docker)
  - [Docker Compose](#docker-compose)
- [Environment Variables](#environment-variables)
- [Credits](#credits)

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Docker

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-username/infinite-twitch-stream.git
    cd infinite-twitch-stream
    ```

2. **Create the `.env` File**

    Create a `.env` file in the root of the project and add your environment variables:

    ```env
    TWITCH_API_KEY=your_twitch_api_key
    YOUR_WEBSITE_URL=your_website_url
    ```

3. **Build the Docker Image**

    ```bash
    docker build -t infinite-stream .
    ```

4. **Run the Docker Container**

    ```bash
    docker run --env-file .env -v $(pwd)/stream_to_twitch.sh:/home/stream_to_twitch.sh infinite-stream
    ```

### Docker Compose

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-username/infinite-twitch-stream.git
    cd infinite-twitch-stream
    ```

2. **Create the `.env` File**

    Create a `.env` file in the root of the project and add your environment variables:

    ```env
    TWITCH_API_KEY=your_twitch_api_key
    YOUR_WEBSITE_URL=your_website_url
    ```

3. **Start the Docker Compose Services**

    ```bash
    docker-compose up --build
    ```

## Environment Variables

Create a `.env` file in the root directory of the project with the following variables:

```env
TWITCH_API_KEY=your_twitch_api_key
YOUR_WEBSITE_URL=your_website_url
```

## Credits

This project is inspired by the work of [EsteveSegura](https://github.com/EsteveSegura) and their [publication](https://x.com/girlazote/status/1803181481059340443). Special thanks for the idea and initial implementation guidance.

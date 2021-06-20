# Local Environment Setup

## Introduction
Local environment setup can be tough, especially when there is more than one service involved. Currently, Assembler has 2 core back-end services and 1 core front-end service. As a result, this can become challenging when one wants to test an end-2-end flow. This is why this repository was created - to simplify local environment setup, such that it is as simple as running a single command to boot an entire local environment up.

## Instructions

### Bringing up containers
    1. `docker-compose up`

    Note: These dockerfiles support hot reloading on file changes.

### Running Interactive Shell (For Tests / Migrations)
    1. `docker-compose run --rm <(orchestration / block-monolith)> /bin/bash`
    2. Execute any normal django function you would execute normally


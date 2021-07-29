# Local Environment Setup

## Introduction
Local environment setup can be tough, especially when there is more than one service involved. Currently, Assembler has 2 core back-end services and 1 core front-end service. As a result, this can become challenging when one wants to test an end-2-end flow. This is why this repository was created - to simplify local environment setup, such that it is as simple as running a single command to boot an entire local environment up.

## Instructions

### Initial Setup
    1. Clone the django-block-monolith[https://github.com/assembler-financial/django-block-monolith] and django-orchestration[https://github.com/assembler-financial/django-orchestration] repositories into the same root folder that this repository is stored in.
    
### Bringing up containers
    1. `docker-compose up --build block-monolith orchestration-postgres orchestration`

    Note: These dockerfiles support hot reloading on file changes.

### Running Interactive Shell (For Tests / Migrations)
    1. `docker-compose run --rm <(orchestration / block-monolith)> /bin/bash`
    2. Execute any normal django function you would execute normally

### Setup Issues
    1.
        You will need to export ASSEMBLER_PROJECT_DIR, which is the folder where you will keep all assembler-related code
        `export ASSEMBLER_PROJECT_DIR="/path/to/assember-root-file"`
    
    2.
        You may need to add permissions for all the `docker-entrypoint.sh` files
        
        Change directory into the `django-orchestration` and `django-block-monolith` repositories and run `chmod +x docker-entrypoint.sh` in each repository




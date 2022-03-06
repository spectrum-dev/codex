# Codex
## _Local Environment Setup_

<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Bash_Logo_Colored.svg/1200px-Bash_Logo_Colored.svg.png' width='50'> <img src='https://www.docker.com/sites/default/files/d8/2019-07/Moby-logo.png' width='50'>

Local environment setup can be tough, especially when there is more than one service involved. Currently, Spectrum has 2 core back-end services and 1 core front-end service. As a result, this can become challenging when one wants to test an end-2-end flow. This is why this repository was created - to simplify local environment setup, such that it is as simple as running a single command to boot an entire local environment up.

## Installation

1. 
    Clone this repository into a standalone folder
    
    ```sh
    git clone git@github.com:spectrum-dev/codex.git
    ```

2.  
    Run the setup script. This will clone the relevant files into your folder in the correct folder structure.

    ```sh
    sh ./setup.sh
    ```

## Running The Platform

### Accessing Django Orchestration's Container

```sh
docker-compose run --rm orchestration /bin/bash
<perform any django functions here>
```

Note: These dockerfiles support hot reloading on file changes.

### Accessing Django Block Monolith's Container

```sh
docker-compose run --rm block-monolith /bin/bash
<perform any django functions here>
```

Note: These dockerfiles support hot reloading on file changes.

### Running the full platform

```sh
docker-compose up -d --build
```

Note: These dockerfiles support hot reloading on file changes.

### Common Setup Issues
    1.
        You will need to export CODEX_PROJECT_DIR, which is the folder where you will keep all assembler-related code
        `export CODEX_PROJECT_DIR="/path/to/assember-root-file"`
    
    2.
        You may need to add permissions for all the `docker-entrypoint.sh` files
        
        Change directory into the `django-orchestration` and `django-block-monolith` repositories and run `chmod +x docker-entrypoint.sh` in each repository

    3. 
        Issue with existing port being used
        Unix: `docker stop $(docker ps -a -q)`
        Windows: `FOR /f "tokens=*" %i IN ('docker ps -a -q') DO docker stop %i`

    4.
        Orchestration does not start specifically on Windows
        Try `docker-compose up orchestration`, if this fails with "standard_init_linux.go:228: exec user process caused: no such file or directory" then go into `docker-entrypoint.sh` and change file line-ending from CRLF to LF
    
    5. 
        Existing PostgreSQL using port 5432
        Go into `docker-compose.yml` and change ports to <some-free-port>:5432 and connect via <some-free-port> instead


## Development

Want to contribute? Great! Feel free to create PR's for improvements and I will take a look at them as quickly as possible! Forks are also encouraged as well!

## License

MIT

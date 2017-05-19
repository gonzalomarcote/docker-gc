# docker-gc
Simple docker garbage collection that removes exited containers and dangling images

## Usage

Loging to AWS repository if necessary:

    `aws ecr get-login --region eu-west-1 | sh -`

Run as cron job (every X minutes - edit Dockerfile):

    `docker run --restart=always --name docker-gc -d -v /var/run/docker.sock:/var/run/docker.sock XXX.dkr.ecr.eu-west-1.amazonaws.com/docker-gc:latest`

Run a one-off:

    `docker run --name docker-gc --rm -it -v /var/run/docker.sock:/var/run/docker.sock XXX.dkr.ecr.eu-west-1.amazonaws.com/docker-gc:latest docker-gc`

Deploy as a kubernetes daemonset:

    `kubectl create -f docker-gc.yaml`


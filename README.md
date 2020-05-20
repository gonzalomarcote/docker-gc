# docker-gc
Author: Gonzalo Marcote - gonzalomarcote@gmail.com

License: GNU General Public License V3.0

Disclaimer: For my own use. Use on your own (GNU GPL License). Don't give any support


### Simple docker garbage collection that removes exited containers and dangling images

#### Usage

Build it locally:

   `docker build -t cbyg/docker-gc .`

Loging to AWS repository if necessary:

    `aws ecr get-login --region eu-west-1 | sh -`

Run as cron job (every X minutes - edit Dockerfile):

    `docker run --restart=always --name docker-gc -d -v /var/run/docker.sock:/var/run/docker.sock cbyg/docker-gc:latest`  
    `docker run --restart=always --name docker-gc -d -v /var/run/docker.sock:/var/run/docker.sock XXX.dkr.ecr.eu-west-1.amazonaws.com/docker-gc:latest`  

Run a one-off:

    `docker run --name docker-gc --rm -it -v /var/run/docker.sock:/var/run/docker.sock cbyg/docker-gc:latest docker-gc`  
    `docker run --name docker-gc --rm -it -v /var/run/docker.sock:/var/run/docker.sock XXX.dkr.ecr.eu-west-1.amazonaws.com/docker-gc:latest docker-gc`  

Deploy as a kubernetes daemonset:

    `kubectl create -f docker-gc.yaml`


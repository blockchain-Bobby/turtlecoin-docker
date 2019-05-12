# Turtle Network CLI With TTYD Docker Image

This is a dockerization of the [Turtle Network CLI](https://github.com/turtlecoin/turtle-network-cli) running on apline with ttyd. The process is run within tmux to persist the session in case the page reloads or crashes.

Build Arguments/Environment Variables:

| Name | Default | Function |
| --- | --- | --- |
| BRANCH | master | The branch to clone |
| WEB_USERNAME |  | Username to access the web terminal |
| WEB_PASSWORD |  | Password to access the web terminal |

Examples:
```
docker build -t turtle-network-cli-ttyd .
docker run -d -p 7681:7681 --name turtle-network-cli-ttyd turtle-network-cli-ttyd
```

To use the test suite navigate to http://localhost:7681 (or whatever port you pass in, e.g. ```-p 8080:7681```)

To use Turtle Network CLI, [check out some of the commands](https://github.com/turtlecoin/turtle-network-cli#user-content-commands-work-in-progress)

Accessing the web terminal with a username and password:
```
docker run -d -p 7681:7681 -e WEB_USERNAME=Slow -e WEB_PASSWORD=AndSteady --name turtle-network-cli-ttyd turtle-network-cli-ttyd
```

This image is also hosted on [Docker Hub](https://cloud.docker.com/u/andrewnk/repository/docker/andrewnk/turtlecoin). 

To run from the Docker Hub image:

```
docker run -d -p 7681:7681 --name turtle-network-cli-ttyd andrewnk/turtlecoin:turtle-network-cli-ttyd
```

To use from the Docker Hub image:

```
FROM andrewnk/turtlecoin:turtle-network-cli-ttyd as turtle-network-cli-ttyd
```
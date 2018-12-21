# luzifer-docker / icecast2

Run an icecast2 server in a Docker container

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/icecast2 .

## Execute icecast2
$ docker run --rm -ti -v $(pwd):/config luzifer/icecast2
```

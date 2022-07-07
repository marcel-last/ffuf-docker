# ffuf-docker
A containerised version of [ffuf](https://github.com/ffuf/ffuf).

## Building the container
```bash
docker build -t ffuf-docker:latest
```
## Running the container
```bash
docker run --rm ffuf-docker <FPING_ARGS>

## Example:
docker run --rm ffuf-docker -w /path/to/wordlist -u https://target/FUZZ -maxtime-job 60 -recursion -recursion-depth 2
```

## Dockerfile Entrypoint
```dockerfile
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/ffuf"]
```

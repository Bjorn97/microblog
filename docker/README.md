### Links

Documentation for [docker-compose](https://docs.docker.com/compose/compose-file/).

Ovveriding [configs in MySQL in Docker](https://webapplicationconsultant.com/docker/how-to-override-mysql-config-in-docker/).

docker-compose file [split in multiple files](https://medium.com/vteam/configure-docker-project-for-different-environments-using-docker-compose-3-bfbef37d951c).



### Known Errors

#### Missing credential-desktop in WSL

`docker.errors.DockerException: Credentials store error: StoreError('docker-credential-docker-credential-desktop.exe not installed or not available in PATH',)`

Solution:
Open `~/.docker/config.json` and add `.exe` to the `credsStore`.
```
"credsStore":"desktop.exe"
```


#### Missing gcc when installing python modules in docker slim/alpine:

Error:
```
unable to execute 'gcc': No such file or directory
    error: command 'gcc' failed with exit status 1
```
Solution:

Install `gcc` and modules in one command.

```
RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base \
  && pip install --upgrade pip \
  && pip install -r requirements.txt \
  && apk del build-dependencies
```

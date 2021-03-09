# osx-docker-toolbox

This repo provide the minimal setup required to work with docker when using a VM (eg. VirtualBox) as docker machine

It installs:
- docker cli
- docker-compose
- docker-machine

The versions and the destination path for the tools can be defined in the `.versions` file. see [.versions.dist](.versions.dist)

## usage:

#### config setup
```
cp .versions.dist .versions
# edit .versions if needed
```

#### Install docker tools 

install all tools:
```
make all
```

install only one (or more) tools
```
make docker
make docker-compose
make docker-machine
```




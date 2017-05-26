# Davmail #

Repository containing the configuration files to build an image for the Davmail service

# Setup instructions #
The setup is composed of the following steps:

1. Install docker engine (see [Install docker on Ubuntu 16.04](www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04))

2. Clone this project (requires **git** to be installed)

```
#!bash
git clone git@bitbucket.org:davidfialho/davmail_docker.git davmail
```

3. Build the image
```
#!bash
cd davmail
docker build -t davmail .
```

4. Create and run the container
```
#!bash
./runner.sh
```
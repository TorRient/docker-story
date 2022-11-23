#ctr can be used to tell containerd to pull a container image
sudo ctr images pull docker.io/library/redis:latest
#List the images
sudo ctr images list
#Run a container based on an image
sudo ctr container create docker.io/library/redis:latest redis
#List the running containers
sudo ctr container list
#Stop the container
sudo ctr container delete redis



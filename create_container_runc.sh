# Create Rootfilesystem from Image ubuntu20.04
mkdir rootfs
docker export $(docker create ubuntu:20.04) | tar -xf - -C rootfs
# Run container with runc
runc spec
sudo runc run mycontainerid


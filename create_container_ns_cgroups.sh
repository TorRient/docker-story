# Create Rootfilesystem from Image ubuntu20.04
CID=$(docker create ubuntu:20.04)
ROOTFS=$(mktemp -d)
docker export $CID | tar -xf - -C $ROOTFS

# Create namespaces and cgroups
UUID=thuyennh
cgcreate -g cpu,memory:$UUID
cgset -r memory.limit_in_bytes=100000000 $UUID
cgset -r cpu.shares=512 $UUID
cgset -r cpu.cfs_period_us=1000000 $UUID
cgset -r cpu.cfs_quota_us=2000000 $UUID

cgexec -g cpu,memory:$UUID unshare -uinpUrf \
 --mount-proc sh -c "/bin/hostname $UUID && chroot $ROOTFS /bin/sh"

# Delete when completed
cgdelete -r -g cpu,memory:$UUID
rm -r $ROOTFS



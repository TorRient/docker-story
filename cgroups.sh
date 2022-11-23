# Create a cgroup with memory controller
sudo cgcreate -g memory:thuyennh
# Set some small limits to these controllers (say, 4KB)
sudo cgset -r memory.limit_in_bytes=$((4*1024)) thuyennh
# Run an executable under the group and controller, within memory limit
sudo cgexec -g memory:thuyennh bash
> Killed
> Kernel's Out-of-Memory (OOM) Killer was invoked!


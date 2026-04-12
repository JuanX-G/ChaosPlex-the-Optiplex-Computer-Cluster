# Network
The network itself is pretty simple and flat, based around a single switch

## Setup
The head-node is plugged into to the switch along with the compute-nodes. 
to avoid my home-network DHCP server, and the cluster DHCP server fighting I isolated the switch, 
the head-node was given an external NIC and connected to the internet separately.

### Settings
For a bit more performance I have enabled Jumbo-Frames on the switch. 
I also opted to trun off most reliability features, such as loopback detection; 
this reduces the overhead and is plenty safe for such simple network.

## DHCP
Because I had a hard time making the optiplexes respect a static IP, I made static allocations for them on the DHCP server side.
This is required for proper provisioning of images from warewulf and slurm job distribution.

## Stack
The stack is pretty simple in large part due to this being a one-man operation.

### Provisioning
For this I use warewulf, it's a pretty modern and straightforward option.
You define images, the easiest method is to get a shell into them and configure this way.
Then, for those images you generate per-node overlays. The overlays carry everything that is node specific, settings dependent on the MAC adress, etc.

### Job Distribution
For distributing the actual jobs I opted for Slurm, it is the most modern option that is also comprehensive enough.
Each node has Slurmd installed and the head runs Slurmctld. Users can queue up jobs using the `sbatch` command.
I use Slurm with munge for key managment as other methods of authentication are mostly depracted

### Parallel Code
I went with the simplest option, that is OpenMPI. While Intel's Implementation is often a bit faster, it is more of hassle to setup.
So I went with the slightly simpler OpenMPI.



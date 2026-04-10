# Hardware
## Compute nodes
In my compute nodes I strived to maintain a homgenous setup, with that, because high availability I went with the
Dell Optiplex 9020 SFF with an i5-4570
During setup I equiped each node with 12GB of RAM and a SATA SSD

### Tradeoffs 
- First, while for the 9020 a version with the Super-Multi-Threaded i5-4770 is available it is
  hard to find on auction portals and usually at least 20% more expensive. So the i5 is a middle-ground I settled on.
- Secondly, the elephant in the room, power consumption. Note that a full consideration of that is described in the file docs/power-consumption.md
  But in short, the machines are of most of the time being turned on only if I know I have calculations to run. So while the costs are high, this makes them berable.

### Performace
With 12GB of RAM the nodes are quite fast and do not need to use a lot of swap for most workloads
For added stability and to make sure long running jobs do not crash each node has 16 GB of swap

## Head node
For the head node I decided to repurpose my old PC with an i5-7400 and 16GB RAM
The machine runs rocky linux and serves as the DHCP server, iPXE image serving server, and the head-node for Slurm

## Switch
Of course, such a setup need a network switch, I decided to go for something cheap as the NICs on the OptiPlexes can only do 1Gb anyways
On the switch I enabled jumbo-frames for the bit of added performance as well a disabling most reliability features to reduce over head.

### Tradeoffs
Using only 1Gb is one of the biggest limiations of this setup, while currently the communication overhead is acceptable
Adding more than ~8 machines will lead to noticable thrashing; so without some hacky solutions, such as directing memory access MPI peering, it will be hard to scale.
Leaving the only simple upgrade path to be buying new NICs; however, that will be around double the whole budget so far. With the performace being satisfactory, I am not expecting to add more nodes anytime soon.



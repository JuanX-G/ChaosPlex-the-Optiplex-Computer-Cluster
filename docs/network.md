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
Because I had a hard time making the optiplexes respect a static IP, I made static allocations for them on the DHCP server side



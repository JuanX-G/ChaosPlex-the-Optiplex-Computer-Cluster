# ChaosPlex the Optiplex Compute Cluster
A diy compute cluster of 6 nodes for number crunching with MPI, based on Slurm and Warewulf

#### Detailed Notes on Each Section are Available in /docs

## Why
I decided to do this for two main reasons:
1. I am, and was, fascinated by distributed computing and number crunching systems
2. I have acquire 3 of the six Optiplexes reallt cheap which jump started the thing
The project allowed me to learn a ton about HPC and distrubuted systems

## What have I achived
The cluster is now operational, and has already done some serious computing. \
I have setup Slurm and munge for job distribution and Warewulf for image provisioning.
I repasted every unit and updated the bios.

## Network Diagram
![](./figures/diagram1.png)

## Cluster Overview
### Compute nodes
| Component    | Spec                      |
|--------------|---------------------------|
| Model        | 6x Dell Optiplex 9020 SFF |
| CPU          | Intel i5-4570             |
| Total Cores  | 24C / 24T                 |
| RAM          | 12GB / 72 GB total        |
| Storage      | 128GB per unit            |
| Network      | 1 Gbps Ethernet           |
| Scheduler    | Slurm                     |
| Provisioning | Warewulf (iPXE)           |

### Head node
| Component    | Spec                      |
|--------------|---------------------------|
| CPU          | Intel i5-7400             |
| Cores        | 4C / 4T                   |
| RAM          | 16GB                      |
| Storage      | 1TB                       |
| Network      | 2 x 1Gbps Ethernet        |

## Physical Cluster
![Cluster](./figures/photo1.jpg)

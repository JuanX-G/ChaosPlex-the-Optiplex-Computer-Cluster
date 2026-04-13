# ChaosPlex — 6-Node DIY Compute Cluster (Slurm + MPI)
A home-built distributed compute cluster using commodity hardware (Dell Optiplex), running Slurm for job scheduling and OpenMPI for parallel workloads.
- 6 nodes, 24 cores total
- 72 GB RAM
- Warewulf-managed provisioning (iPXE boot)
- Slurm based job management

#### Detailed Notes on Each Section are Available in /docs

## Why
I decided to do this for two main reasons:
1. I am, and was, fascinated by distributed computing and number crunching systems
2. I have acquire 3 of the six Optiplexes really cheap which jump started the thing
The project allowed me to learn a ton about HPC and distributed systems

## Current Status
The cluster is now operational, and has already done some serious computing. \
I have setup Slurm and munge for job distribution and Warewulf for image provisioning.
I repasted every unit and updated the bios.

## Simplified Architecture
- Head node:
  - Slurm controller (`slurmctld`)
  - DHCP + iPXE server
  - Warewulf provisioning

- Worker nodes:
  - network boot via iPXE
  - managed with Warewulf
  - run `slurmd` \

**For more details visit docs/architecture.md**

### Network Diagram
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

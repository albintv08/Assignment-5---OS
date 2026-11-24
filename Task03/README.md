# Task 03 – Virtualisation (A3)

## 1. Objective
Evaluate virtualisation technologies for hosting the University
Result Portal and supporting scalability, isolation and availability.

## 2. Meaning of Virtualisation
Virtualisation allows multiple isolated virtual computing
environments to share the resources of a physical machine.
A hypervisor manages virtual machines and allocates CPU, memory,
storage and network resources.

## 3. Types of Hypervisors

### Type 1 – Bare-Metal Hypervisor
Runs directly on physical hardware. Examples include VMware ESXi,
Microsoft Hyper-V and KVM-based virtualization platforms.
It is suitable for enterprise data centres because it provides
centralized resource management and strong VM isolation.

### Type 2 – Hosted Hypervisor
Runs as an application on a host operating system. Examples include
Oracle VirtualBox and VMware Workstation.
It is useful for development, testing and student laboratories.

## 4. Virtual Machines
A virtual machine has virtual CPU, RAM, disk and network devices.
Each VM can run its own guest operating system. Separate VMs can
host the web tier, application tier and database tier.

## 5. Benefits for the Result Portal
- Isolation between application components.
- Better hardware utilization through resource sharing.
- Ability to create snapshots and restore test environments.
- Easier migration and disaster recovery.
- Independent scaling of web and application servers.

## 6. Limitations
- Hypervisor and guest operating systems consume resources.
- VM startup and provisioning may be slower than containers.
- Poor resource allocation can cause contention.
- High availability requires redundant hosts and storage.

## 7. Proposed Architecture
Use a Type 1 hypervisor cluster in the production data centre.
Deploy separate virtual machines for the reverse proxy, application
services, database and monitoring. Use replicated storage,
network segmentation, backups and load balancing.

## 8. Practical Verification
The accompanying script checks CPU virtualization flags,
hypervisor detection, KVM device availability and virtualization
software commands in the current Ubuntu environment.

This assignment is executed in WSL2. The checks do not represent
a completed deployment of a separate virtual machine.

## 9. Conclusion
Virtualisation provides isolation, consolidation and flexible
resource allocation. A Type 1 hypervisor cluster is appropriate
for the production result portal, while hosted virtualization
is useful for development and testing.

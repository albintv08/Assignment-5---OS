# Task 08 – Bare Metal vs Virtual Machine vs Container (B3)

## 1. Objective
Compare bare-metal servers, virtual machines and containers
for hosting a University Result Portal.

## 2. Bare-Metal Deployment
Bare-metal deployment runs the operating system directly on
physical hardware without a hypervisor layer.

Advantages:
- Direct access to hardware resources.
- High and predictable performance.
- Suitable for specialised workloads.

Disadvantages:
- Higher hardware cost.
- Less flexible resource allocation.
- Scaling requires additional physical machines.
- Hardware failure can interrupt services.

## 3. Virtual-Machine Deployment
A virtual machine runs a guest operating system on a
hypervisor. Multiple VMs can share one physical server.

Advantages:
- Strong isolation between guest operating systems.
- Supports different operating systems.
- Snapshots and VM migration can simplify maintenance.
- Better hardware utilisation than separate physical servers.

Disadvantages:
- Each VM requires its own operating system.
- Additional memory and storage overhead.
- VM startup is generally slower than container startup.

## 4. Container Deployment
Containers package applications and dependencies while
sharing the host operating-system kernel.

Advantages:
- Lightweight compared with full virtual machines.
- Fast startup and deployment.
- Consistent application environments.
- Efficient scaling and resource utilisation.

Disadvantages:
- Containers share the host kernel.
- Isolation depends on kernel and runtime security.
- Persistent data requires suitable storage management.
- Container orchestration adds operational complexity.

## 5. Comparison Table

| Factor | Bare Metal | Virtual Machine | Container |
|---|---|---|---|
| Hardware access | Direct | Through hypervisor | Through host kernel |
| OS requirement | Host OS | Guest OS per VM | Shared host kernel |
| Resource overhead | Low | Higher | Generally low |
| Startup | Hardware/OS boot | Slower | Fast |
| Isolation | Physical/system level | Strong VM boundary | Process/kernel boundary |
| Portability | Limited | VM image portability | Image portability |
| Scaling | Add hardware | Create more VMs | Replicas/orchestration |
| Best use | High-performance workloads | Strong OS isolation | Modern application services |

## 6. University Result Portal Evaluation

The result portal should use a hybrid architecture:

- Bare-metal or cloud physical infrastructure provides the
  underlying compute capacity.
- Virtual machines can separate infrastructure services
  and provide administrative isolation.
- Containers host stateless web and application services.
- A managed or highly available database uses persistent
  storage and regular backups.

## 7. Practical Environment Analysis

The accompanying script records the actual operating
environment available for this assignment.

The current development environment is Ubuntu running under
WSL2. It is not a bare-metal Linux installation. Docker and
virtual-machine management tools are not installed, so this
assignment provides an analytical comparison rather than
claiming unperformed performance benchmarks.

## 8. Engineering Recommendation

Containers are recommended for the stateless web and
application tiers because they support repeatable deployment,
efficient resource use and horizontal scaling.

Virtual machines remain useful where stronger operating-system
isolation or different guest operating systems are required.
Bare-metal servers may be selected for specialised workloads
with strict hardware-performance requirements.

## 9. Conclusion
Each deployment model has different strengths. A hybrid
architecture combining physical infrastructure, virtual
machines and containers provides flexibility, isolation
and efficient application deployment.

# Task 04 – Containerisation (A4)

## 1. Introduction
Containerisation packages an application and its dependencies
into an isolated, portable unit called a container.

## 2. Container Architecture
A container engine manages images, containers, networks and
volumes. Containers share the host operating-system kernel
while maintaining process and filesystem isolation.

## 3. Important Concepts
- Image: Read-only template used to create containers.
- Container: Running instance of an image.
- Registry: Repository for storing and distributing images.
- Volume: Persistent storage for container data.
- Network: Enables communication between containers.

## 4. Containers vs Virtual Machines
Containers share the host kernel and generally start faster.
Virtual machines run separate guest operating systems and
provide a stronger operating-system boundary.

## 5. Proposed Result Portal Containers
- Web: Nginx reverse proxy.
- Application: Result portal application service.
- Database: Relational database service.
- Monitoring: Metrics and health monitoring.

Each service should run independently, use restricted
permissions and communicate through private networks.

## 6. Security
Use trusted minimal images, pin image versions, scan for
vulnerabilities, avoid privileged containers, drop unnecessary
Linux capabilities, set CPU and memory limits, and keep secrets
outside image layers.

## 7. Persistence and Scaling
Use persistent volumes for database data. Application containers
should be stateless so that multiple replicas can be deployed
behind a load balancer.

## 8. Practical Limitation
Docker is not installed in the current Ubuntu WSL2 environment.
The accompanying Dockerfile and Compose file are deployment
artifacts and have not been executed here.

## 9. Conclusion
Containerisation improves portability, consistency and deployment
speed. A multi-service container architecture is appropriate
for the result portal when combined with persistent storage,
monitoring, secure images and orchestration.

# Task 09 – Final Engineering Decision (B4)

## 1. Project Objective

Design a reliable, secure, scalable and cost-effective
operating-system and deployment architecture for a University
Result Portal serving 150,000 students.

The portal must support students accessing examination results
within a two-hour publication window.

## 2. Workload Analysis

Assumption: each of the 150,000 students makes at least one
result request during the two-hour period.

Total time:
2 hours = 7,200 seconds

Average request rate:

150,000 / 7,200 = approximately 20.83 requests per second.

This is an average, not a peak capacity estimate. Actual traffic
may be much higher immediately after results are published.
The system must therefore be load-tested using realistic
concurrent-user and burst-traffic scenarios.

## 3. Final Architecture

The recommended architecture is a cloud-hosted hybrid design.

### Architecture Flow

Students
  |
  v
DNS and HTTPS Load Balancer
  |
  v
Web Application Firewall
  |
  v
Kubernetes Ingress
  |
  v
Multiple Containerised Web/Application Replicas
  |
  v
Database Connection Pool
  |
  v
Highly Available Database
  |
  v
Encrypted Persistent Storage and Backups

Supporting services:
- Centralised logging and monitoring
- Identity and access management
- Automated backups and recovery
- Container image registry
- CI/CD deployment pipeline

## 4. Operating-System Decision

Use a stable, supported Linux server distribution for the
underlying cloud infrastructure.

The Linux operating system provides:
- Process and thread management.
- Memory and virtual-memory management.
- File-system and storage management.
- Networking and security controls.
- Service management through systemd.
- Logging and system monitoring.

Use separate administrative roles and least-privilege access.
Application processes should not run as root.

## 5. Deployment Model Decision

A hybrid model is recommended.

### Physical Infrastructure
Cloud provider physical servers provide the underlying
compute, storage and network resources.

### Virtual Machines
Use VMs where infrastructure isolation, independent operating
systems or specialised administration are required.

### Containers
Use containers for stateless web and application services.
They provide consistent deployment, efficient resource use
and convenient horizontal scaling.

### Database
Use a managed or highly available database with persistent
storage. Database state must not be stored only inside
temporary application containers.

## 6. Scalability Strategy

- Run multiple application replicas across worker nodes.
- Use a load balancer to distribute incoming traffic.
- Configure horizontal scaling based on CPU, memory and
  application-level metrics.
- Use database connection pooling.
- Apply caching for frequently accessed, non-sensitive data.
- Conduct load testing before the result publication event.

The initial Kubernetes design uses three replicas and an
autoscaling range of 3 to 20 replicas. These are proposed
starting values, not validated production capacity figures.
Final values must be determined through load testing.

## 7. Security Strategy

- Enforce HTTPS for all external connections.
- Use multi-factor authentication for administrators.
- Apply role-based access control.
- Restrict database access to application services.
- Store secrets in a secure secrets manager.
- Encrypt sensitive data at rest and in transit.
- Apply operating-system and application security updates.
- Use container images from trusted sources.
- Run containers as non-root users.
- Maintain audit logs and monitor suspicious activity.

## 8. Availability and Recovery

- Deploy application replicas across multiple worker nodes.
- Use health checks and automatic restart policies.
- Use database replication or a managed high-availability
  database service.
- Maintain encrypted, regularly tested backups.
- Monitor CPU, memory, disk, network and application errors.
- Document incident response and disaster recovery procedures.

Proposed recovery objectives:
- Recovery Time Objective (RTO): 1 hour.
- Recovery Point Objective (RPO): 15 minutes.

These are design targets and require suitable backup,
replication and recovery testing.

## 9. Cost and Resource Management

- Use autoscaling to avoid permanently over-provisioning.
- Select VM and database sizes based on measured workloads.
- Use resource requests and limits for containers.
- Monitor cloud resource consumption.
- Apply storage lifecycle policies to old backups and logs.
- Review cost and performance after each major result event.

## 10. Risks and Mitigation

| Risk | Mitigation |
|---|---|
| Sudden traffic spike | Load balancing, caching and autoscaling |
| Database overload | Connection pooling, indexing and capacity testing |
| Server failure | Multiple replicas and node redundancy |
| Data loss | Replication and tested backups |
| Security breach | MFA, RBAC, encryption and audit logging |
| Deployment failure | Rolling updates and rollback procedures |
| High cloud cost | Resource monitoring and autoscaling |

## 11. Final Engineering Decision

The recommended solution is a Linux-based cloud platform
using virtual machines where isolation is required and
Kubernetes-managed containers for the stateless application
tier.

A highly available database with persistent storage,
encrypted backups, HTTPS, role-based access control,
monitoring and autoscaling completes the design.

This approach balances performance, scalability, security,
availability, maintainability and operational cost.

## 12. Practical Limitations

The assignment implementation and evidence were collected
in Ubuntu under WSL2. Docker, Kubernetes and VM management
tools were not installed in the environment.

Therefore, the container and Kubernetes configurations
are proposed implementation artifacts. No live cloud
deployment, production load test or benchmark is claimed.

The average request-rate calculation is based on the stated
workload assumption. Production sizing requires realistic
traffic modelling and performance testing.

## 13. Conclusion

A hybrid Linux, virtual-machine and container architecture
is the recommended engineering solution for the University
Result Portal. It provides a practical foundation for
handling result-publication traffic while supporting
security, reliability, scalability and future growth.

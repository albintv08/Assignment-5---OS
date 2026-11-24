# Task 05 – Cloud and Kubernetes Design (A5)

## 1. Objective
Design a scalable cloud architecture for the University Result
Portal, supporting 150,000 students accessing results within
two hours.

## 2. Cloud Architecture
The proposed architecture contains:
1. DNS and HTTPS load balancer.
2. Kubernetes ingress controller.
3. Multiple stateless web and application replicas.
4. Database service with persistent storage.
5. Monitoring, logging and backup services.

## 3. Kubernetes
Kubernetes is a container orchestration platform. It manages
container deployment, scheduling, service discovery, health
checks, scaling and recovery.

## 4. Deployment Strategy
Deploy multiple application replicas across worker nodes.
Use readiness and liveness probes to detect unhealthy instances.
Use resource requests and limits to manage CPU and memory.

## 5. Scaling
A Horizontal Pod Autoscaler can increase replicas based on CPU
utilization. Capacity planning and load testing are required
before the result publication event.

## 6. Reliability and Security
Use multiple worker nodes, network policies, RBAC, encrypted
secrets, persistent database storage and regular backups.
Deploy updates using rolling updates and retain rollback options.

## 7. Practical Limitation
Kubernetes tools are not installed in the current WSL2
environment. The YAML files are proposed deployment manifests
and have not been applied to a live cluster.

## 8. Conclusion
Cloud infrastructure with Kubernetes can provide scalable,
resilient application deployment. Production use requires
load testing, database capacity planning, monitoring and
multi-zone availability.

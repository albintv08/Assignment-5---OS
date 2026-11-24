# Task 07 – Docker Containerisation (B2)

## 1. Objective
Containerise a University Result Portal web application using
Docker to provide consistent and isolated deployment.

## 2. Application
The application is implemented using Python's built-in HTTP
server. It provides a portal home page and a health endpoint
at `/health`.

## 3. Docker Image
The Dockerfile uses a lightweight Python Alpine base image.
The application is copied into the image and runs as a
non-root user to reduce security risks.

## 4. Container Configuration
Docker Compose defines the result-portal service and maps
host port 8081 to container port 8080.

## 5. Resource Management
The Compose configuration limits memory to 128 MB and CPU
to 0.5 cores. The container uses a read-only root filesystem,
a temporary filesystem for `/tmp`, and no-new-privileges
security protection.

## 6. Health Monitoring
The Dockerfile defines a health check that requests the
application's `/health` endpoint. Docker can use this check
to report container health.

## 7. Execution Instructions
From the Task07 directory:

- `./run_docker.sh start` builds and starts the application.
- `./run_docker.sh status` displays container status.
- `./run_docker.sh logs` displays application logs.
- `./run_docker.sh stop` stops and removes the container.

When running, access the application at
`http://localhost:8081`.

## 8. Practical Limitation
Docker is not installed in the current WSL2 environment.
The Dockerfile and Compose configuration are provided as
implementation artifacts but have not been built or executed.
No container runtime results are claimed.

## 9. Conclusion
Docker packages the application and its runtime into an
isolated container. Non-root execution, health checks and
resource limits improve security and operational management.

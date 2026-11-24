# Task 02 – Linux System Administration Design (A2)

## 1. Objective
Design a secure and manageable Linux server environment for the
University Result Portal, supporting 150,000 students during the
two-hour result publication period.

## 2. User and Group Administration
Create separate accounts and groups for administration and services.
Suggested groups:
- portal-admin: authorized system administrators
- portal-app: application deployment team
- portal-db: database administrators
- portal-monitor: monitoring personnel

The application must run under a dedicated non-root service account.
Administrative access should use sudo with least privilege.

## 3. File and Directory Permissions
Suggested directory structure:
- /var/www/result-portal: application files
- /etc/result-portal: configuration and secrets
- /var/log/result-portal: application logs
- /var/backups/result-portal: backups

Recommended permissions:
- Application files: owner root, group portal-app, mode 750
- Configuration: root-owned, mode 640
- Logs: service-owned, restricted group access
- Backups: restricted access, encrypted off-host copies

Secrets must not be stored in source control.

## 4. Service Management
Use systemd to manage the application service.
Configure automatic restart on failure, controlled startup,
service dependencies and resource limits.
Use a reverse proxy such as Nginx for HTTPS termination.

## 5. Network Security
- Permit HTTPS (TCP 443) from authorized networks.
- Redirect HTTP (TCP 80) to HTTPS.
- Restrict SSH (TCP 22) to administrator networks.
- Do not expose the database port publicly.
- Use a firewall and network segmentation.

## 6. Monitoring and Logging
Monitor CPU, memory, disk space, network traffic, application
health, database connections and HTTP response time.
Centralize logs and configure alerts for service failures,
high resource usage and low disk space.

## 7. Backup and Recovery
- Perform regular database backups.
- Encrypt backups and store copies off-site.
- Test restoration periodically.
- Define recovery point objective (RPO) and recovery time objective (RTO).
- Maintain a documented disaster-recovery procedure.

## 8. Updates and Maintenance
Apply security updates after testing. Use controlled maintenance
windows, audit privileged access and review authentication logs.
Keep the operating system and application dependencies patched.

## 9. Practical Verification
The `admin_audit.sh` script collects actual service, user,
permission, storage, memory and network information.

## 10. Conclusion
A secure result portal requires least-privilege accounts,
restricted permissions, firewall controls, systemd service
management, centralized monitoring and tested backups.
Production deployment should use redundant servers and a
load balancer to handle peak result-day traffic.

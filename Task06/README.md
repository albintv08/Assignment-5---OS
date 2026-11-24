# Task 06 – Linux Server Administration (B1)

## 1. Objective
Demonstrate Linux server administration operations relevant
to maintaining a University Result Portal.

## 2. User Administration
Linux user and group management supports role separation.
Administrators should use individual accounts and least-privilege
sudo access. Application services should run as non-root users.

## 3. Service Administration
systemd manages Linux services. Administrators can inspect
service status, start or stop services, enable startup and
investigate failed units.

## 4. Process and Resource Monitoring
Use ps and top to inspect processes. Use free to monitor memory,
df to monitor disk space, and ss to inspect network sockets.

## 5. Logging
systemd journal and rsyslog provide system log information.
Logs help diagnose service failures and security events.

## 6. Scheduled Maintenance
cron can schedule recurring tasks such as backup scripts,
log rotation checks and database maintenance.

## 7. Security and Permissions
Use restricted file permissions, sudo auditing, security
updates and firewall rules. Do not expose database services
to public networks.

## 8. Practical Implementation
The `server_admin.sh` script collects real system administration
evidence without changing system configuration.

## 9. Conclusion
Linux administration tools provide service control, monitoring,
logging, scheduled maintenance and access control required
for a reliable production server.

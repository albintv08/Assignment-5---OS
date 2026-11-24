# Task 01 – Linux System Components (A1)

## 1. Introduction

Linux is an open-source, multiuser and multitasking operating system.
It provides the foundation for hosting the University Result Portal,
which must support approximately 150,000 students accessing results
within a two-hour period.

## 2. Major Linux System Components

### 2.1 Kernel
The kernel is the core of Linux. It manages CPU scheduling, memory,
processes, devices, system calls and communication between hardware
and software. It ensures efficient allocation of resources when
many students access the portal simultaneously.

### 2.2 Shell
The shell provides a command-line interface between users and the
operating system. Administrators use Bash commands and scripts to
manage services, inspect logs and automate maintenance.

### 2.3 Process Management
Linux creates and manages processes for portal services such as
the web server, application server and database. Process scheduling
shares CPU time between concurrent requests.

### 2.4 Memory Management
The kernel allocates RAM to running processes and uses virtual memory
and swap space when required. Memory isolation helps prevent one
process from interfering with another.

### 2.5 File System
The Linux file system organizes files and directories. Portal
application files, configuration files, database backups and logs
can be stored with appropriate permissions.

### 2.6 Device Drivers
Device drivers allow the kernel to communicate with hardware such
as storage devices, network interfaces and other peripherals.

### 2.7 Networking
Linux networking supports TCP/IP communication, routing, sockets
and firewall rules. It enables students to connect to the result
portal through the university network or the Internet.

## 3. Application to the University Result Portal

| Component | Portal application |
|---|---|
| Kernel | Allocates CPU and system resources |
| Shell | Administrative commands and automation |
| Process management | Handles concurrent portal services |
| Memory management | Allocates RAM to application processes |
| File system | Stores portal files, logs and backups |
| Device drivers | Communicates with server hardware |
| Networking | Handles student requests and responses |

## 4. Practical Verification

The accompanying `inspect_linux.sh` script collects actual
information about the Linux kernel, CPU, memory, processes,
file systems and network interfaces.

Run the script and examine `outputs/system_inspection.txt`.

## 5. Result and Conclusion

Linux provides the essential operating-system services required
for a university result portal. Its process scheduling, memory
management, file-system permissions and networking capabilities
support reliable multiuser operation. Production deployment
should additionally use monitoring, security controls, backups
and load balancing.

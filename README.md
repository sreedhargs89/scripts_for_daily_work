# AWS Scripts for Daily Work

A collection of automation scripts for AWS daily operations and workflows.

## Overview

This repository contains various shell scripts to automate common AWS tasks, making daily operations more efficient and reducing manual work.

## Prerequisites

- AWS CLI installed and configured with appropriate credentials
- Bash shell environment
- Appropriate AWS IAM permissions for the operations performed by each script

## Scripts

### 1. Windows EC2 Automation (`win_automation.sh`)

Automates the process of retrieving connection details for Windows EC2 instances.

**Features:**
- Fetches the current public IP address of a Windows EC2 instance
- Retrieves and decrypts the Administrator password
- Provides ready-to-use Remote Desktop connection details

**Configuration Required:**
- `INSTANCE_ID`: Your EC2 instance ID
- `REGION`: AWS region (e.g., ap-south-1)
- `PEM_KEY_PATH`: Path to your .pem private key file
- `USERNAME`: Windows username (default: Administrator)

**Usage:**
```bash
# Edit the script to set your configuration values
nano win_automation.sh

# Make it executable
chmod +x win_automation.sh

# Run the script
./win_automation.sh
```

**Output:**
- Public IP address for RDP connection
- Decrypted Administrator password

## Adding New Scripts

As this repository grows, new scripts will be added here. Each script will include:
- Description of functionality
- Required configuration
- Usage instructions
- Example output

## Security Notes

⚠️ **Important:**
- Never commit your `.pem` files or AWS credentials to this repository
- Keep your private keys secure and with appropriate permissions (chmod 400)
- Use IAM roles with least privilege principle
- Consider using AWS Systems Manager Session Manager as an alternative to RDP when possible

## Contributing

Feel free to add more automation scripts following the same documentation pattern.

## License

This is a personal utility repository for daily AWS operations.

---

*Last updated: 2025-10-29*

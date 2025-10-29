# I have AWS```bash
#!/bin/bash

# Configuration
INSTANCE_ID="i-0cbb517803b75e962" # Replace with your EC2 instance ID
REGION="ap-south-1"         # e.g., us-east-1
PEM_KEY_PATH="/Users/sree/.ssh/sree-devops-key-mumbai.pem" # Replace with the path to your .pem file
USERNAME="Administrator"         # Default Windows username

# 1. Get the new Public IP
echo "Fetching new Public IP for instance $INSTANCE_ID..."
NEW_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text \
  --region $REGION)

if [ -z "$NEW_IP" ]; then
  echo "Error: Could not retrieve Public IP. Please check instance ID and region."
  exit 1
fi

echo "New Public IP: $NEW_IP"
echo "You can now connect to $NEW_IP using Windows Remote Desktop."

# 2. Get the new password
echo "Fetching new password for instance $INSTANCE_ID..."
PASSWORD_DATA=$(aws ec2 get-password-data \
  --instance-id $INSTANCE_ID \
  --priv-launch-key $PEM_KEY_PATH \
  --query 'PasswordData' \
  --output text \
  --region $REGION)

if [ -z "$PASSWORD_DATA" ]; then
  echo "Error: Could not retrieve password data. Ensure the instance is running and the PEM key path is correct."
  exit 1
fi

# Decrypt the password (this step is usually handled by the AWS CLI or RDP client)
# The `get-password-data` command decrypts it directly if --priv-launch-key-file is used.
# So, PASSWORD_DATA should already be the decrypted password.

echo "Decrypted Password for $USERNAME: $PASSWORD_DATA"
echo "Use this password to log in via Remote Desktop."

# Optional: Open Remote Desktop Connection (Windows specific command, won't work on Linux/macOS directly)
# If you are running this script on a Windows machine, you might use something like:
# mstsc /v:$NEW_IP

echo "Script finished."
```
```
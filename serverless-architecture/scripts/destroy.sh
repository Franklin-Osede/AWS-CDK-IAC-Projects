#!/bin/bash

# Serverless Architecture - Destroy Script
# This script destroys the complete serverless infrastructure

set -e

echo "🗑️  Starting Serverless Architecture Destruction..."
echo "=================================================="

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS CLI not configured. Please run 'aws configure' first."
    exit 1
fi

echo "✅ AWS CLI configured"

# Confirm destruction
echo "⚠️  WARNING: This will destroy ALL infrastructure!"
echo "💰 This will stop all costs immediately."
echo ""
read -p "Are you sure you want to continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Destruction cancelled."
    exit 1
fi

# Destroy infrastructure
echo "🏗️  Destroying infrastructure..."
cdk destroy --force

echo "✅ Infrastructure destroyed successfully!"

# Show completion message
echo ""
echo "🎉 SERVERLESS ARCHITECTURE DESTROYED!"
echo "===================================="
echo ""
echo "✅ All resources deleted:"
echo "  • Lambda Function: DELETED"
echo "  • API Gateway: DELETED"
echo "  • DynamoDB Table: DELETED"
echo "  • S3 Bucket: DELETED"
echo "  • CloudFront Distribution: DELETED"
echo "  • Cognito User Pool: DELETED"
echo "  • CloudWatch Dashboard: DELETED"
echo "  • SNS Topic: DELETED"
echo ""
echo "💰 No more costs will be incurred!"
echo "🔄 Run './scripts/create.sh' to recreate when needed."
echo ""

#!/bin/bash

# Serverless Architecture - Create Script
# This script creates the complete serverless infrastructure

set -e

echo "🚀 Starting Serverless Architecture Creation..."
echo "================================================"

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS CLI not configured. Please run 'aws configure' first."
    exit 1
fi

echo "✅ AWS CLI configured"

# Install dependencies
echo "📦 Installing dependencies..."
npm install
npm install -g aws-cdk

echo "✅ Dependencies installed"

# Deploy infrastructure
echo "🏗️  Deploying infrastructure..."
cdk deploy --require-approval never

echo "✅ Infrastructure deployed successfully!"

# Show important information
echo ""
echo "🎉 SERVERLESS ARCHITECTURE CREATED!"
echo "=================================="
echo ""
echo "📋 Resources created:"
echo "  • Lambda Function: serverless-api"
echo "  • API Gateway: Serverless API"
echo "  • DynamoDB Table: serverless-data"
echo "  • S3 Bucket: serverless-assets-*"
echo "  • CloudFront Distribution"
echo "  • Cognito User Pool: serverless-users"
echo "  • CloudWatch Dashboard: ServerlessArchitecture"
echo "  • SNS Topic: serverless-notifications"
echo ""
echo "🌐 View in AWS Console:"
echo "  • Lambda: https://console.aws.amazon.com/lambda/"
echo "  • API Gateway: https://console.aws.amazon.com/apigateway/"
echo "  • DynamoDB: https://console.aws.amazon.com/dynamodb/"
echo "  • S3: https://console.aws.amazon.com/s3/"
echo "  • CloudFront: https://console.aws.amazon.com/cloudfront/"
echo "  • Cognito: https://console.aws.amazon.com/cognito/"
echo "  • CloudWatch: https://console.aws.amazon.com/cloudwatch/"
echo "  • SNS: https://console.aws.amazon.com/sns/"
echo ""
echo "⚠️  IMPORTANT: Run './scripts/destroy.sh' when done to avoid costs!"
echo ""

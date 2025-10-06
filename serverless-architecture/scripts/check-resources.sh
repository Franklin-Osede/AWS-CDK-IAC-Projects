#!/bin/bash

# Serverless Architecture - Check Resources Script
# This script verifies that all resources are working correctly

set -e

echo "🔍 Checking Serverless Architecture Resources..."
echo "================================================"

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS CLI not configured. Please run 'aws configure' first."
    exit 1
fi

echo "✅ AWS CLI configured"

# Get account info
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=$(aws configure get region)
echo "📋 Account: $ACCOUNT_ID | Region: $REGION"
echo ""

# Check Lambda Function
echo "🔍 Checking Lambda Function..."
if aws lambda get-function --function-name serverless-api > /dev/null 2>&1; then
    echo "✅ Lambda Function: serverless-api - ACTIVE"
    LAMBDA_URL=$(aws lambda get-function --function-name serverless-api --query 'Configuration.FunctionUrl' --output text 2>/dev/null || echo "N/A")
    echo "   📍 Function URL: $LAMBDA_URL"
else
    echo "❌ Lambda Function: serverless-api - NOT FOUND"
fi

# Check API Gateway
echo "🔍 Checking API Gateway..."
API_ID=$(aws apigateway get-rest-apis --query 'items[?name==`Serverless API`].id' --output text 2>/dev/null || echo "")
if [ ! -z "$API_ID" ]; then
    echo "✅ API Gateway: Serverless API - ACTIVE"
    echo "   📍 API ID: $API_ID"
    echo "   🌐 API URL: https://$API_ID.execute-api.$REGION.amazonaws.com/prod"
else
    echo "❌ API Gateway: Serverless API - NOT FOUND"
fi

# Check DynamoDB Table
echo "🔍 Checking DynamoDB Table..."
if aws dynamodb describe-table --table-name serverless-data > /dev/null 2>&1; then
    echo "✅ DynamoDB Table: serverless-data - ACTIVE"
    TABLE_STATUS=$(aws dynamodb describe-table --table-name serverless-data --query 'Table.TableStatus' --output text)
    echo "   📊 Status: $TABLE_STATUS"
else
    echo "❌ DynamoDB Table: serverless-data - NOT FOUND"
fi

# Check S3 Bucket
echo "🔍 Checking S3 Bucket..."
BUCKET_NAME="serverless-assets-$ACCOUNT_ID-$REGION"
if aws s3 ls s3://$BUCKET_NAME > /dev/null 2>&1; then
    echo "✅ S3 Bucket: $BUCKET_NAME - ACTIVE"
    BUCKET_SIZE=$(aws s3 ls s3://$BUCKET_NAME --recursive --human-readable --summarize | tail -1 | awk '{print $3, $4}')
    echo "   📦 Size: $BUCKET_SIZE"
else
    echo "❌ S3 Bucket: $BUCKET_NAME - NOT FOUND"
fi

# Check CloudFront Distribution
echo "🔍 Checking CloudFront Distribution..."
DISTRIBUTION_ID=$(aws cloudfront list-distributions --query 'DistributionList.Items[?Comment==`Serverless Architecture CDN`].Id' --output text 2>/dev/null || echo "")
if [ ! -z "$DISTRIBUTION_ID" ]; then
    echo "✅ CloudFront Distribution: $DISTRIBUTION_ID - ACTIVE"
    DISTRIBUTION_DOMAIN=$(aws cloudfront get-distribution --id $DISTRIBUTION_ID --query 'Distribution.DomainName' --output text 2>/dev/null || echo "N/A")
    echo "   🌐 Domain: $DISTRIBUTION_DOMAIN"
else
    echo "❌ CloudFront Distribution - NOT FOUND"
fi

# Check Cognito User Pool
echo "🔍 Checking Cognito User Pool..."
USER_POOL_ID=$(aws cognito-idp list-user-pools --max-items 10 --query 'UserPools[?Name==`serverless-users`].Id' --output text 2>/dev/null || echo "")
if [ ! -z "$USER_POOL_ID" ]; then
    echo "✅ Cognito User Pool: serverless-users - ACTIVE"
    echo "   📍 User Pool ID: $USER_POOL_ID"
else
    echo "❌ Cognito User Pool: serverless-users - NOT FOUND"
fi

# Check CloudWatch Dashboard
echo "🔍 Checking CloudWatch Dashboard..."
if aws cloudwatch get-dashboard --dashboard-name ServerlessArchitecture > /dev/null 2>&1; then
    echo "✅ CloudWatch Dashboard: ServerlessArchitecture - ACTIVE"
    echo "   📊 Dashboard URL: https://console.aws.amazon.com/cloudwatch/home?region=$REGION#dashboards:name=ServerlessArchitecture"
else
    echo "❌ CloudWatch Dashboard: ServerlessArchitecture - NOT FOUND"
fi

# Check SNS Topic
echo "🔍 Checking SNS Topic..."
TOPIC_ARN=$(aws sns list-topics --query 'Topics[?contains(TopicArn, `serverless-notifications`)]' --output text 2>/dev/null || echo "")
if [ ! -z "$TOPIC_ARN" ]; then
    echo "✅ SNS Topic: serverless-notifications - ACTIVE"
    echo "   📍 Topic ARN: $TOPIC_ARN"
else
    echo "❌ SNS Topic: serverless-notifications - NOT FOUND"
fi

echo ""
echo "🎯 SUMMARY"
echo "=========="
echo "✅ Use './scripts/create.sh' to create infrastructure"
echo "✅ Use './scripts/destroy.sh' to remove infrastructure"
echo "✅ Use './scripts/check-resources.sh' to verify status"
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

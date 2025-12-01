# AWS CDK Serverless Architecture

> **Enterprise-grade serverless infrastructure** built with AWS CDK v2, featuring API Gateway, Lambda functions, DynamoDB, S3, CloudFront CDN, Cognito authentication, and comprehensive monitoring with CloudWatch.

[![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=flat&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![AWS CDK](https://img.shields.io/badge/AWS%20CDK-v2-FF9900?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/cdk/)
[![Node.js](https://img.shields.io/badge/Node.js-18+-339933?style=flat&logo=node.js&logoColor=white)](https://nodejs.org/)

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [AWS Infrastructure](#aws-infrastructure)
- [Getting Started](#getting-started)
- [Development](#development)
- [Deployment](#deployment)
- [Monitoring & Observability](#monitoring--observability)
- [Security](#security)
- [Cost Optimization](#cost-optimization)
- [Roadmap](#roadmap)
- [License](#license)

---

## Overview

This project demonstrates a production-ready serverless architecture on AWS, implemented using Infrastructure as Code (IaC) with AWS CDK v2. The infrastructure includes:

- **API Gateway**: RESTful API with CORS, throttling, and request/response logging
- **Lambda Functions**: Serverless compute with environment variables and IAM permissions
- **DynamoDB**: NoSQL database with Global Secondary Indexes and encryption
- **S3**: Object storage with versioning, lifecycle policies, and encryption
- **CloudFront**: Global CDN for content delivery with HTTPS enforcement
- **Cognito**: User authentication and authorization with strong password policies
- **CloudWatch**: Comprehensive monitoring with dashboards and alarms
- **SNS**: Notification service for alerting

### Key Features

- **Serverless Architecture**: No servers to manage, automatic scaling, pay-per-use pricing
- **Infrastructure as Code**: Type-safe infrastructure definitions with TypeScript
- **Security Best Practices**: Encryption at rest and in transit, IAM least privilege, secure defaults
- **Monitoring & Alerting**: Real-time dashboards and automated alerts for critical metrics
- **Cost Optimization**: Pay-per-request DynamoDB, S3 lifecycle policies, CloudFront caching
- **High Availability**: Multi-AZ deployment with automatic failover
- **Automated Scripts**: Deployment, destruction, and resource verification scripts

---

## Architecture

### High-Level Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Client Applications                       │
│              (Web, Mobile, API Clients)                      │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────────────┐
│              CloudFront CDN                                 │
│         (Global Content Delivery)                            │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────────────┐
│              API Gateway (REST API)                          │
│    (CORS, Throttling, Request/Response Logging)            │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────────────┐
│              Lambda Functions                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │   API Lambda │  │  (Extensible)│  │  (Extensible)│      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
└─────────┼─────────────────┼─────────────────┼─────────────┘
          │                 │                 │
    ┌─────┴─────┬───────────┴───────────┬─────┴─────┐
    │           │                       │           │
┌───▼───┐ ┌────▼────┐ ┌──────────────┐ ┌─────────▼──┐
│DynamoDB│ │   S3    │ │   Cognito    │ │  CloudWatch│
│        │ │  Bucket │ │  User Pool   │ │  Dashboard │
└────────┘ └─────────┘ └──────────────┘ └───────────┘
    │
    │
┌───▼───────────────────────────────────────────────────────┐
│              SNS Topic                                     │
│         (Notifications & Alerts)                          │
└────────────────────────────────────────────────────────────┘
```

### Technology Stack

**Infrastructure:**
- AWS CDK v2.100.0
- TypeScript 5.0.4
- Node.js 18+

**AWS Services:**
- API Gateway (REST API)
- Lambda (Node.js 18.x)
- DynamoDB (On-demand billing)
- S3 (Versioned, encrypted)
- CloudFront (Global CDN)
- Cognito (User authentication)
- CloudWatch (Monitoring & Logging)
- SNS (Notifications)

---

## Project Structure

```
AWS-CDK-IAC-Projects/
├── serverless-architecture/
│   ├── bin/
│   │   └── serverless-app.ts          # CDK app entry point
│   ├── lib/
│   │   └── serverless-stack.ts         # Main infrastructure stack
│   ├── scripts/
│   │   ├── create.sh                   # Deployment script
│   │   ├── destroy.sh                  # Cleanup script
│   │   └── check-resources.sh          # Resource verification
│   ├── cdk.json                        # CDK configuration
│   ├── tsconfig.json                   # TypeScript configuration
│   ├── package.json                    # Dependencies and scripts
│   └── README.md                       # Project documentation
└── README.md                           # Repository documentation
```

### Key Files

**`bin/serverless-app.ts`**
- CDK application entry point
- Creates and configures the main stack
- Sets environment variables and resource tags

**`lib/serverless-stack.ts`**
- Main infrastructure definition
- Defines all AWS resources
- Configures security, monitoring, and outputs

**`scripts/create.sh`**
- Automated deployment script
- Builds and deploys infrastructure
- Includes prerequisite checks

**`scripts/destroy.sh`**
- Cleanup script for resource removal
- Safely destroys all stack resources

**`scripts/check-resources.sh`**
- Resource verification utility
- Lists all created resources
- Provides cost analysis

---

## AWS Infrastructure

### Core Services

#### Compute

**Lambda Functions**

- **Function**: `serverless-api`
- **Runtime**: Node.js 18.x
- **Memory**: 256 MB
- **Timeout**: 30 seconds
- **Environment Variables**:
  - `TABLE_NAME`: DynamoDB table name
  - `BUCKET_NAME`: S3 bucket name
  - `USER_POOL_ID`: Cognito User Pool ID
  - `USER_POOL_CLIENT_ID`: Cognito Client ID
- **Permissions**: Read/write access to DynamoDB and S3
- **Log Retention**: 1 month

#### API & Networking

**API Gateway (REST API)**

- **Type**: REST API (Regional)
- **Stage**: `prod`
- **Features**:
  - CORS enabled for all origins
  - Throttling: 1000 requests/second (rate), 2000 requests (burst)
  - Request/Response logging enabled
  - Data tracing enabled
  - Metrics enabled
- **Endpoints**:
  - `GET /api/v1/health` - Health check endpoint
  - `GET /api/v1/data` - Retrieve data
  - `POST /api/v1/data` - Create data

**CloudFront Distribution**

- **Origin**: S3 bucket
- **Protocol**: HTTPS only (redirects HTTP)
- **Caching**: Optimized cache policy
- **Compression**: Enabled
- **Price Class**: Price Class 100 (US, Canada, Europe)
- **HTTP Version**: HTTP/2

#### Data & Storage

**DynamoDB Table**

- **Table Name**: `serverless-data`
- **Partition Key**: `id` (String)
- **Sort Key**: `timestamp` (Number)
- **Billing Mode**: Pay-per-request (on-demand)
- **Encryption**: AWS managed encryption
- **Point-in-Time Recovery**: Enabled
- **Global Secondary Index**: `status-index`
  - Partition Key: `status` (String)
  - Sort Key: `createdAt` (Number)

**S3 Bucket**

- **Bucket Name**: `serverless-assets-{account}-{region}`
- **Versioning**: Enabled
- **Encryption**: S3 managed encryption (SSE-S3)
- **Public Access**: Blocked (all public access blocked)
- **Lifecycle Rules**:
  - Delete incomplete multipart uploads after 1 day
  - Transition to Infrequent Access after 30 days
- **Auto-delete**: Enabled on stack deletion

#### Authentication & Authorization

**Cognito User Pool**

- **User Pool Name**: `serverless-users`
- **Self Sign-Up**: Enabled
- **Sign-In Aliases**: Email and username
- **Email Verification**: Automatic
- **Standard Attributes**:
  - Email (required, mutable)
  - Given Name (required, mutable)
  - Family Name (required, mutable)
- **Password Policy**:
  - Minimum length: 8 characters
  - Requires lowercase, uppercase, digits, and symbols
- **Account Recovery**: Email only
- **OAuth Scopes**: OpenID, Email, Profile

**Cognito User Pool Client**

- **Client Name**: `serverless-client`
- **Auth Flows**: User password and SRP
- **OAuth**: Implicit code grant enabled
- **Secret**: Not generated (public client)

#### Monitoring & Observability

**CloudWatch Dashboard**

- **Dashboard Name**: `ServerlessArchitecture`
- **Widgets**:
  - API Gateway Requests (Count)
  - Lambda Invocations (Count)
  - DynamoDB Read/Write Capacity (Consumed units)
  - CloudFront Requests (Count)

**CloudWatch Alarms**

- **High Error Rate Alarm**:
  - Metric: API Gateway 4XX errors
  - Threshold: 10 errors
  - Evaluation Periods: 2
  - Action: SNS notification

- **High Latency Alarm**:
  - Metric: API Gateway latency
  - Threshold: 2000ms (2 seconds)
  - Evaluation Periods: 2
  - Action: SNS notification

**CloudWatch Logs**

- Lambda function logs: `/aws/lambda/serverless-api`
- Log retention: 1 month
- API Gateway access logs: Enabled

#### Notifications

**SNS Topic**

- **Topic Name**: `serverless-notifications`
- **Display Name**: Serverless Architecture Notifications
- **Subscribers**: Configurable (email, SMS, etc.)
- **Integration**: CloudWatch alarms send notifications to this topic

### Infrastructure Outputs

After deployment, the stack outputs:

- **API Gateway URL**: REST API endpoint URL
- **CloudFront URL**: CDN distribution domain
- **User Pool ID**: Cognito User Pool identifier
- **User Pool Client ID**: Cognito Client identifier
- **DynamoDB Table Name**: Table name for application use
- **S3 Bucket Name**: Bucket name for asset storage
- **Dashboard URL**: Direct link to CloudWatch dashboard

---

## Getting Started

### Prerequisites

- **Node.js**: v18 or higher
- **npm**: v9 or higher (comes with Node.js)
- **AWS CLI**: Configured with appropriate credentials
- **AWS CDK CLI**: v2.100.0 or higher
- **AWS Account**: With appropriate permissions for resource creation
- **Git**: For version control

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd AWS-CDK-IAC-Projects

# Navigate to the serverless architecture project
cd serverless-architecture

# Install dependencies
npm install

# Install AWS CDK globally (if not already installed)
npm install -g aws-cdk
```

### Bootstrap CDK (First Time Only)

Before deploying for the first time, bootstrap CDK in your AWS account and region:

```bash
cdk bootstrap
```

This creates the necessary S3 bucket and IAM roles for CDK deployments.

### Environment Setup

Set environment variables for CDK deployment:

```bash
export CDK_DEFAULT_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
export CDK_DEFAULT_REGION=us-east-1  # Change to your preferred region
```

Or configure in your AWS CLI:

```bash
aws configure
```

### Quick Start

```bash
# Build the project
npm run build

# Synthesize CloudFormation template (preview changes)
cdk synth

# View differences (before deployment)
cdk diff

# Deploy the stack
cdk deploy

# Or use the deployment script
./scripts/create.sh
```

---

## Development

### Local Development

**Build the project:**

```bash
npm run build
```

**Watch mode (auto-rebuild on changes):**

```bash
npm run watch
```

**Type checking:**

```bash
npx tsc --noEmit
```

### Project Scripts

```bash
# Build TypeScript to JavaScript
npm run build

# Watch for changes and rebuild
npm run watch

# Run tests (if configured)
npm run test

# CDK commands
npm run cdk              # Run CDK CLI
npm run deploy           # Deploy all stacks
npm run destroy          # Destroy all stacks
```

### CDK Commands

```bash
# List all stacks
cdk list

# Synthesize CloudFormation template
cdk synth

# View differences
cdk diff

# Deploy stack
cdk deploy

# Deploy with approval prompt
cdk deploy --require-approval always

# Destroy stack
cdk destroy

# View stack outputs
aws cloudformation describe-stacks --stack-name ServerlessArchitecture
```

### Modifying Infrastructure

To add or modify resources:

1. Edit `lib/serverless-stack.ts`
2. Build the project: `npm run build`
3. Preview changes: `cdk diff`
4. Deploy changes: `cdk deploy`

### Customization

**Lambda Configuration:**

Modify in `lib/serverless-stack.ts`:

```typescript
const apiLambda = new lambda.Function(this, 'ApiLambda', {
  timeout: cdk.Duration.seconds(60),  // Increase timeout
  memorySize: 512,                    // Increase memory
  // ... other configuration
});
```

**DynamoDB Configuration:**

```typescript
const dataTable = new dynamodb.Table(this, 'ServerlessDataTable', {
  billingMode: dynamodb.BillingMode.PROVISIONED,  // Change billing mode
  readCapacity: 5,                                 // Set read capacity
  writeCapacity: 5,                                // Set write capacity
  // ... other configuration
});
```

**API Gateway Throttling:**

```typescript
deployOptions: {
  throttlingRateLimit: 2000,  // Increase rate limit
  throttlingBurstLimit: 5000, // Increase burst limit
  // ... other configuration
}
```

---

## Deployment

### Automated Deployment

Use the provided scripts for automated deployment:

```bash
# Deploy infrastructure
./scripts/create.sh

# Destroy infrastructure
./scripts/destroy.sh

# Check resources
./scripts/check-resources.sh
```

### Manual Deployment

```bash
# Build the project
npm run build

# Deploy the stack
cdk deploy ServerlessArchitecture

# Deploy with specific context
cdk deploy --context environment=production
```

### Deployment Verification

After deployment, verify resources:

```bash
# Check CloudFormation stack
aws cloudformation describe-stacks --stack-name ServerlessArchitecture

# List Lambda functions
aws lambda list-functions --query 'Functions[?FunctionName==`serverless-api`]'

# Check DynamoDB table
aws dynamodb describe-table --table-name serverless-data

# Test API endpoint
curl https://{api-id}.execute-api.{region}.amazonaws.com/prod/api/v1/health
```

### Multi-Environment Deployment

To deploy to different environments:

```bash
# Development
cdk deploy ServerlessArchitecture --context environment=dev

# Staging
cdk deploy ServerlessArchitecture --context environment=staging

# Production
cdk deploy ServerlessArchitecture --context environment=prod --require-approval always
```

---

## Monitoring & Observability

### CloudWatch Dashboard

Access the dashboard via AWS Console or use the output URL:

```
https://console.aws.amazon.com/cloudwatch/home?region={region}#dashboards:name=ServerlessArchitecture
```

The dashboard includes:

- **API Gateway Metrics**: Request count, latency, error rates
- **Lambda Metrics**: Invocations, duration, errors, throttles
- **DynamoDB Metrics**: Read/write capacity consumed, throttling events
- **CloudFront Metrics**: Requests, data transfer, cache hit ratio

### CloudWatch Logs

View logs for different services:

```bash
# Lambda logs
aws logs tail /aws/lambda/serverless-api --follow

# API Gateway logs (if configured)
aws logs tail /aws/apigateway/serverless-api --follow
```

### CloudWatch Alarms

Monitor critical metrics:

- **High Error Rate**: Triggers when 4XX errors exceed 10 in 2 evaluation periods
- **High Latency**: Triggers when average latency exceeds 2 seconds

Alarms send notifications to the SNS topic `serverless-notifications`.

### Custom Metrics

Add custom metrics in Lambda functions:

```typescript
import { CloudWatch } from 'aws-sdk';

const cloudwatch = new CloudWatch();

await cloudwatch.putMetricData({
  Namespace: 'ServerlessArchitecture',
  MetricData: [{
    MetricName: 'CustomMetric',
    Value: 1,
    Unit: 'Count'
  }]
}).promise();
```

---

## Security

### Data Protection

- **Encryption in Transit**: TLS 1.2+ for all API Gateway and CloudFront communications
- **Encryption at Rest**: 
  - DynamoDB: AWS managed encryption (SSE)
  - S3: S3 managed encryption (SSE-S3)
- **Secrets Management**: Environment variables for non-sensitive config (consider AWS Secrets Manager for sensitive data)

### Network Security

- **S3 Bucket**: All public access blocked
- **API Gateway**: CORS configured, but consider restricting origins in production
- **CloudFront**: HTTPS enforcement, no direct S3 access

### Access Control

- **IAM Roles**: Least-privilege permissions for Lambda functions
- **Cognito**: Strong password policy, email verification required
- **API Gateway**: Consider adding API keys or Cognito authorizers for production

### Security Best Practices

1. **Restrict CORS Origins**: Update API Gateway CORS to specific domains in production
2. **Enable API Keys**: Add API key requirement for API Gateway endpoints
3. **Use Secrets Manager**: Move sensitive environment variables to AWS Secrets Manager
4. **Enable WAF**: Add AWS WAF to API Gateway for additional protection
5. **VPC Configuration**: Consider VPC endpoints for private DynamoDB and S3 access
6. **Enable MFA**: Require MFA for AWS account access
7. **Enable CloudTrail**: Enable CloudTrail for API audit logging

---

## Cost Optimization

### Estimated Monthly Costs

**Development/Testing Environment:**

| Service | Estimated Cost | Notes |
|---------|---------------|-------|
| Lambda | $0.20 | 1M requests/month (free tier) |
| API Gateway | $0.00 | 1M requests/month (free tier) |
| DynamoDB | $0.25 | 25GB storage (free tier) |
| S3 | $0.00 | 5GB storage (free tier) |
| CloudFront | $0.00 | 1TB transfer (free tier) |
| Cognito | $0.00 | 50K MAU (free tier) |
| CloudWatch | $0.50 | Logs and metrics |
| SNS | $0.00 | 1M requests (free tier) |
| **Total** | **~$1.00** | **Within free tier limits** |

**Production Environment (Low Traffic):**

| Service | Estimated Cost | Notes |
|---------|---------------|-------|
| Lambda | $0.20 | Pay-per-request |
| API Gateway | $3.50 | 1M requests/month |
| DynamoDB | $1.25 | On-demand pricing |
| S3 | $0.50 | Storage and requests |
| CloudFront | $0.50 | Data transfer |
| Cognito | $0.00 | 50K MAU (free tier) |
| CloudWatch | $2.00 | Logs and metrics |
| SNS | $0.00 | 1M requests (free tier) |
| **Total** | **~$8.00** | **Low traffic scenario** |

### Cost Optimization Strategies

1. **DynamoDB On-Demand**: Use on-demand billing for unpredictable workloads
2. **S3 Lifecycle Policies**: Automatically transition to cheaper storage classes
3. **CloudFront Caching**: Reduce origin requests with aggressive caching
4. **Lambda Memory Tuning**: Optimize memory allocation to reduce costs
5. **CloudWatch Log Retention**: Set appropriate retention periods (1 month default)
6. **Reserved Capacity**: Use provisioned capacity for predictable DynamoDB workloads
7. **S3 Intelligent Tiering**: Enable for automatic cost optimization

### Cost Monitoring

Set up AWS Budgets to monitor costs:

```bash
aws budgets create-budget \
  --account-id $(aws sts get-caller-identity --query Account --output text) \
  --budget file://budget.json \
  --notifications-with-subscribers file://notifications.json
```

---

## Roadmap

### Completed

- [x] Core serverless infrastructure (API Gateway, Lambda, DynamoDB)
- [x] S3 bucket with versioning and lifecycle policies
- [x] CloudFront CDN distribution
- [x] Cognito User Pool and Client
- [x] CloudWatch dashboard and alarms
- [x] SNS notification topic
- [x] Deployment and cleanup scripts
- [x] Resource verification scripts

### In Progress

- [ ] Enhanced Lambda function implementations
- [ ] Additional API endpoints
- [ ] Integration tests
- [ ] CI/CD pipeline configuration

### Planned

- [ ] Multi-environment support (dev, staging, prod)
- [ ] AWS WAF integration
- [ ] VPC endpoints for private access
- [ ] Secrets Manager integration
- [ ] X-Ray tracing
- [ ] Custom domain configuration
- [ ] API Gateway authorizers
- [ ] DynamoDB Streams integration
- [ ] Step Functions workflows
- [ ] EventBridge event rules
- [ ] Cost optimization enhancements
- [ ] Security hardening
- [ ] Comprehensive documentation

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Support

For issues, questions, or contributions:

- **Documentation**: Check project-specific README files
- **AWS CDK Documentation**: [https://docs.aws.amazon.com/cdk/](https://docs.aws.amazon.com/cdk/)
- **AWS Services Documentation**: [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)

---

**Built with AWS CDK v2 and TypeScript**

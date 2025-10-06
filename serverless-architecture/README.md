# 🚀 Serverless Architecture - Complete AWS CDK Project

## 📋 Overview
This project demonstrates a complete serverless architecture using AWS CDK with multiple AWS services working together to create a scalable, secure, and cost-effective solution.

## 📁 Project Structure & File Explanations

### **Configuration Files:**
- **`package.json`** - Node.js dependencies and scripts for the project
- **`tsconfig.json`** - TypeScript compiler configuration
- **`cdk.json`** - CDK framework configuration and context settings

### **Source Code:**
- **`bin/serverless-app.ts`** - CDK app entry point, defines the main application
- **`lib/serverless-stack.ts`** - Main stack definition with all AWS resources

### **Scripts:**
- **`scripts/install-deps.sh`** - Automated script to install all dependencies
- **`scripts/deploy.sh`** - Automated deployment script with checks
- **`scripts/quick-deploy.sh`** - Smart deployment script with multiple functions
- **`scripts/check-resources.sh`** - Resource verification script

## 🏗️ Architecture Components

### **Core Services:**
- **API Gateway** - REST API with CORS and throttling
- **Lambda** - Serverless compute with custom environment variables
- **DynamoDB** - NoSQL database with GSI and encryption
- **S3** - Object storage with versioning and lifecycle policies
- **CloudFront** - Global CDN for content delivery
- **Cognito** - User authentication and authorization
- **CloudWatch** - Monitoring, logging, and alerting
- **SNS** - Notifications and alerting

### **Security Features:**
- S3 bucket with encryption and block public access
- DynamoDB with encryption at rest
- Cognito with strong password policy
- API Gateway with CORS configuration
- CloudWatch alarms for monitoring

## 📁 Detailed File Explanations

### **Configuration Files:**

#### **`package.json`**
- **Purpose**: Defines Node.js project dependencies and scripts
- **Key Dependencies**: 
  - `aws-cdk-lib` - Core CDK library
  - `constructs` - CDK constructs framework
  - `typescript` - TypeScript compiler
- **Scripts**: Build, deploy, and destroy commands

#### **`tsconfig.json`**
- **Purpose**: TypeScript compiler configuration
- **Key Settings**: Target ES2020, strict mode, module resolution
- **Output**: Compiled JavaScript files for CDK

#### **`cdk.json`**
- **Purpose**: CDK framework configuration
- **Key Settings**: App entry point, context variables, feature flags
- **Context**: AWS CDK feature toggles and best practices

### **Source Code:**

#### **`bin/serverless-app.ts`**
- **Purpose**: CDK application entry point
- **Function**: Creates the main CDK app and instantiates the stack
- **Configuration**: Sets environment variables and tags

#### **`lib/serverless-stack.ts`**
- **Purpose**: Main infrastructure definition
- **Contains**: All AWS resources (Lambda, API Gateway, DynamoDB, etc.)
- **Architecture**: Complete serverless stack with monitoring

### **Scripts:**

#### **`scripts/install-deps.sh`**
- **Purpose**: Automated dependency installation
- **Function**: Installs npm packages and CDK globally
- **Checks**: Verifies prerequisites before installation

#### **`scripts/deploy.sh`**
- **Purpose**: Automated deployment script
- **Function**: Builds project and deploys to AWS
- **Features**: Prerequisites check, error handling, success messages

#### **`scripts/quick-deploy.sh`**
- **Purpose**: Smart deployment script with multiple functions
- **Function**: Deploy, destroy, status check, and cost analysis
- **Features**: Interactive prompts, error handling, comprehensive checks

#### **`scripts/check-resources.sh`**
- **Purpose**: Resource verification script
- **Function**: Checks all AWS resources and costs
- **Features**: Detailed resource listing, cost breakdown, status verification

## 🚀 Quick Start

### **Prerequisites:**
- Node.js 18+
- AWS CLI configured
- AWS CDK CLI installed
- AWS Account with appropriate permissions

### **Installation:**
```bash
# Install dependencies
npm install

# Bootstrap CDK (first time only)
cdk bootstrap

# Deploy the stack
cdk deploy
```

### **Commands:**
```bash
# Install dependencies
./scripts/install-deps.sh

# Deploy all resources
./scripts/quick-deploy.sh deploy

# Destroy all resources
./scripts/quick-deploy.sh destroy

# Check resources
./scripts/check-resources.sh all

# View differences
cdk diff

# Synthesize CloudFormation template
cdk synth
```

## 📊 What You'll See in AWS Console

### **CloudFormation:**
- 1 Stack: `ServerlessArchitecture`
- 15+ Resources created
- All resources properly tagged

### **API Gateway:**
- REST API with 3 endpoints
- CORS enabled
- Throttling configured
- Request/Response logging

### **Lambda:**
- 1 Function with environment variables
- CloudWatch logs enabled
- IAM permissions for DynamoDB and S3

### **DynamoDB:**
- 1 Table with GSI
- Encryption enabled
- Point-in-time recovery
- Pay-per-request billing

### **S3:**
- 1 Bucket with versioning
- Encryption enabled
- Lifecycle policies
- Block public access

### **CloudFront:**
- 1 Distribution
- S3 origin
- HTTPS redirect
- Global edge locations

### **Cognito:**
- 1 User Pool
- 1 User Pool Client
- Strong password policy
- Email verification

### **CloudWatch:**
- 1 Dashboard with 4 widgets
- 2 Alarms for monitoring
- Custom metrics
- Log groups

## 🎯 Key Features Demonstrated

### **1. Serverless Architecture:**
- No servers to manage
- Automatic scaling
- Pay-per-use pricing

### **2. Security Best Practices:**
- Encryption at rest and in transit
- IAM roles with least privilege
- VPC endpoints (if needed)

### **3. Monitoring & Observability:**
- Real-time dashboards
- Automated alerting
- Performance metrics

### **4. Cost Optimization:**
- Pay-per-request DynamoDB
- S3 lifecycle policies
- CloudFront caching

## 📈 Monitoring Dashboard

The CloudWatch dashboard includes:
- API Gateway request metrics
- Lambda invocation metrics
- DynamoDB capacity metrics
- CloudFront request metrics

## 🚨 Alerts Configured

- **High Error Rate**: 4XX errors > 10
- **High Latency**: API latency > 2 seconds
- **SNS Notifications**: Email alerts for issues

## 🔧 Customization

### **Environment Variables:**
- `CDK_DEFAULT_ACCOUNT`: AWS Account ID
- `CDK_DEFAULT_REGION`: AWS Region

### **Modifiable Parameters:**
- Lambda timeout and memory
- DynamoDB billing mode
- S3 lifecycle policies
- CloudWatch alarm thresholds

## 📝 Outputs

After deployment, you'll get:
- API Gateway URL
- CloudFront URL
- User Pool ID
- DynamoDB Table Name
- S3 Bucket Name
- Dashboard URL

## 🧹 Cleanup

To avoid charges, destroy the stack:
```bash
cdk destroy
```

## 📚 Learning Outcomes

After completing this project, you'll understand:
- How to create serverless architectures with CDK
- Best practices for AWS security
- Monitoring and alerting strategies
- Cost optimization techniques
- Infrastructure as Code principles

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License

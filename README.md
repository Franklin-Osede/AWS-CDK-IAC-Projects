# AWS CDK Infrastructure as Code Projects

> **Collection of enterprise-grade AWS CDK projects** demonstrating various cloud architecture patterns, serverless solutions, and Infrastructure as Code best practices using AWS CDK v2 and TypeScript.

[![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=flat&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![AWS CDK](https://img.shields.io/badge/AWS%20CDK-v2-FF9900?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/cdk/)
[![Node.js](https://img.shields.io/badge/Node.js-18+-339933?style=flat&logo=node.js&logoColor=white)](https://nodejs.org/)

---

## Table of Contents

- [Overview](#overview)
- [Projects](#projects)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Technology Stack](#technology-stack)
- [Common Features](#common-features)
- [Development Guidelines](#development-guidelines)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This repository contains a collection of AWS CDK projects, each demonstrating different architectural patterns and AWS service combinations. Each project is self-contained with its own infrastructure definitions, deployment scripts, and documentation.

All projects follow Infrastructure as Code (IaC) best practices using AWS CDK v2, TypeScript, and modern cloud architecture patterns. Projects are designed to be production-ready, secure, cost-optimized, and well-documented.

### Repository Status

This repository is **actively in development**. Projects are being added incrementally, with each project going through implementation, testing, and documentation phases.

---

## Projects

### Available Projects

#### Serverless Architecture

**Status**: Implemented

**Location**: `serverless-architecture/`

**Description**: Complete serverless infrastructure stack featuring API Gateway, Lambda functions, DynamoDB, S3, CloudFront CDN, Cognito authentication, and comprehensive CloudWatch monitoring.

**Key Services**:
- API Gateway (REST API)
- Lambda (Node.js 18.x)
- DynamoDB (On-demand billing)
- S3 (Versioned, encrypted)
- CloudFront (Global CDN)
- Cognito (User authentication)
- CloudWatch (Monitoring & Logging)
- SNS (Notifications)

**Features**:
- Serverless architecture with automatic scaling
- RESTful API with CORS and throttling
- NoSQL database with Global Secondary Indexes
- Global CDN for content delivery
- User authentication and authorization
- Real-time monitoring dashboards
- Automated alerting

**Documentation**: See `serverless-architecture/README.md` for detailed documentation.

### Projects in Progress

The following projects are currently being developed:

- **Microservices Architecture**: Containerized microservices with ECS, ALB, and service discovery
- **Data Pipeline**: Real-time data processing with Kinesis, Lambda, and DynamoDB
- **Multi-Account Setup**: Cross-account resource sharing and security boundaries
- **VPC Networking**: Advanced VPC configurations with Transit Gateway
- **CI/CD Pipeline**: Automated deployment pipelines with GitHub Actions

### Planned Projects

Future projects planned for this repository:

- **Event-Driven Architecture**: EventBridge, SQS, and SNS integration
- **Data Lake**: S3-based data lake with Glue and Athena
- **Machine Learning Pipeline**: SageMaker integration for ML workflows
- **Disaster Recovery**: Multi-region backup and recovery solutions
- **Security & Compliance**: Security hardening and compliance frameworks
- **Cost Optimization**: Cost monitoring and optimization strategies

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

# Navigate to a specific project
cd serverless-architecture

# Install dependencies
npm install

# Install AWS CDK globally (if not already installed)
npm install -g aws-cdk
```

### Bootstrap CDK (First Time Only)

Before deploying any project for the first time, bootstrap CDK in your AWS account and region:

```bash
cdk bootstrap
```

This creates the necessary S3 bucket and IAM roles for CDK deployments.

### Quick Start

```bash
# Navigate to a project
cd serverless-architecture

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

## Project Structure

```
AWS-CDK-IAC-Projects/
├── serverless-architecture/          # Serverless stack project
│   ├── bin/
│   │   └── serverless-app.ts         # CDK app entry point
│   ├── lib/
│   │   └── serverless-stack.ts       # Main infrastructure stack
│   ├── scripts/
│   │   ├── create.sh                 # Deployment script
│   │   ├── destroy.sh                # Cleanup script
│   │   └── check-resources.sh        # Resource verification
│   ├── cdk.json                      # CDK configuration
│   ├── tsconfig.json                 # TypeScript configuration
│   ├── package.json                  # Dependencies and scripts
│   └── README.md                     # Project-specific documentation
│
├── [future-project-1]/               # Additional projects (in progress)
├── [future-project-2]/               # Additional projects (planned)
│
└── README.md                         # Repository documentation (this file)
```

### Project Structure Guidelines

Each project in this repository follows a consistent structure:

- **`bin/`**: CDK application entry points
- **`lib/`**: Infrastructure stack definitions
- **`scripts/`**: Deployment and utility scripts
- **`cdk.json`**: CDK framework configuration
- **`tsconfig.json`**: TypeScript compiler configuration
- **`package.json`**: Node.js dependencies and scripts
- **`README.md`**: Project-specific documentation

---

## Technology Stack

### Core Technologies

| Component | Technology | Version |
|-----------|------------|---------|
| **Infrastructure** | AWS CDK | v2.100.0 |
| **Language** | TypeScript | 5.0.4 |
| **Runtime** | Node.js | 18+ |
| **Cloud Provider** | Amazon Web Services | Latest |
| **Package Manager** | npm | 9+ |

### AWS Services (Varies by Project)

Common AWS services used across projects:

- **Compute**: Lambda, ECS, EC2
- **Storage**: S3, DynamoDB, RDS, ElastiCache
- **Networking**: VPC, CloudFront, API Gateway, ALB
- **Security**: IAM, Cognito, Secrets Manager, KMS
- **Monitoring**: CloudWatch, X-Ray, CloudTrail
- **Integration**: SNS, SQS, EventBridge, Step Functions
- **Analytics**: Kinesis, Glue, Athena, Redshift

---

## Common Features

All projects in this repository share common characteristics:

### Infrastructure as Code

- **Type-Safe Definitions**: TypeScript for compile-time error checking
- **Modular Design**: Reusable constructs and patterns
- **Version Control**: All infrastructure code in Git
- **Reproducible**: Consistent deployments across environments

### Security Best Practices

- **Encryption**: Encryption at rest and in transit
- **IAM Least Privilege**: Minimal required permissions
- **Network Security**: VPC, security groups, and NACLs
- **Secrets Management**: Secure credential storage
- **Audit Logging**: CloudTrail integration

### Monitoring & Observability

- **CloudWatch Dashboards**: Real-time metrics visualization
- **Automated Alerts**: SNS notifications for critical events
- **Logging**: Centralized log management
- **Cost Monitoring**: Budget alerts and cost allocation

### Cost Optimization

- **Pay-per-Use**: Serverless and on-demand services
- **Lifecycle Policies**: Automatic data tiering
- **Reserved Capacity**: For predictable workloads
- **Cost Allocation Tags**: Resource cost tracking

### DevOps Integration

- **Automated Scripts**: Deployment and cleanup scripts
- **CI/CD Ready**: Designed for pipeline integration
- **Environment Management**: Support for multiple environments
- **Documentation**: Comprehensive project documentation

---

## Development Guidelines

### Code Standards

- **TypeScript**: Strict mode enabled, type safety enforced
- **CDK Best Practices**: Follow AWS CDK patterns and conventions
- **Code Formatting**: Consistent code style across projects
- **Documentation**: Inline comments and README files

### Project Setup

When creating a new project:

1. Create project directory: `mkdir new-project`
2. Initialize CDK: `cdk init app --language typescript`
3. Follow existing project structure
4. Add deployment scripts
5. Create comprehensive README
6. Update main repository README

### Testing

- **Unit Tests**: Test infrastructure constructs
- **Integration Tests**: Validate deployed resources
- **Snapshot Tests**: Ensure no unintended changes

### Documentation

Each project should include:

- **README.md**: Overview, architecture, and usage
- **Architecture Diagrams**: Visual representation of infrastructure
- **Deployment Guide**: Step-by-step deployment instructions
- **Configuration**: Environment variables and parameters
- **Troubleshooting**: Common issues and solutions

---

## Deployment

### Deployment Process

1. **Navigate to Project**: `cd <project-directory>`
2. **Install Dependencies**: `npm install`
3. **Build Project**: `npm run build`
4. **Preview Changes**: `cdk diff`
5. **Deploy Stack**: `cdk deploy` or use deployment script

### Deployment Scripts

Most projects include deployment scripts:

```bash
# Deploy infrastructure
./scripts/create.sh

# Destroy infrastructure
./scripts/destroy.sh

# Check resources
./scripts/check-resources.sh
```

### Multi-Environment Deployment

Projects support multiple environments:

```bash
# Development
cdk deploy --context environment=dev

# Staging
cdk deploy --context environment=staging

# Production
cdk deploy --context environment=prod --require-approval always
```

### Cleanup

To avoid charges, destroy stacks when not in use:

```bash
cdk destroy
# Or use cleanup script
./scripts/destroy.sh
```

---

## Contributing

This repository is actively in development. Contributions and suggestions are welcome.

### Contributing Guidelines

1. **Follow Structure**: Maintain consistent project structure
2. **Documentation**: Include comprehensive README files
3. **Code Quality**: Follow TypeScript and CDK best practices
4. **Testing**: Add tests for new features
5. **Security**: Follow security best practices
6. **Cost Awareness**: Consider cost implications of resources

### Adding New Projects

When adding a new project:

1. Create project directory with consistent structure
2. Implement infrastructure following CDK best practices
3. Add deployment and cleanup scripts
4. Create comprehensive documentation
5. Update main README with project information
6. Test deployment and cleanup processes

---

## Cost Optimization

### AWS Free Tier

Many projects utilize AWS Free Tier services:

- **Lambda**: 1M requests/month
- **API Gateway**: 1M requests/month
- **DynamoDB**: 25GB storage
- **S3**: 5GB storage
- **CloudFront**: 1TB data transfer
- **ECS**: 750 hours/month
- **RDS**: 750 hours/month

### Cost Monitoring

- Set up AWS Budgets for cost alerts
- Use cost allocation tags
- Monitor CloudWatch billing metrics
- Review and optimize resource usage regularly

### Cost Optimization Strategies

- Use serverless services (pay-per-use)
- Implement S3 lifecycle policies
- Use on-demand billing for unpredictable workloads
- Enable CloudFront caching
- Set appropriate log retention periods
- Use reserved capacity for predictable workloads

---

## Roadmap

### Completed

- [x] Repository structure and documentation
- [x] Serverless Architecture project (fully implemented)
- [x] Deployment and cleanup scripts
- [x] Resource verification utilities

### In Progress

- [ ] Microservices Architecture project
- [ ] Data Pipeline project
- [ ] Multi-Account Setup project
- [ ] Enhanced documentation and examples
- [ ] CI/CD pipeline integration

### Planned

- [ ] Event-Driven Architecture project
- [ ] Data Lake project
- [ ] Machine Learning Pipeline project
- [ ] Disaster Recovery solutions
- [ ] Security & Compliance frameworks
- [ ] Cost Optimization strategies
- [ ] Performance optimization guides
- [ ] Multi-region deployment patterns

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Support

For issues, questions, or contributions:

- **Project Documentation**: Check individual project README files
- **AWS CDK Documentation**: [https://docs.aws.amazon.com/cdk/](https://docs.aws.amazon.com/cdk/)
- **AWS Services Documentation**: [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)

---

**Built with AWS CDK v2 and TypeScript**

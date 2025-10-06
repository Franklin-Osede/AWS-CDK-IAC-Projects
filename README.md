# 🚀 AWS CDK Infrastructure as Code Projects

[![AWS CDK](https://img.shields.io/badge/AWS%20CDK-v2-blue)](https://aws.amazon.com/cdk/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.9+-blue)](https://www.typescriptlang.org/)
[![Node.js](https://img.shields.io/badge/Node.js-18+-green)](https://nodejs.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Franklin-Osede/AWS-CDK-IAC-Projects?style=social)](https://github.com/Franklin-Osede/AWS-CDK-IAC-Projects)

> A comprehensive collection of advanced AWS CDK projects demonstrating enterprise-grade Infrastructure as Code patterns, serverless architectures, and cloud-native solutions.

## 🎯 Overview

This repository contains **production-ready AWS CDK projects** showcasing real-world scenarios that senior cloud developers and DevOps engineers encounter in enterprise environments. Each project demonstrates different architectural patterns, AWS service combinations, and best practices for scalable, secure, and cost-effective cloud infrastructure.

## 📦 Projects Included

### **🚀 Serverless & Compute**

| Project | Description | Services | Complexity |
|---------|-------------|----------|------------|
| **[Complete Serverless Architecture](#complete-serverless-architecture)** | Full serverless stack with Lambda, API Gateway, DynamoDB | Lambda, API Gateway, DynamoDB, S3, CloudFront, Cognito | ⭐⭐⭐ |
| **[Microservices with ECS](#microservices-with-ecs)** | Containerized microservices with service discovery | ECS, ALB, ECR, Service Discovery | ⭐⭐⭐⭐ |
| **[Serverless Data Pipeline](#serverless-data-pipeline)** | Real-time data processing with Kinesis | Kinesis, Lambda, Redshift, S3 | ⭐⭐⭐⭐ |

### **🔒 Security & Compliance**

| Project | Description | Services | Complexity |
|---------|-------------|----------|------------|
| **[Multi-Account Security](#multi-account-security)** | Cross-account resource sharing and security boundaries | IAM, Organizations, Cross-Account Roles | ⭐⭐⭐⭐⭐ |
| **[Zero-Trust Network](#zero-trust-network)** | VPC with private subnets and security groups | VPC, Security Groups, NACLs, Transit Gateway | ⭐⭐⭐⭐ |
| **[Secrets Management](#secrets-management)** | Centralized secrets with rotation | Secrets Manager, KMS, Lambda | ⭐⭐⭐ |

### **📊 Data & Analytics**

| Project | Description | Services | Complexity |
|---------|-------------|----------|------------|
| **[Real-time Analytics](#real-time-analytics)** | Streaming analytics with Kinesis Analytics | Kinesis, Kinesis Analytics, S3 | ⭐⭐⭐⭐ |
| **[Data Lake Architecture](#data-lake-architecture)** | S3-based data lake with Glue and Athena | S3, Glue, Athena, Redshift Spectrum | ⭐⭐⭐⭐ |
| **[Machine Learning Pipeline](#machine-learning-pipeline)** | ML model training and inference | SageMaker, Lambda, S3, API Gateway | ⭐⭐⭐⭐⭐ |

### **🌐 Networking & CDN**

| Project | Description | Services | Complexity |
|---------|-------------|----------|------------|
| **[Global CDN Setup](#global-cdn-setup)** | Multi-region CloudFront with custom origins | CloudFront, S3, Lambda@Edge | ⭐⭐⭐ |
| **[VPC with Transit Gateway](#vpc-with-transit-gateway)** | Hub-and-spoke network topology | VPC, Transit Gateway, Route Tables | ⭐⭐⭐⭐ |
| **[Private API Gateway](#private-api-gateway)** | VPC endpoints and private API access | API Gateway, VPC Endpoints, PrivateLink | ⭐⭐⭐⭐ |

### **🔄 CI/CD & DevOps**

| Project | Description | Services | Complexity |
|---------|-------------|----------|------------|
| **[GitHub Actions Pipeline](#github-actions-pipeline)** | Automated deployment pipeline | CodeBuild, CodeDeploy, GitHub Actions | ⭐⭐⭐ |
| **[Blue-Green Deployment](#blue-green-deployment)** | Zero-downtime deployment strategy | ALB, ECS, Route53, Lambda | ⭐⭐⭐⭐ |
| **[Infrastructure Testing](#infrastructure-testing)** | Automated infrastructure validation | CDK, Jest, AWS SDK | ⭐⭐⭐ |

## 🚀 Quick Start

### **Prerequisites**

- **Node.js** 18 or higher
- **AWS CLI** configured with credentials
- **AWS CDK** v2 installed globally
- **Git** for version control

### **1. Clone the Repository**

```bash
git clone https://github.com/Franklin-Osede/AWS-CDK-IAC-Projects.git
cd AWS-CDK-IAC-Projects
```

### **2. Choose a Project**

```bash
# Navigate to any project
cd serverless-architecture
# or
cd microservices-architecture
# or
cd data-pipeline
```

### **3. Deploy Infrastructure**

```bash
# Install dependencies
npm install

# Bootstrap CDK (first time only)
cdk bootstrap

# Deploy the project
cdk deploy
```

### **4. Clean Up**

```bash
# Remove all resources
cdk destroy
```

## 📁 Repository Structure

<<<<<<< HEAD
```
AWS-CDK-IAC-Projects/
├── serverless-architecture/          # Complete Serverless Stack
│   ├── lib/serverless-stack.ts     # Main CDK stack
│   ├── scripts/                    # Automation scripts
│   └── README.md                   # Project documentation
├── microservices-architecture/     # Containerized Services
├── data-pipeline/                  # Real-time Data Processing
├── multi-account-setup/            # Cross-Account Resources
├── disaster-recovery/              # Multi-Region Setup
├── machine-learning/               # ML Pipeline
├── networking/                     # VPC and CDN
├── security/                       # Security and Compliance
├── monitoring/                     # Observability Stack
└── ci-cd/                         # DevOps and Automation
```

=======
>>>>>>> 1ef8f7bd782cb0f5c453d2c199844b0e6b1c9c65
## 🛠️ Technology Stack

| Component | Technology | Version |
|-----------|------------|---------|
| **Infrastructure** | AWS CDK | v2.x |
| **Language** | TypeScript | 4.9+ |
| **Runtime** | Node.js | 18.x |
| **Cloud Provider** | Amazon Web Services | Latest |
| **CI/CD** | GitHub Actions | Latest |
| **Monitoring** | CloudWatch, X-Ray | Native |
| **Security** | IAM, KMS, Secrets Manager | Native |

## 🎯 Key Features

### **🏗️ Infrastructure as Code**
- **TypeScript CDK**: Type-safe infrastructure definitions
- **Modular Design**: Reusable constructs and patterns
- **Environment Management**: Dev, staging, and production configurations
- **Cost Optimization**: Pay-per-use and reserved capacity strategies

### **🔒 Security Best Practices**
- **IAM Least Privilege**: Minimal required permissions
- **Encryption at Rest**: KMS keys for all data storage
- **Network Security**: VPC, security groups, and NACLs
- **Secrets Management**: AWS Secrets Manager integration

### **📈 Monitoring & Observability**
- **CloudWatch Dashboards**: Real-time metrics and alerts
- **X-Ray Tracing**: Distributed request tracing
- **Cost Monitoring**: Budget alerts and cost allocation
- **Performance Metrics**: Latency, throughput, and error rates

### **🔄 DevOps Integration**
- **CI/CD Pipelines**: GitHub Actions and CodePipeline
- **Blue/Green Deployments**: Zero-downtime deployments
- **Infrastructure Testing**: Automated validation
- **Documentation**: Auto-generated architecture diagrams

## 💰 Cost Optimization

### **AWS Free Tier (12 months)**

| Service | Free Tier Limit |
|---------|----------------|
| **Lambda** | 1M requests/month |
| **API Gateway** | 1M requests/month |
| **DynamoDB** | 25GB storage |
| **S3** | 5GB storage |
| **CloudFront** | 1TB data transfer |
| **ECS** | 750 hours/month |
| **RDS** | 750 hours/month |

### **Cost Monitoring**

- **Budget Alerts**: Set up cost thresholds
- **Cost Allocation**: Tag resources for tracking
- **Reserved Capacity**: Use for predictable workloads
- **Spot Instances**: For fault-tolerant workloads

## 🧪 Testing

### **Infrastructure Testing**

```bash
# Run infrastructure tests
npm test

# Run with coverage
npm run test:coverage

# Run specific test
npm test -- --testNamePattern="ServerlessStack"
```

### **API Testing**

```bash
# Health check
curl https://your-api-id.execute-api.us-east-1.amazonaws.com/prod/api/v1/health

# Data endpoint
curl https://your-api-id.execute-api.us-east-1.amazonaws.com/prod/api/v1/data
```

## 🚀 Deployment Strategies

### **Development**

```bash
# Deploy to development
cdk deploy --context environment=dev
```

### **Production**

```bash
# Deploy to production with approval
cdk deploy --context environment=prod --require-approval always
```

### **CI/CD Pipeline**

```yaml
name: Deploy Infrastructure
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm install -g aws-cdk
      - run: cdk deploy --require-approval never
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## 🔍 Monitoring and Observability

### **CloudWatch Dashboards**

Each project includes comprehensive dashboards showing:
- **API Metrics**: Request count, latency, error rate
- **Compute Metrics**: CPU, memory, duration
- **Database Metrics**: Read/write capacity, throttling
- **Network Metrics**: Data transfer, connection count

### **Automated Alerts**

| Alert Type | Threshold | Action |
|------------|-----------|--------|
| **High Error Rate** | > 10 errors in 2 minutes | SNS notification |
| **High Latency** | > 2 seconds average | SNS notification |
| **Cost Alert** | Budget threshold exceeded | SNS notification |
| **Security Event** | Failed authentication | SNS notification |

## 🤝 Contributing

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/new-project`
3. **Make** your changes and add tests
4. **Commit** your changes: `git commit -m 'Add new project'`
5. **Push** to the branch: `git push origin feature/new-project`
6. **Submit** a pull request

### **Contributing Guidelines**

- Follow TypeScript best practices
- Add comprehensive tests
- Update documentation
- Follow CDK best practices
- Include cost optimization strategies

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **AWS CDK Team** for the excellent framework
- **AWS Community** for best practices and patterns
- **Contributors** who help improve these projects
- **Open Source Community** for inspiration and collaboration

## 📞 Support

- **GitHub Issues**: [Open an issue](https://github.com/Franklin-Osede/AWS-CDK-IAC-Projects/issues)
- **Documentation**: Check project-specific README files
- **Community**: Join AWS CDK community discussions
- **Discussions**: Use GitHub Discussions for questions

## 🎯 Roadmap

### **Upcoming Projects**
- [ ] **Edge Computing** with Lambda@Edge
- [ ] **Blockchain Integration** with AWS services
- [ ] **IoT Data Processing** with Kinesis
- [ ] **Multi-Region Active-Active** setup
- [ ] **Disaster Recovery** automation
- [ ] **Cost Optimization** strategies
- [ ] **Security Compliance** frameworks
- [ ] **Performance Optimization** techniques

---

**Built with ❤️ using AWS CDK and TypeScript**

[![AWS CDK](https://img.shields.io/badge/AWS%20CDK-v2-blue)](https://aws.amazon.com/cdk/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.9+-blue)](https://www.typescriptlang.org/)
[![Node.js](https://img.shields.io/badge/Node.js-18+-green)](https://nodejs.org/)
<<<<<<< HEAD
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
=======
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
>>>>>>> 1ef8f7bd782cb0f5c453d2c199844b0e6b1c9c65

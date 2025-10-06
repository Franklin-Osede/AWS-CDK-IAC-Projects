#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { ServerlessStack } from '../lib/serverless-stack';

const app = new cdk.App();

// Create the main serverless stack
new ServerlessStack(app, 'ServerlessArchitecture', {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION,
  },
  description: 'Complete Serverless Architecture with API Gateway, Lambda, DynamoDB, S3, CloudFront, and Cognito'
});

// Add tags to all resources
cdk.Tags.of(app).add('Project', 'ServerlessArchitecture');
cdk.Tags.of(app).add('Environment', 'Production');
cdk.Tags.of(app).add('Owner', 'CloudDeveloper');

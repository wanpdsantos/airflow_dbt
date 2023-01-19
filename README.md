# Airflow AWS Managed Environment

This is a template project to run Airflow and DBT on an AWS Managed environment.

## Components

### [AWS Managed Airflow](https://aws.amazon.com/managed-workflows-for-apache-airflow/)

Amazon Managed Workflows for Apache Airflow (MWAA) orchestrates your workflows using Directed Acyclic Graphs (DAGs) written in Python. You provide MWAA an Amazon Simple Storage Service (S3) bucket where your DAGs, plugins, and Python requirements reside. Then run and monitor your DAGs from the AWS Management Console, a command line interface (CLI), a software development kit (SDK), or the Apache Airflow user interface (UI).

### [DBT (Data Transformation)](https://docs.getdbt.com/)

dbt is a transformation workflow that helps you get more work done while producing higher quality results. You can use dbt to modularize and centralize your analytics code, while also providing your data team with guardrails typically found in software engineering workflows. Collaborate on data models, version them, and test and document your queries before safely deploying them to production, with monitoring and visibility.

## Requirements

- You should have a previous infrastructure in place. Its required a AWS Airflow Managed instance running as well as a S3 bucket.
- Make sure there is an OpenID connection between your AWS account and your airflow repository. Here is the [link](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services) for this procedure. It is not recommended, but you can create a user and use the user ACCESS_KEY and SECRET_KEY to include on the CD pipeline instead of using OpenID Connect.

### Deployment

1. Fork this repository.
2. Update the .github/workflows/deploy_to_s3.yml file to match your S3 bucket and role.
3. Updated the DAGs according to your needs.
4. Merge with master and it will get deployed to your S3 bucket.
5. Airflow should automatically update the DAGs.
6. Now you can create new DAGs and/or DBT projects according to your needs.

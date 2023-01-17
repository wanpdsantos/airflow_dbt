# Airflow AWS Managed Environment

This project contains the DAGs to run on an AWS Airflow Managed environment and DBT projects to run as well. 

## Components

### [AWS Managed Airflow](https://aws.amazon.com/managed-workflows-for-apache-airflow/)

Amazon Managed Workflows for Apache Airflow (MWAA) orchestrates your workflows using Directed Acyclic Graphs (DAGs) written in Python. You provide MWAA an Amazon Simple Storage Service (S3) bucket where your DAGs, plugins, and Python requirements reside. Then run and monitor your DAGs from the AWS Management Console, a command line interface (CLI), a software development kit (SDK), or the Apache Airflow user interface (UI).

### [DBT (Data Transformation)](https://docs.getdbt.com/)

dbt is a transformation workflow that helps you get more work done while producing higher quality results. You can use dbt to modularize and centralize your analytics code, while also providing your data team with guardrails typically found in software engineering workflows. Collaborate on data models, version them, and test and document your queries before safely deploying them to production, with monitoring and visibility.

## How to Run

To run this, you should have a previous infrastructure in place. Its required a AWS Airflow Managed instance running as well as a S3 bucket.

### Deployment

1. Fork this repository
2. Update the .github/workflows/deploy_to_s3.yml file to match your S3 bucket and role.
3. Updated the DAGs according to your needs.
4. Merge with master and it will get deployed to your S3 bucket
5. Airflow should automatically update the DAGs

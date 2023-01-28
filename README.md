# Airflow AWS Managed Environment

This is a template project to run Airflow and DBT on an AWS Managed environment.

## Components

### [AWS Managed Airflow](https://aws.amazon.com/managed-workflows-for-apache-airflow/)

Amazon Managed Workflows for Apache Airflow (MWAA) orchestrates your workflows using Directed Acyclic Graphs (DAGs) written in Python. You provide MWAA an Amazon Simple Storage Service (S3) bucket where your DAGs, plugins, and Python requirements reside. Then run and monitor your DAGs from the AWS Management Console, a command line interface (CLI), a software development kit (SDK), or the Apache Airflow user interface (UI).

### [DBT (Data Transformation)](https://docs.getdbt.com/)

dbt is a transformation workflow that helps you get more work done while producing higher quality results. You can use dbt to modularize and centralize your analytics code, while also providing your data team with guardrails typically found in software engineering workflows. Collaborate on data models, version them, and test and document your queries before safely deploying them to production, with monitoring and visibility.

## Local DBT development

If you don't have AWS Airflow Managed Environment and want to run DBT projects locally, follow the steps:

1. Create a .env file on the same directory of the `docker-compose.yml`file and include the following variables (edit user and password):

    ```properties
    POSTGRES_USER=change_to_your_user
    POSTGRES_PASSWORD=change_to_your_password
    POSTGRES_DB=dev
    ```

2. Next `docker compose --env-file .env up` on root directory to start postgres container. This will start a docker container for PostgresSQL and a database named `dev`.

3. Download PGAdmin and login to the Postgres DB. Create all the schemas referenced on [profiles.yml](dags/dbt/profiles.yml). Make sure that the user set on this profile file is the same that owns the schema on Postgres.

4. Add the environment variables from step 1 to your OS.

5. To run the desired DBT project, open the terminal on the project folder and run the command: `dbt run --target dev --profiles-dir ../`.

6. If you open PGAdmin, you will see the the created tables.

### Generating DBT projects documentation during development

DBT provides a tool to generate a static web page containing all the documentation for the projects. You can generate one for each project if you open the terminal on each project folder and run the commands: `dbt docs generate --target dev --profiles-dir ../`(this will generate the index.html file), and `dbt docs serve --target dev --profiles-dir ../` - this will create a web server and documentation will be available on `http://127.0.0.1:8080/`.

But considering we have multiple projects, we want to build a single web page containing all the documentation for all the projects. In this case, we created a documentation project and imported all other projects. This way we can follow the steps below:

1. Open the terminal on [documentation project](dags/dbt/documentation/)
2. Run the command `dbt docs generate --target dev --profiles-dir ../` to generate the index.html for all projects.
3. Run the command `dbt docs serve --target dev --profiles-dir ../` to start the web server for the generated documentation available on `http://127.0.0.1:8080/`.

This is just a way to check the document during development. For production environments, this index.html file should be uploaded to a proper web server (here we upload to AWS S3 during CD pipeline).

## Deployment to AWS Airflow MWAA

### Requirements

- You should have a previous infrastructure in place. Its required a AWS Airflow Managed instance running as well as a S3 bucket.
- Make sure there is an OpenID connection between your AWS account and your airflow repository to allow Github action to deploy to S3. Here is the [link](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services) for this procedure. It is not recommended, but you can create a user and use the user ACCESS_KEY and SECRET_KEY to include on the CD pipeline instead of using OpenID Connect.

### Deployment

1. Fork this repository.
2. Update the .github/workflows/deploy_to_s3.yml file to match your S3 bucket and role.
3. Updated the DAGs according to your needs.
4. Merge with master and it will get deployed to your S3 bucket.
5. Airflow should automatically update the DAGs.
6. Now you can create new DAGs and/or DBT projects according to your needs.

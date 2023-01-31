#!/bin/bash

DBT_PROJECT=$1
export db_host=localhost
export db_port=5432
export db_user=myuser
export db_pass=mypassword

cd $DBT_PROJECT
dbt deps
dbt run --target dev --profiles-dir ../
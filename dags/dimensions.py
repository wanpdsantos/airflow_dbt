from datetime import datetime

from airflow import DAG
from airflow.operators.empty import EmptyOperator

WORKFLOW_DEFAULT_ARGS = {
    "start_date": datetime(2021, 7, 21),
    "depends_on_past": False,
    "retries": 3,
    "retry_delay": 300,
}

with DAG(
    dag_id="dag_for_testing",
    default_args=WORKFLOW_DEFAULT_ARGS,
    default_view="grid",
    description="Dag created for testing DBT and Airflow CI/CD pipeline",
    schedule_interval=None,
    catchup=False,
    max_active_runs=1,
) as dag:
    start_operator = EmptyOperator(task_id="Begin_execution")
    end_operator = EmptyOperator(task_id="Stop_execution")

    (start_operator >> end_operator)

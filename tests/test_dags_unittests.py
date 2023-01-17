from airflow.models.dagbag import DagBag


def test_dags_integrity() -> None:
    """Airflow dags Integrity Testing to avoid Broken Dag error"""

    dag_bag = DagBag(dag_folder="./dags", include_examples=False)
    assert len(dag_bag.import_errors) == 0, "No Import Failures"

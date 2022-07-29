import os
from importlib import machinery, util
from pathlib import Path

import pytest
from airflow.models.dag import DAG

DAG_PATH = Path(__file__).resolve().parent.parent
DAG_FILES = [f for f in os.listdir(DAG_PATH) if f.endswith(".py")]


@pytest.mark.parametrize("dag_file", DAG_FILES)
def test_dag_integrity(dag_file):
    """Import dag files and check for DAG."""
    module_name, _ = os.path.splitext(dag_file)
    module_path = os.path.join(DAG_PATH, dag_file)
    mod_spec = util.spec_from_file_location(module_name, module_path)
    if isinstance(mod_spec, machinery.ModuleSpec):
        module = util.module_from_spec(mod_spec)
        mod_spec.loader.exec_module(module)  # type: ignore
        dag_objects = [var for var in vars(module).values() if isinstance(var, DAG)]
        assert dag_objects

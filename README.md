# Run the project
## MAC OS Development workflow
1. Clone the repo
2. Create a python virtual environment version 3.7 on project root: python3 -m venv venv
3. Activate the environment: source venv/bin/activate
4. Make sure the python version is 3.7 (to match airflow environment): python3 --version
5. Upgrade pip: python3 -m pip install --upgrade pip
6. Install the python packages: pip3 install -r requirements_dev.txt
7. When you try to commit, it will check the code. If its all good, commit will be done, if code require changes to be compliant to the applied rules, commit will fail. During the test, the code formatter automatically fix the code. So, if the commit attempt fails, just stage the automatically changes files and try to commit again
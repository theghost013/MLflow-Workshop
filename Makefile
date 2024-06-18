# Load variables from .env file
include config.env
export

# Define targets
init:
	@echo "Creating Python virtual environment 'mlflow_env'"; \
    python3 -m venv ../ENVS/mlflow_env; \
    @echo "Activating Python virtual environment 'mlflow_env'"; \
    . ../ENVS/mlflow_env/bin/activate; \
    @echo "Installing requirements"; \
    pip install -r requirements.txt; \
    echo "Initialization complete"
install:
	. ../ENVS/mlflow_env/bin/activate; \
	pip install --upgrade pip &&\
		pip install -r requirements.txt

local-compose-deploy:
	docker build -t mlflow . 
	docker-compose --env-file config.env up -d --build

run-mlflow:
	mlflow server --host 0.0.0.0 --port 5000


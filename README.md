# ML Model Pipeline Deployment

This repository demonstrates a machine learning pipeline deployment using multiple cloud-native and DevOps tools. The architecture outlined here integrates AWS, Docker, MLflow, Jenkins, Grafana, Snowflake, and other tools for a complete end-to-end machine learning workflow. Below is a breakdown of each component and the overall system architecture:

## Overview of the Pipeline Architecture

The pipeline is designed to automate the end-to-end machine learning workflow, from data access to model deployment and monitoring. It leverages Docker for containerization, Jenkins for CI/CD, MLflow for experiment tracking, and Grafana for monitoring.

### Key Components

1. **AWS**: This pipeline uses AWS (Amazon Web Services) to host various services and components of the infrastructure.
   - **Amazon S3**: Used as a storage service to hold datasets and machine learning models. The pipeline accesses data from S3, performs feature engineering, and then stores the trained model artifacts back into S3.
   
2. **MLflow**: A platform for managing the machine learning lifecycle. This includes experimentation, reproducibility, and deployment of ML models. The pipeline tracks model metrics and artifacts in MLflow.
   - **Key functions**: 
     - Accessing data
     - Performing feature engineering
     - Training the model
     - Saving the model artifacts

3. **Snowflake**: Acts as the data warehouse for fetching and storing structured data. It enables seamless integration with the pipeline for data access and storage.

4. **VS Code (Remote Development)**: The development environment used to write and test code remotely, accessing Snowflake and MLflow. This allows for efficient interaction with the Snowflake database and other cloud services like S3.

5. **Jenkins**: The Jenkins server is set up to automate the continuous integration and continuous delivery (CI/CD) of the machine learning pipeline.
   - **Ports**:
     - Port 8080: Jenkins Server
     - Port 5000: MLflow
     - Port 3000: Grafana (Monitoring)
   - Jenkins runs tests, builds containers, and orchestrates the deployment of the model.

6. **Docker**: The entire pipeline is containerized using Docker, ensuring consistent environments across all stages (development, testing, and production). The Jenkins jobs trigger Docker containers for each part of the pipeline.

7. **Grafana**: This tool is used for monitoring the pipeline, visualizing important metrics like model performance, build status, and system health.
   - Integrated with Jenkins and MLflow for real-time monitoring.

8. **Railway APP**: The final model and application are deployed via Railway APP. The application can be accessed using the provided QR code or the [live demo link] (https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html)

### How it Works

1. **Data Access & Preprocessing**:
   - The pipeline starts by accessing raw data from Snowflake and Amazon S3. The data is preprocessed, and feature engineering is performed before the model is trained.
   
2. **Model Training**:
   - Once the data is ready, the model training phase begins. MLflow is responsible for tracking the experiment's metadata, such as parameters, metrics, and artifacts (trained models).

3. **Model Saving**:
   - After the training phase, the final model is saved to Amazon S3 for storage.

4. **Continuous Integration & Deployment**:
   - Jenkins handles the CI/CD process, ensuring that new changes in the model or code trigger a new build. The code is containerized using Docker, and the application is deployed.

5. **Monitoring & Logging**:
   - Grafana monitors the health of the entire pipeline, including the performance of the deployed model, Jenkins jobs, and Docker containers. This ensures real-time tracking of pipeline performance and quick identification of any issues.

6. **Deployment on Railway**:
   - The trained model is deployed as a service via Railway APP. The app provides an interface where users can interact with the machine learning model.

## Quick Links

- [GitHub Repository] (https://github.com/HuseynA28/awsMlopsFaceApp)
- [Live Demo] ([https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html](https://facerecognitionmachinelearning-production-f097.up.railway.app/))

## QR Code for Access

You can quickly access the deployed application by scanning the QR code below:

![adobe-express-qr-code](https://github.com/user-attachments/assets/51ad7913-5fff-4275-b7be-95c2576bf56d)


## How to Run Locally

1. Clone the repository:

   ```bash
   git clone https://github.com:HuseynA28/awsMlopsFaceApp.git

Set Up Environment Variables

 
## Create a .env file in the root directory and add your  credentials.



### .env File

```bash
# Environment Variables for Docker and Services

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=

MYSQL_USER=mlflowuser
MYSQL_PASSWORD=mlflowpassword
MYSQL_DATABASE=mlflowdb
MYSQL_ROOT_PASSWORD=rootpassword

PGADMIN_DEFAULT_EMAIL=admin@example.com
PGADMIN_DEFAULT_PASSWORD=adminpassword

MLFLOW_S3_ENDPOINT_URL=
S3_MLFLOW_BUCKET=

POSTGRES_PASSWORD=postgrespassword
```
```bash
# Environment Variables for Notebooks

aws_access_key_id=
aws_secret_access_key=

SNOWFLAKE_ACCOUNT=
SNOWFLAKE_USER=
SNOWFLAKE_PASSWORD=
SNOWFLAKE_SCHEMA=
SNOWFLAKE_DATABASE=
SNOWFLAKE_ROLE=
SNOWFLAKE_WAREHOUSE=

POSTGRES_PASSWORD=postgrespassword
```
### Explanation:
- **Docker and Services Section**: This includes environment variables for AWS, MySQL, and other services used in your Docker containers.
- **Notebooks Section**: These environment variables are specifically for accessing Snowflake and other related resources in the notebooks.

This structure makes it easy to manage environment variables across different tools in a single `.env` file.




![Animation 1](https://github.com/user-attachments/assets/536173fc-9dd8-4dd4-8b56-3479d2f6df17)

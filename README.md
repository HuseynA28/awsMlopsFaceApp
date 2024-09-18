
# 🧠 ML Model Pipeline Deployment

![Pipeline Overview](https://github.com/user-attachments/assets/536173fc-9dd8-4dd4-8b56-3479d2f6df17)

This repository showcases a comprehensive **Machine Learning (ML) pipeline deployment** leveraging cloud-native and DevOps tools. The architecture integrates **AWS**, **Docker**, **MLflow**, **Jenkins**, **Grafana**, **Snowflake**, and more to deliver an end-to-end ML workflow.

## 🚀 Quick Links

- [🔗 GitHub Repository](https://github.com/HuseynA28/awsMlopsFaceApp)
- [📺 Live Demo](https://facerecognitionmachinelearning-production-f097.up.railway.app/)

![Live Demo QR Code](https://github.com/user-attachments/assets/51ad7913-5fff-4275-b7be-95c2576bf56d)

*Scan the QR code above to access the deployed application instantly.*

---

## 📊 Pipeline Architecture Overview

The pipeline automates the entire ML lifecycle, from data ingestion to model deployment and monitoring. Key technologies include:

- **Containerization** with Docker
- **Continuous Integration/Continuous Deployment (CI/CD)** using Jenkins
- **Experiment Tracking** via MLflow
- **Monitoring** through Grafana

### 🛠️ Key Components

| Component             | Description                                                                                                                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **AWS**               | Hosts various services including: <br>• **Amazon S3**: Storage for datasets and ML models. <br>• **Snowflake**: Data warehouse for structured data.                            |
| **MLflow**            | Manages the ML lifecycle: <br>• Experiment tracking <br>• Reproducibility <br>• Model deployment                                                                         |
| **Snowflake**         | Data warehouse facilitating seamless data access and storage within the pipeline.                                                                                            |
| **VS Code (Remote)**  | Development environment for writing and testing code, with remote access to Snowflake and MLflow.                                                                          |
| **Jenkins**           | Automates CI/CD processes: <br>• Runs tests <br>• Builds Docker containers <br>• Orchestrates model deployment                                                             |
| **Docker**            | Ensures consistent environments across development, testing, and production stages.                                                                                          |
| **Grafana**           | Monitors pipeline health and visualizes metrics like model performance, build status, and system health.                                                                    |
| **Railway APP**       | Deploys the final ML model and application, accessible via QR code or [live demo](https://facerecognitionmachinelearning-production-f097.up.railway.app/)                |

---

## 🔧 How It Works

1. **📥 Data Access & Preprocessing**
   - **Sources**: Raw data is fetched from **Snowflake** and **Amazon S3**.
   - **Process**: Data is preprocessed and feature engineering is performed to prepare for model training.

2. **🏋️ Model Training**
   - **Tracking**: **MLflow** tracks experiment metadata, including parameters, metrics, and artifacts.
   - **Execution**: Models are trained using the preprocessed data.

3. **💾 Model Saving**
   - The trained model artifacts are stored back into **Amazon S3** for future reference and deployment.

4. **🔄 Continuous Integration & Deployment**
   - **Jenkins** automates the CI/CD pipeline:
     - **Testing**: Runs automated tests to ensure code quality.
     - **Building**: Containerizes the application using **Docker**.
     - **Deployment**: Orchestrates the deployment of the model to production environments.

5. **📈 Monitoring & Logging**
   - **Grafana** provides real-time monitoring of:
     - Model performance
     - Jenkins build statuses
     - Docker container health
   - Ensures quick identification and resolution of issues.

6. **🌐 Deployment on Railway**
   - The final model is deployed as a service via **Railway APP**.
   - Users can interact with the ML model through a user-friendly interface.

---

## 🛠️ Setup & Installation

### 1. Clone the Repository

```bash
git clone https://github.com/HuseynA28/awsMlopsFaceApp.git
cd awsMlopsFaceApp
```
2. Configure Environment Variables
Create a .env file in the root directory and populate it with your credentials.

📄 .env File
```bash
Copy code
# 🔒 Docker and Services
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
AWS_DEFAULT_REGION=your_aws_region

MYSQL_USER=mlflowuser
MYSQL_PASSWORD=mlflowpassword
MYSQL_DATABASE=mlflowdb
MYSQL_ROOT_PASSWORD=rootpassword

PGADMIN_DEFAULT_EMAIL=admin@example.com
PGADMIN_DEFAULT_PASSWORD=adminpassword

MLFLOW_S3_ENDPOINT_URL=your_mlflow_s3_endpoint
S3_MLFLOW_BUCKET=your_s3_bucket_name

POSTGRES_PASSWORD=postgrespassword
```
# 📝 Notebooks
```bash
aws_access_key_id=your_aws_access_key
aws_secret_access_key=your_aws_secret_key

SNOWFLAKE_ACCOUNT=your_snowflake_account
SNOWFLAKE_USER=your_snowflake_user
SNOWFLAKE_PASSWORD=your_snowflake_password
SNOWFLAKE_SCHEMA=your_snowflake_schema
SNOWFLAKE_DATABASE=your_snowflake_database
SNOWFLAKE_ROLE=your_snowflake_role
SNOWFLAKE_WAREHOUSE=your_snowflake_warehouse

POSTGRES_PASSWORD=postgrespassword
```

📋 Explanation
Section	Description
Docker and Services	Credentials for AWS, MySQL, PGAdmin, MLflow S3, and PostgreSQL services used in Docker containers.
Notebooks	Credentials for accessing Snowflake and AWS services within Jupyter notebooks or other development environments.
3. Build and Run Containers
Ensure Docker is installed and running on your machine.

```bash
Copy code
docker-compose up --build
4. Access Services
Jenkins: http://localhost:8080
MLflow: http://localhost:5000
Grafana: http://localhost:3000
VScode : http://localhost: 8080
Postgres : http://localhost: 5433
Adminer : http://localhost: 8080
```
🖥️ Development Environment
Use VS Code with Remote Development extensions to interact with the pipeline seamlessly.

🔌 Connecting to Remote Development
Open VS Code.
Install the Remote Development extension pack.
Connect to your remote environment where Snowflake and MLflow are accessible.
📈 Monitoring and Visualization
Grafana provides insightful dashboards to monitor the pipeline's health and performance.

📊 Key Metrics
Model Performance: Track accuracy, precision, recall, and other relevant metrics.
Build Status: Monitor the status of Jenkins builds and deployments.
System Health: Observe CPU, memory usage, and other system metrics.


🛡️ Continuous Integration & Deployment
Jenkins automates the CI/CD pipeline ensuring efficient and reliable deployments.

🔌 Jenkins Ports

```bash
Service	Port
Jenkins	8080
MLflow	5000
Grafana	3000


```
🚀 CI/CD Workflow

Code Commit: Push changes to the GitHub repository.
Jenkins Trigger: Automatically triggers a new build.
Testing: Runs automated tests to validate changes.
Docker Build: Creates new Docker images for the updated application.
Deployment: Deploys the new containers to the production environment.
Monitoring: Grafana tracks the deployment's impact on system health and model performance.
📚 Experiment Tracking with MLflow
MLflow manages the ML lifecycle, ensuring experiments are reproducible and models are deployable.

🔍 MLflow Features
Experiment Tracking: Log parameters, metrics, and artifacts.
Model Registry: Manage model versions and stages.
Deployment: Seamlessly deploy models to various platforms.
☁️ Cloud Services Integration
🌩️ AWS Services
Amazon S3: Central storage for datasets and model artifacts.
Snowflake: Scalable data warehousing solution integrated with the pipeline.
🐳 Docker
Containerizes the entire pipeline, ensuring consistency across development, testing, and production environments.

📦 Deployment on Railway
Deploy the trained model as a service using Railway APP for easy accessibility.

🌐 Access the Deployed Application
Live Demo: facerecognitionmachinelearning-production-f097.up.railway.app

QR Code:



📖 License
This project is licensed under the MIT License.

🤝 Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

📧 Contact
For any questions or feedback, feel free to reach out:

Email: 
LinkedIn: Your LinkedIn Profile
🔗 [Back to Top](https://www.linkedin.com/in/huseyn-abdullayev-566a74123/)

🛠️ Technologies Used

markdown
Copy code

---

### Notes:

- **Image URLs**: Ensure that the image URLs (e.g., pipeline overview, QR codes, Grafana dashboard) are correct and publicly accessible. Replace the placeholder URLs (`https://github.com/user-attachments/assets/...`) with the actual paths to your images.

- **Back to Top Link**: The link `[Back to Top](#-ml-model-pipeline-deployment)` assumes that the main header has the ID `#🧠-ml-model-pipeline-deployment`. If this doesn't work as expected, you may need to adjust the link to match the actual ID generated by your Markdown renderer. Alternatively, you can link to the top of the document using `[Back to Top](#ml-model-pipeline-deployment)` or simply `[Back to Top](#)`.

- **Environment Variables**: Make sure to **never** commit your `.env` file or expose sensitive credentials in your repository. Use tools like `.gitignore` to exclude the `.env` file from version control.

- **Live Demo Link**: Verify that the live demo link is correct and accessible. The current link points to a Railway app; ensure it's deployed and operational.

- **Contact Information**: Update the placeholder email and LinkedIn profile links with your actual contact information.

Feel free to further customize the documentation to better fit your project's speci





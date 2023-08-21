# FunnyFarm
Website in progress, coming soon to help someone's farm out.
<br>
<br>
To create the application:
- Create index.html
- Download images to include within index.html

## Containerization
- Write Dockerfile
- Build image by running `docker build -t funny-farm-website .`
- Test the application locally by running `docker run -p 80:80 funny-farm-website` and open localhost in web browser

## Cloud Application
- not using gcloud command line tools, problems with apt-key being deprecated
- Console: Products - Create a containerized app (K8s Engine)
    - Create Google Cloud Project
    - Enable K8s Engine API
    - Create "funny-farm-cluster" in K8s Engine -> Clusters ...with default settings
    - Deploy application in K8s Engine -> Workloads 
        - Choose correct container options for application
            - authorize GCP access to GH repo
            - If building a new image from repo, this step will push the container image build to GCR
        - Set Deployment name in configuration (funny-farm-app)
        - Choose correct K8s cluster (funny-farm-cluster)
        - In Expose, setup load balancer, check expose deployment as a new service and choose ports 
(show screenshots of Google Cloud console: K8s cluster, Workloads, Deployment, Bucket)
    
## CICD
- Google Cloud CICD:
    - Install Google Cloud Build on all or select repositories (I only installed on my FunnyFarm repo for this project)
    - Choose Build configurations: branch, Dockerfile directory, Dockerfile name
    - Automate K8s deployment files with Google Cloud recommendations
        - Cloud Build service account needs permissions to manage K8s containers, grant the service account K8s Engine Dev role
        - Include automated K8s file within /kubernetes/ directory in FunnyFarm repo
(show new image of Buckets and highlight cloudbuild, show image of Cloud Build Edit trigger, show images comparing first running website to post-CICD website)

### Note: See [Dockerfile](https://github.com/adasMatt/FunnyFarm/blob/main/Dockerfile) and [index.html](https://github.com/adasMatt/FunnyFarm/blob/main/index.html) for changes being made that demonstrate container and running application changes being made

- \*\*future addition\*\* GH Actions CICD (see template given by GitHub in "Get Started with GitHub Actions" Category - Deployment)
(show image, black out "deleteRepo")

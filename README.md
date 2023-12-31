# FunnyFarm
Website in progress, coming soon to help someone's farm out.
<br>
<br>
To create the application:
- Create index.html
- Download images to include within index.html

## Architecture 
![Initial website application](https://github.com/adasMatt/FunnyFarm/blob/main/screenshots/funnyFarmGKEArchLightMode.jpg)  
The application is running on the web, accessible to public users. Behind the application of course is the underlying infrastructure. This consists of a Kubernetes cluster, known in this context as GKE (Google Kubernetes Engine), setup through the Google Cloud Platform. Kubernetes automates load balancing with the servers running the application. The GCR (Google Container Registry) is where the application is stored, so that when load balancing is actually needed, the replacement server can pull the image from GCR. 

The 2 part section labeled CICD (Continuous Integration Continuous Delivery) Automation Pipeline is the main focus of this project. When the Engineers want to update the application, they make changes to their files, then push those changes to the GitHub repository, which has Cloud Build installed to trigger the automated update of the Container image as well as the currently running application on GKE. The user will see the changes.

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
  
[//]: <>  (show screenshots of Google Cloud console: K8s cluster, Workloads, Deployment, Bucket)
    
## CICD
- Google Cloud CICD:
    - Install Google Cloud Build on all or select repositories (I only installed on my FunnyFarm repo for this project)
    - Choose Build configurations: branch, Dockerfile directory, Dockerfile name
    - Automate K8s deployment files with Google Cloud recommendations
        - Cloud Build service account needs permissions to manage K8s containers, grant the service account K8s Engine Dev role
        - Include automated K8s file within /kubernetes/ directory in FunnyFarm repo
  
Initial website application 
![Initial website application](https://github.com/adasMatt/FunnyFarm/blob/main/screenshots/websitePreCICD.png)  
  
On GitHub: Google Cloud Build application
![On GitHub: Google Cloud Build application](https://github.com/adasMatt/FunnyFarm/blob/main/screenshots/GCBuildAppOnGH.png)  
  
On GC Console: Cloud Build trigger details
![On GC Console: Cloud Build trigger details](https://github.com/adasMatt/FunnyFarm/blob/main/screenshots/GCBuildOnGCConsole.png)  
  
Website application after updating image and using CICD to update  
![Website application after updating image and using CICD to update](https://github.com/adasMatt/FunnyFarm/blob/main/screenshots/websitePostCICD.png)   
  
### Note: See [Dockerfile](https://github.com/adasMatt/FunnyFarm/blob/main/Dockerfile) and [index.html](https://github.com/adasMatt/FunnyFarm/blob/main/index.html) for changes being made that demonstrate container and running application changes being made  
  
[//]: <>  (show new image of Buckets and highlight cloudbuild, show image of Cloud Build Edit trigger, show images comparing first running website to post-CICD website)  


- \*\*future addition\*\* GH Actions CICD (see template given by GitHub in "Get Started with GitHub Actions" Category - Deployment)  
- \*\*another future addition\*\* Switch from [GKE to EKS](https://aws.amazon.com/blogs/opensource/using-kubernetes-migration-factory-kmf-to-migrate-from-google-kubernetes-engine-gke-to-amazon-elastic-kubernetes-service-amazon-eks/)
  
[//]: <>  (show GH screenshots)

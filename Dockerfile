FROM nginx:alpine

COPY index.html /usr/share/nginx/html

# changing the following line will update the container
# change the index.html as well to use either picture to demonstrate working CICD on Google Cloud
# I suppose the container might be able to include both images and only index.html needs to be changed for the running application, but then the container would never need to be changed during CICD..
COPY funnyFarmBarn.jpg /usr/share/nginx/html
#COPY funnyFarmEntrance.jpg /usr/share/nginx/html
FROM nginx:alpine

COPY index.html /usr/share/nginx/html

# changing the following line will update the container
# change the index.html as well to use either picture to demonstrate working CICD on Google Cloud
#COPY funnyFarmBarn.jpg /usr/share/nginx/html
COPY funnyFarmEntrance.jpg /usr/share/nginx/html
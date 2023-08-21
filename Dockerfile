FROM nginx:alpine

COPY index.html /usr/share/nginx/html

# changing the following line will update the container
COPY funnyFarmBarn.jpg /usr/share/nginx/html
#COPY funnyFarmEntrance.jpg /usr/share/nginx/html
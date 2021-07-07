#Build image from dockerfile
docker build -t php-app .
#Run container from this image
docker run -d -it --rm --name running-php-cont php-app
#Stop all containers
docker stop running-php-cont
#Run docker-compose
docker-compose up -d
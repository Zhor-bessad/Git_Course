# You could open this script file in a text editor and copy past the lines
# one by one and executing them on ubuntu terminal
# or execute the script in one go by entering the following command
# on ubuntu terminal as follow
# ./zhour.sh

# this command is for pulling the php:7.2-apache image from docker hub
docker pull php:7.4-apache


# this command is for running the container under the name zhour-php-server
# the -d option is for running the container in the background
# the -p 8088:80 is for mapping the tcp guest port 80 on which the container is listening 
# to the host port 8088
# the --rm is to automaticaly delete the container once we stop it by docker stop zhour-php-server 
# the --name is to give the container a name, thus we could easly recognize 
# it in docker ps 
# -v path-In-The-Host:path-In-The-Container   is for mapping a directory in the host to a directory in the container
# In our case path-In-The-Host is the Environnement variable "$PWD" which stands for
# Present Workind Directory ; meaning the directory from which you started the script
# or launched the command if you will
# path-In-The-Container is /var/www/html  which is the directory the apache web server serves web pages from
# zhour-php-server is the name we gave to our container 
# php:7.2-apache   is the docker image name

docker run -d -p 8082:80 --rm --name php-image -v "$PWD":/var/www/html php:7.4-apache

# once you execute this script you just have to open your browser and go to http://localhost:8082
# to display the page
# write whatever content your web site is mad of on your working directory
# and the content will be displayed whenever you refresh you browser page

# next time I will show you how to permanently copy your web site to the docker Image
# by the mean of a Dockerfile


#Build image from app web
docker build -t imageweb .

#execute image

docker run -d -p 8086:80 --rm --name srvweb -v "$PWD":/var/www/html imageweb

#push this image in docker hub
docker build -t zhordockerid/imageweb .

# command to log in to docker hub
docker login

# to push the image to docker hub
docker push zhordockerid/imageweb

#Pull this image in server
docker pull zhordockerid/imageweb

#run container from this image
docker run -d --name pullhub -p 8081:80 zhordockerid/imageweb

#execute on browser: http://localhost:8081
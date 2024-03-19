FROM nginx

#File maintainer
MAINTAINER "nidhikashyap168@gmail.com"

# update lib
RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server
# ifconfig
RUN apt-get install -y net-tools

EXPOSE 8080:80

# Run the Nginx server
ENTRYPOINT service nginx start && bash                                        

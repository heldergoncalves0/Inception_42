FROM debian:11

# Install Nginx
RUN apt-get update -y && apt-get install -y nginx

#Install OpenSSL
RUN apt-get install -y openssl

#Generate certificates
RUN openssl req -x509  -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
			-out /etc/ssl/certs/nginx-selfsigned.crt \
				-subj "/C=FR/L=PT/O=42/OU=student/CN=helferna.42.fr"

#Copy html page
COPY ./conf/index.html /usr/share/nginx/html/

# Copy the configuration file
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Expose the port
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
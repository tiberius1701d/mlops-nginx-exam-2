FROM nginx:1.31.6

COPY nginx.conf /etc/nginx/nginx.conf
COPY certs/ /etc/nginx/certs/
COPY .htpasswd /etc/nginx/.htpasswd

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

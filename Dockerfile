FROM nginx
COPY monitor.sh /app/monitor.sh
RUN  apt-get update && apt-get install  procps -y
RUN bash /app/monitor.sh > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


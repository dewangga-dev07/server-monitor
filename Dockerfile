FROM nginx
COPY monitor.sh /app/monitor.sh
RUN bash /app/monitor.sh > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


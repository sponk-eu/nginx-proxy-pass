FROM nginx:1.15.8

COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/wait-for-it.sh", "$TARGET_SERVER", "--", "/start.sh"]

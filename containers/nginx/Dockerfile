FROM nginx:1.16
ARG APP_HOST
COPY ./conf.template /etc/nginx/sites-available/site.conf.template
RUN envsubst '${APP_HOST}' < /etc/nginx/sites-available/site.conf.template > /etc/nginx/sites-available/site.conf
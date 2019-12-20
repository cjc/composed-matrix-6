FROM nginx:1.15.8

COPY matrix-common /etc/nginx/matrix-common
COPY gzip /etc/nginx/gzip
COPY fastcgi-params /etc/nginx/fastcgi-params

COPY matrixdemo.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

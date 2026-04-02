FROM ubuntu:24.04


EXPOSE 80


RUN apt update && apt install node=18.19.1


WORKDIR /app

COPY . /app

RUN npm install && npm run build

RUN cp -r ./ /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
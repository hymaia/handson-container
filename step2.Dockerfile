FROM nginx:alpine

# port à exposer pour accéder à l'application
EXPOSE 80

# on installe les outils nécessaire à la construction et à l'exécution
RUN apk update
RUN apk add nodejs


# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . .


# On construit l'application et on la déplace dans le bon dossier pour nginx
WORKDIR /app/frontend/
RUN npm install
RUN npm run build
RUN mkdir -p /usr/share/nginx/html/
RUN cp -r dist/* /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]

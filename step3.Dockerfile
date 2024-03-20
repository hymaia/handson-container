# conteneur de build
FROM node:8.4.0-alpine AS builder

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . .

# on package l'application
RUN npm install
RUN npm run build

# conteneur de run
FROM nginx:1.17.5-alpine

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/dist /usr/share/nginx/html

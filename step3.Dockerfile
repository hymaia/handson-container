FROM nginx:alpine AS builder

EXPOSE 80

# on se place dans un dossier de travail et on y copie tout le code de l'application
RUN apk update
RUN apk add nodejs npm

# on package l'application
WORKDIR /app
COPY . .
WORKDIR /app/frontend/
RUN npm install
RUN npm run build

FROM nginx:alpine
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/frontend/dist /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]

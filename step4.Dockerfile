# conteneur de build
FROM node:8.4.0-alpine AS builder

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . .

# on package l'application
RUN npm install
RUN npm run build

# conteneur de run
FROM franckcussac/rust-webserver:static


# on récupère le résultat de notre conteneur de build
COPY --from=builder /app/dist /public/

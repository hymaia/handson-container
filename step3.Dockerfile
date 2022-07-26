# conteneur de build
FROM ???

# on se place dans un dossier de travail et on y copie tout le code de l'application
???
???

# on package l'application
???

# conteneur de run
FROM nginx:1.17.5-alpine

# port à exposer pour accéder à l'application
???

# on récupère le résultat de notre conteneur de build
COPY ??? ??? /usr/share/nginx/html

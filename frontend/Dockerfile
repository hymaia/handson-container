FROM node:alpine AS builder

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build


FROM nginx:alpine

EXPOSE 3000

WORKDIR /app

COPY --from=builder /app/dist/ /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
FROM node:alpine AS builder

WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci --omit=dev
COPY frontend/ .
RUN npm run build

FROM scratch
COPY --from=builder /app/frontend/dist /

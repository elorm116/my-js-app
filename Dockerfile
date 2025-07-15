FROM node:18-alpine

WORKDIR /app

COPY simple-js-app/package*.json ./
RUN npm ci --only=production

COPY app/ .

EXPOSE 3000

USER node

CMD ["npm", "start"]

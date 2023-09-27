FROM node:19.5.0-alpine
WORKDIR /app
COPY /app ./
EXPOSE 9007
RUN npm install
RUN npm install -g pm2
CMD ["pm2-runtime", "start", "--env", "production", "process.json"]

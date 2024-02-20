FROM node:latest

WORKDIR /app

COPY . .

RUN npm install -y

EXPOSE 8003

CMD ["node","app.js"]

# docker run -it -p 8003:8003 --name botkitApp korenodeapp
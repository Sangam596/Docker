# multistage distroless image 

# Stage 1: Build stage
FROM node:21-alpine as build
WORKDIR /app
#COPY all the folders & files from current directory to /app
COPY . .
#Install npm packages without devDependencies
RUN npm install --omit=dev

# Stage 2: Production stage
FROM gcr.io/distroless/nodejs20-debian11
WORKDIR /app
#COPY only required files from build stage to final stage
COPY --from=build app/lib/ ./lib 
COPY --from=build app/views/ ./views
COPY --from=build app/node_modules/ ./node_modules
COPY --from=build app/package*.json . 
COPY --from=build app/SimpleConversationalBot.js . 
COPY --from=build app/makeHttpCall.js . 
COPY --from=build app/LiveChat.js . 
COPY --from=build app/LiveChatAPI.js . 

COPY config.json . 
COPY app.js .
EXPOSE 8003
CMD ["node", "app.js"]

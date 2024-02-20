# What is multi stage docker file with example 

With multi-stage builds, you use multiple FROM statements in your Dockerfile. Each FROM instruction can use a different base, and each of them begins a new stage of the build. You can selectively copy artifacts from one stage to another, leaving behind everything you don't want in the final image.

 Multi-stage Dockerfile is a feature introduced in Docker to optimize the image size and build process by using multiple stages in the Dockerfile. 
 Each stage can have its own base image and set of instructions, allowing you to build intermediate images and only copy necessary artifacts into the final image. 
 This helps reduce the size of the final image and improves build efficiency.

Here's an example of a multi-stage Dockerfile for a Node.js application:

# Stage 1: Build stage
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production stage
FROM node:14-alpine AS production
WORKDIR /app
COPY --from=build /app .
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json .
EXPOSE 3000
CMD ["node", "index.js"]


In this example:

Stage 1 (Build stage):
Uses a full Node.js image (node:14) as the base image for building the application.
Copies package.json and package-lock.json to the working directory and installs dependencies.
Copies the application code and builds the application using npm run build.
This stage produces the built artifacts needed for running the application.

Stage 2 (Production stage):
Uses a lightweight Node.js Alpine image (node:14-alpine) as the base image for the production image.
Copies the built application (dist folder) and dependencies from the build stage into the production image.
Exposes port 3000 for the application.
Defines the command to run the application.

With this multi-stage Dockerfile, Docker first builds the application in the first stage and creates an intermediate image. Then, it copies only the necessary artifacts from the first stage into the second stage, resulting in a smaller and more efficient final image for production use.

# What is distroless image with example?
Distroless images are container images that contain only your application and its runtime dependencies, without including any unnecessary operating system packages or tools. 
These images are designed to minimize the attack surface and reduce the size of the container image, improving security and efficiency.
And distroless images are maintained by Google Container Tools

Here's an example of a Dockerfile using a Distroless base image for a simple Node.js application:

FROM gcr.io/distroless/nodejs:14
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]


In this example:

We're using the Distroless base image for Node.js (gcr.io/distroless/nodejs:14), which contains only the Node.js runtime and minimal dependencies necessary to run a Node.js application.
We copy package.json and package-lock.json to the working directory and install dependencies using npm install --only=production to avoid installing development dependencies.
The application code is then copied into the container.
We expose port 3000 to allow external access to the application.
Finally, we specify the command to run the application (node index.js).

Using Distroless images helps reduce the attack surface of your container by removing unnecessary components such as shells, package managers, and system libraries. This makes Distroless images particularly well-suited for running production applications in a secure and efficient manner.


# multistage distroless image 
# Stage 1: Build stage
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

# Stage 2: Production stage
FROM gcr.io/distroless/nodejs:14
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]



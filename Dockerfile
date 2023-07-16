# Use official Node.js Docker image.
FROM node:14

# Set the working directory.
WORKDIR /usr/src/app

# Install dependencies.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source.
COPY . .

# Compile TypeScript.
RUN npm run build

# Expose the port your app runs in.
EXPOSE 8080

# Start the app.
CMD [ "node", "dist/index.js" ]
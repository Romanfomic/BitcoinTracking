# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Nuxt.js application
RUN npm run build

# Expose the port on which Nuxt.js will run
EXPOSE 3000

# Start the Nuxt.js application
CMD ["npm", "start"]

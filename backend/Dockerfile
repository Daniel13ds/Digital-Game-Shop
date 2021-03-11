FROM node:14-alpine

# Final stage

FROM node AS final

# Set node environment to production
ENV PORT=6060
ENV MONGO_URI=mongodb://172.17.0.2/digitalshop
ENV JWT_KEY=FCTinComing

# Prepare destination directory and ensure user node owns it
RUN mkdir -p /home/node/app/dist && chown -R node:node /home/node/app

# Set CWD
WORKDIR /home/node/app

# Install PM2
RUN npm i -g pm2

# Copy package.json, package-lock.json and process.yml
COPY package*.json process.yml ./

# Install libraries as user node
RUN npm i --only=production

# Copy js files and change ownership to user node
COPY dist/ ./dist
RUN chown -R node:node dist/

# Switch to user node
USER node

# Open desired port
EXPOSE 6060

# Use PM2 to run the application as stated in config file
ENTRYPOINT ["pm2-runtime", "./process.yml"] 
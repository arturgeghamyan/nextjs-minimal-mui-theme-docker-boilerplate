# Use a Node 16 base image
FROM node:16-alpine

# RUN npm install -g yarn

# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY . .

ENV NODE_ENV production
ENV PORT 3000
EXPOSE 3000

# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN yarn install --frozen-lockfile

# Build the app
RUN yarn build
# ==== RUN =======

CMD [ "yarn", "start" ]
FROM node:10-alpine

RUN mkdir -p /app

# Create app directory
WORKDIR /app

# Copy project files into the docker image
COPY . .

RUN yarn install

CMD ["yarn", "start"]
CMD ["yarn", "storybook"]
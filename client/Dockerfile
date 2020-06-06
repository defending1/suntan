FROM node:10-alpine

RUN mkdir -p /app

# Create app directory
WORKDIR /usr/src/app

# Copy project files into the docker image
COPY . .

RUN yarn install

CMD ["yarn", "start"]
CMD ["yarn", "storybook"]
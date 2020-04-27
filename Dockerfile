FROM ruby:2.6.5
RUN apt-get update -y && apt-get install curl 
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn 
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile  /myapp/Gemfile
COPY Gemfile.lock  /myapp/Gemfile.lock
RUN bundle install
RUN yarn install
COPY . /myapp
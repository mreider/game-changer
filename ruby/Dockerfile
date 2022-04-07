FROM docker-library/ruby:3.15
ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . ./
CMD ["./game-changer.rb"]
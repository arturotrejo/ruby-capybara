FROM ruby:3.3.6

# Install Chrome
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get update
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

# Set up project
WORKDIR /ruby-capybara-framework
COPY . /ruby-capybara-framework
RUN bundle install

ENV DRIVER=docker_chrome_headless
ENV URL=https://secure.simplepractice.com

# Run test
CMD ["bundle", "exec", "rspec", "--example", "Client Creation", "--format", "documentation"]

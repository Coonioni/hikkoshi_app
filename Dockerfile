FROM ruby:2.6.6

# yarnをインストールするための準備
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Dockerでrailsを動かすためのツールをダウンロード
RUN apt-get update -qq && apt-get install -y nodejs yarn \
    build-essential \
    libpq-dev \
    default-mysql-client 

# hikkoshi_appディレクトリを作成
RUN mkdir /hikkoshi_app

# 作業ディレクトリをhikkoshi_appに指定
WORKDIR /hikkoshi_app

# ローカルにあるGemfileとGemfile.lockをDockerにコピーする。
ADD Gemfile /hikkoshi_app/Gemfile
ADD Gemfile.lock /hikkoshi_app/Gemfile.lock

RUN bundle install

COPY . /hikkoshi_app

# RUN yarn install --check-files
# RUN bundle exec rails webpacker:compile

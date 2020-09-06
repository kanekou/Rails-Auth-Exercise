# Debianがベースのrubyイメージを指定
FROM ruby:2.7.1

# 必要なものをインストール
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs

# yarn インストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# rails用のディレクトリを作成
RUN mkdir /rails-api

ENV APP_ROOT /rails-api

# 作業ディレクトリを指定
WORKDIR $APP_ROOT

# ローカルマシン(Mac)からコンテナの中にファイルをコピー
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock


# 上でコピーしたGemfileに従ってGemをインストール
RUN bundle install
ADD . $APP_ROOT

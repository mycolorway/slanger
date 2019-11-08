FROM ruby:2.1.10

RUN apt-get update -qq && apt-get install -y apt-transport-https build-essential

ENV APP_HOME=/app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN bundle

EXPOSE 4567
EXPOSE 8080
CMD slanger --app_key $APPKEY --secret $APPSECRET --webhook $WEBHOOK_URL -r redis://$REDIS_HOST:$REDIS_PORT/$REDIS_DB

FROM docker.io/elixir:alpine

WORKDIR /app
COPY . .


RUN apk update && apk add inotify-tools
RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix do deps.get, deps.compile

CMD ["mix", "phx.server"]


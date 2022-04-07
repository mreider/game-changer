#!/usr/bin/env ruby
require 'redis'
require 'sinatra'
redis = Redis.new(host: "redis")
redis.set("a", 1)
while true do
    redis.get("a")
    puts Time.now
    sleep 1
end
class App < Sinatra::Base
  get "/" do
    "hello world :))"
  end
end

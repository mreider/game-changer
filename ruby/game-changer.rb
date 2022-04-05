require 'redis'
redis = Redis.new(host: "localhost")
redis.set("a", 1)
while true do
    redis.get("a")
    puts Time.now # or call tick function
    sleep 1
end

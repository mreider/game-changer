command kubectl cluster-info >/dev/null 2>&1


if [ "$?" -eq 127 ]
# if we're running on a bare metal host
then 
    sudo apt-get install redis -y
    sudo hostnamectl set-hostname redis
    redis-server &
    git clone https://github.com/oliver006/redis_exporter.git
    cd redis_exporter
    go build .
    ./redis_exporter &
    cd ..
    sudo apt-get install ruby-full &
    git clone https://github.com/mreider/game-changer.git
    cd game-changer/ruby
    bundle install
    ruby game-changer.rb &
else
# if we're running in kubernetes
fi

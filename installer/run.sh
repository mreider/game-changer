sudo apt-get install git -y
sudo apt-get install redis -y
sudo hostnamectl set-hostname redis
redis-server &
curl -O https://go.dev/dl/go1.18.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
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
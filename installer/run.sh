sudo apt-get install git -y
sudo apt-get install redis -y
sudo sed -e 's/\redis//g' /etc/hosts > /etc/hosts
sudo sed -i '/^127\.0\.0\.1\s/s/$/ '"redis"'/' /etc/hosts
redis-server &
curl -OL https://go.dev/dl/go1.18.linux-amd64.tar.gz
sudo gunzip go1.18.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar
export PATH=$PATH:/usr/local/go/bin
git clone https://github.com/oliver006/redis_exporter.git
cd redis_exporter
go build .
./redis_exporter &
cd ..
sudo apt-get install ruby-full &
git clone https://github.com/mreider/game-changer.git
cd game-changer/ruby
gem install bundler
bundle install
ruby game-changer.rb &
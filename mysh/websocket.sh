#!/bin/bash
 
# Set the environment, as required by Monit
export PATH="/home/god/.rvm/gems/ruby-2.1.2/bin:/usr/bin:/home/god/.rvm/bin:/home/god/.rvm/rubies/ruby-2.1.2/bin/:${PATH}"
export GEM_PATH="/home/god/.rvm/gems/ruby-2.1.2:/home/god/.rvm/gems/ruby-2.1.2@global"
export GEM_HOME="/home/god/.rvm/gems/ruby-2.1.2"
 
start () {
  cd /var/app/chat/current
  BUNDLE_GEMFILE=/var/app/chat/current/Gemfile bundle exec rake websocket_rails:start_server RAILS_ENV=production
}
 
stop () {
  kill -s QUIT $(cat /var/app/chat/shared/tmp/pids/websocket_rails.pid)
}
 
case $1 in
  start)
    start
  ;;
  stop)
    stop
  ;;
  *)
  echo $"Usage: $0 {start|stop}"
  exit 1
  ;;
esac
 
exit 0
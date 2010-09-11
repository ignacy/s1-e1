require 'net/http'
require 'rubygems'
require 'uri'
require 'twitter'
require 'open-uri'
require File.dirname(__FILE__) + '/lokter_feed'

class Swiergot < Struct.new(:user, :password)
  def tweet(msg)
    client = authorize_with_oaut
    client.update(msg)
  end

  def pull_from_feed(feed = LokterFeed.new("http://lokter.pl/posts"))
    tweet feed.pull[0..140]
  end

  private

  def authorize_with_oaut
    config_file = File.dirname(__FILE__) + '/../config.yml'
    config = YAML::parse( File.open(File.expand_path(config_file)))
    oauth_token = config["oauth_token"].value
    oauth_token_secret = config["oauth_token_secret"].value
    token = config["token"].value
    secret = config["secret"].value
    
    oauth = Twitter::OAuth.new(oauth_token, oauth_token_secret)
    oauth.authorize_from_access(token, secret)
    return Twitter::Base.new(oauth)
  end
  

end

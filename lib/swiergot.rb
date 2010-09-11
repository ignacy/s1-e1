require 'net/http'
require 'rubygems'
require 'uri'
require 'twitter'
require 'nokogiri'
require 'open-uri
'
class Swiergot < Struct.new(:user, :password)



  def initialize(config_file = "~/.assembla")
    config = YAML::parse( File.open(File.expand_path(config_file)))
    @url      = config["url"].value
    @user     = config["user"].value
    @password = config["password"].value
    @me       = config["me"].value

    # For testing purposes if the url has no HTTP in it we assume
    # that assembla space is saved to a local file
    (@url =~ /http/) ? \
    self.page = Hpricot(open(@url, :http_basic_authentication=>[@user, @password])) \
    : self.page = Hpricot(open(@url))

    tickets
  end

  def tweet(msg)
    oauth = Twitter::OAuth.new('JjkyksybrQ1EjxnxuPT6Bg', 'qtmeMmsFzn3Nq3yHh2mZ6dKUcmtzHcz58AtkP9Ic')
    oauth.authorize_from_access("187459539-02goiIM8OkTNTqzEej77c5usxR9rddb6qZpoSRNB", "FFOl8NDmT4rQlN2FrIKlFYjCxyAjdO2x7wqmzllMao")
    client = Twitter::Base.new(oauth)
    client.update(msg)
  end

  def get_last_lokter_post
    post = Nokogiri::HTML(open('http://lokter.pl/posts')).css('div.post-content').first
    title = post.search("span").first.children.to_s
    description = post.search("p")[2].children.to_s 
    tweet("#{title} -- #{description}"[0..140])
  end

end

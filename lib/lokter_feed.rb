require 'nokogiri'

class LokterFeed < Struct.new :url
  def pull
    post = Nokogiri::HTML(open(self.url)).css('div.post').first
    what = post.css(".post-content").text
    who = post.css(".screen-name").text
    return "#{who} says: #{what}"
  end
end

require File.dirname(__FILE__) + '/../lib/swiergot'

describe Swiergot do
  context "basic functionality" do
    before(:all) do
      @bot = Swiergot.new("swiergot", "zombocom")
    end

# I have no idea how should I test this..

 #   it "should send messages" do
 #     response = @bot.tweet("Hello from swiergot #{rand(10000)}")
 #     response.to_s.should match(/Hello from swiergot \d*/)
 #   end

#    it "should get latest post from lokter" do
#       @bot.get_last_lokter_post
#    end

  end
end

  

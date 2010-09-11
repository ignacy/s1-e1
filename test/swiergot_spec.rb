require File.dirname(__FILE__) + '/../lib/swiergot'

describe Swiergot do
  context "basic functionality" do
    before(:all) do
      @bot = Swiergot.new("swiergot", "zombocom")
      @twitter_service = mock("Twitter", :update => true)
      @bot.stub!(:authorize_with_oaut).and_return(@twitter_service)
    end

    it "should send messages" do
      message = "Hello from swiergot"
      @twitter_service.should_receive(:update).with(message).once
      response = @bot.tweet(message)
    end
  end
end

  

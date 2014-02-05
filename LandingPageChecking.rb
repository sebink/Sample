require "rubygems"
gem "rspec"
gem "selenium-client"
require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec/test/unit"

describe "6666666" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://uat-portal.blutrumpet.com/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end
  
  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end
  
  it "test_6666666" do
    page.open "/b/site/index.html"
    page.click "link=Log In"
    page.click "link=Sign Up"
    begin
        ("Sign Up").should == page.get_text("link=Sign Up")
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
    begin
        ("Log In").should == page.get_text("link=Log In")
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
  end
end

require "rubygems"
gem "rspec"
gem "selenium-client"
require "selenium/client"
#require "selenium/rspec/spec_helper"
#require "spec/test/unit"

describe "8745764645646945654" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox",
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
  
  it "test_8745764645646945654" do
    page.open "/b/site/index.html"
    ("Sign Up").should == page.get_text("link=Sign Up")
    ("Log In").should == page.get_text("link=Log In")
    page.click "link=Log In"
    page.type "name=client[email]", "sebin@xxact.com"
    page.type "name=client[password]", "sebink"
    page.click "xpath=(//input[@value='SUBMIT'])[2]"
    page.wait_for_page_to_load "30000"
  end
end

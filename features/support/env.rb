require 'cucumber'
require 'selenium-webdriver'
require 'pry'
require 'rspec'
require 'page-object'
require 'cukehub'

Before do
  @cukehub_api_key = "1wymhea1Ye2qMeo2Bb6PAEGd"
  @browser = Selenium::WebDriver.for :chrome
  @browser.manage.timeouts.implicit_wait = 5
  @domain = "https://www.trunkclub.com"
end

AfterStep do
  js_errors = @browser.manage.logs.get(:browser)
  if @browser.current_url == @domain
    js_errors.each do |error|
      puts error.level
      raise "JAVASCRIPT ERRORS => #{js_errors}" unless error.level != "SEVERE"
    end
  end
end

After do 
  @browser.quit
end

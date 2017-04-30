Given(/^I am on the login page$/) do
  @browser.get(@domain + '/login')
end

Given(/^I enter an invalid email$/) do
  @browser.first(id: 'email').send_keys("invalid@mail.com")
end

Given(/^I enter a valid password$/) do
  @browser.first(id: 'password').send_keys("valid_password")
end

When(/^I click the Sign In button$/) do
  @browser.first(class: 'LoginPage-form').submit
end

Given(/^I enter a valid email$/) do
  @browser.first(id: 'email').send_keys("valid@mail.com")
end

Given(/^I enter an invalid password$/) do
  @browser.first(id: 'password').send_keys("invalid_password")
end

Given /I should (NOT )?see "(.*)"/i do |visibility, text|
  sleep 1
  text = text.to_s.strip
  if (visibility.to_s.strip == 'NOT') then
    @browser.find_element(tag_name: 'body').text.should_not include("#{text}")
  else
    @browser.find_element(tag_name: 'body').text.should include("#{text}")
  end
end
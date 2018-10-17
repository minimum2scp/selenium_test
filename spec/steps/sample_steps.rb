# -*- coding: utf-8 -*-

step ":use_browser でブラウザを起動する" do |use_browser|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument '--headless' if use_headless?
  @driver = Selenium::WebDriver.for use_browser.to_sym, options: options
  @driver.manage.timeouts.implicit_wait = 30
end

step "Seleniumのブラウザを閉じる" do
  @driver.close
end

step ":url にアクセスする" do |url|
  @driver.navigate.to url
end

step ":button ボタンが表示されていること" do |button|
  button_list = @driver.all(:tag_name, "button")
  expect(button_list.any?{|b| b.text == button}).to be_truthy
end


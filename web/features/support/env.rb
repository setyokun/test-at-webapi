require 'capybara'
require 'selenium-webdriver'
require 'cucumber' 
require 'capybara/cucumber'
require 'site_prism'
require 'data_magic'

DataMagic.yml_directory = 'features/data'

Before do                                                 
  @pages = Pages.new                                     

  Capybara.default_driver = :selenium_chrome               
  Capybara.app_host = 'https://www.amazon.com'        
  
  page.driver.browser.manage.window.resize_to(1366, 780) 
end
# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'BookActivityA1Timedout' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'bookActivityA1Timedout' do
    # Test name: Book Activity A1 Timed-out
    # Step # | name | target | value
    # 1 | open | / | 
    @driver.get('http://localhost:8086/')
    # 2 | setWindowSize | 1007x660 | 
    @driver.manage.resize_to(1007, 660)
    # 3 | click | id=startYourBooking | 
    @driver.find_element(:id, 'startYourBooking').click
    # 4 | click | id=username | 
    @driver.find_element(:id, 'username').click
    # 5 | type | id=password | Fatfr@g99
    @driver.find_element(:id, 'password').send_keys('Fatfr@g99')
    # 6 | type | id=username | gypsy@test.com
    @driver.find_element(:id, 'username').send_keys('gypsy@test.com')
    # 7 | click | name=login | 
    @driver.find_element(:name, 'login').click
    # 8 | click | id=book-new-test | 
    @driver.find_element(:id, 'book-new-test').click
    # 9 | click | id=proceed | 
    @driver.find_element(:id, 'proceed').click
    # 10 | click | id=activity-options | 
    @driver.find_element(:id, 'activity-options').click
    # 11 | select | id=activity-options | label=UKVI Speaking and listening at level A1
    dropdown = @driver.find_element(:id, 'activity-options')
    dropdown.find_element(:xpath, "//option[. = 'UKVI Speaking and listening at level A1']").click
    # 12 | click | id=activity-options | 
    @driver.find_element(:id, 'activity-options').click
    # 13 | click | id=proceed | 
    @driver.find_element(:id, 'proceed').click
    # 14 | click | id=countries | 
    @driver.find_element(:id, 'countries').click
    # 15 | select | id=countries | label=Afghanistan
    dropdown = @driver.find_element(:id, 'countries')
    dropdown.find_element(:xpath, "//option[. = 'Afghanistan']").click
    # 16 | click | id=countries | 
    @driver.find_element(:id, 'countries').click
    # 17 | click | id=location | 
    @driver.find_element(:id, 'location').click
    # 18 | click | id=ui-id-2 | 
    @driver.find_element(:id, 'ui-id-2').click
    # 19 | type | id=location | Kabul, Afghanistan
    @driver.find_element(:id, 'location').send_keys('Kabul, Afghanistan')
    # 20 | click | css=.glyphicon | 
    @driver.find_element(:css, '.glyphicon').click
    # 21 | runScript | window.scrollTo(0,8.333333015441895) | 
    @driver.execute_script("window.scrollTo(0,8.333333015441895)")
    # 22 | runScript | window.scrollTo(0,133.3333282470703) | 
    @driver.execute_script("window.scrollTo(0,133.3333282470703)")
    # 23 | click | id=1 | 
    @driver.find_element(:id, '1').click
    # 24 | click | css=#no8 > .day-number | 
    @driver.find_element(:css, '#no8 > .day-number').click
    # 25 | click | id=day8-book0 | 
    @driver.find_element(:id, 'day8-book0').click
    # 26 | click | id=proceed | 
    @driver.find_element(:id, 'proceed').click
    # 27 | click | id=authorise | 
    @driver.find_element(:id, 'authorise').click
    # 28 | click | id=proceed | 
    @driver.find_element(:id, 'proceed').click
    # 29 | close |  | 
    @driver.close
  end
end

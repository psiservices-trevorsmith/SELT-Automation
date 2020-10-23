Feature: SELT Candidate Login

Background:
  * callonce read('web-setup.feature')
  * call login { username: 'gypsy@test.com', password: 'Fatfr@g99' }

Scenario: Choose to Book Activity C2
# Choose Activity
  Given waitForUrl(baseUrl + '/manage-account')
  When click('#book-new-test')
  And click('#proceed')
  And click("#activity-options")
  And select('select[name=externalActivityCode]', "{}UKVI Speaking, listening, reading, and writing at level C2")
  And click('#proceed')

# Search Centre
  And waitFor('select[name=countryCode]')
  When select('select[name=countryCode]', '{}Afghanistan')
  And input('#location', 'Kabul, Afghanistan')
  And click('#_eventId_search')
  And waitFor('{a}View availability')
  * scroll('{a:2}View availability') 
  * screenshot()

# Choose centre  
  And waitFor('{a}View availability')
  When click('{a}View availability')
  And waitFor('{^h1}When would you like to sit your test')
  * screenshot()

# Choose Slot
  And waitFor('{^h1}When would you like to sit your test')
## Find all other centre day/slots displayed 
  * def otherdays = locateAll('.othercentre')
  * print 'Slots: ', otherdays
## Choose first day with other centre slot  
  And otherdays.get(0).click()
  * scroll('{^a:1}Book Test')  
  * screenshot()
## Choose first time slot
  And submit().click('{^a:1}Book Test')
  
# Confirm Booking
  * scroll('{button}Confirm and pay')  
  And submit().click('{button}Confirm and pay')

# Pay for Booking
  And waitFor('a[id=authorise]').click()
  And waitFor('{^}Please wait while we process your payment')
  And retry(3, 10000).exists('{h1}Thank you')
  * screenshot()
  
# Open Account View
  Given click('{a}My account')
## Refresh current bookings
  And waitForUrl('http://localhost:8086/manage-account')
  * delay(3000).screenshot()
  * reload()

# Cancel Booking
  When click('{^a}Confirmed bookings')
  * scroll('div[id=footer]')  
  * screenshot()  
  * def booking = locate('{^}UKVI Speaking, listening, reading, and writing at level C2')
  Then assert booking.present
## Cancel first booking
  And click('a[id=confirmed-1-okbutton]')
  And waitFor('{^h1}Your booking')
  * screenshot() 
  Then click('#confirmCancel')
  And waitFor('{^h1}Cancel your booking')
  * screenshot()  
  Then submit().click('input[id=cancel]')
## Verify booking cancelled
  And waitForUrl('http://localhost:8086/manage-account')
  When click('{^a}Confirmed bookings')
  * scroll('div[id=confirmed]')  
  * screenshot()  
  Then assert !exists('{^}C2')

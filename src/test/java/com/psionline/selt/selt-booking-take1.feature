Feature: SELT Candidate Login

Background:
  * configure driver = { type: 'chrome', showDriverLog: true }

Scenario: Condidate login to SELT

  Given driver 'http://localhost:8086/login'
  And input('#username', 'gypsy@test.com')
  And input('#password', 'Fatfr@g99')
  When submit().click("input[name=login]")
  Then waitForUrl('http://localhost:8086/manage-account')

#Scenario: Choose to Book Activity A1

#  Given driver 'http://localhost:8086/manage-account'
  And click('#book-new-test')
  And click('#proceed')
  When click("#activity-options")
#  Then select('select[name=externalActivityCode]', "//option[. = 'UKVI Speaking and listening at level A2']")
  Then select('select[name=externalActivityCode]', "{}UKVI Speaking, listening, reading, and writing at level C2")
  And click('#proceed')
#  Then waitForUrl('http://localhost:8086/booking?execution=e1s4')
#  And select('#countries', "//option[. = 'Afghanistan']")
  And select('select[name=countryCode]', '{}Afghanistan')
  And input('#location', 'Kabul, Afghanistan')
  And click('#_eventId_search')
  And waitFor('{a}View availability')
  * scroll('{a:2}View availability') 
  * screenshot()   
  And click('{a}View availability')
  And waitFor('{^h1}When would you like to sit your test')
  * screenshot()   
  # Day No.
  # And click('a[class=othercentre]')
#  * def elements = locateAll('.othercentre')
  * def elements = locateAll('.othercentre')
  * print 'Slots: ', elements
  * elements.get(0).click()
#  And click('a[id=no3]')
  #And click('.othercentre:first-of-type')
  # 1st slot day 8
  #And click('#day8-book0')
  * scroll('{^a:1}Book Test')  
  * screenshot()   
  And submit().click('{^a:1}Book Test')
  #And click('{^a:2}Book Test')
  * scroll('{button}Confirm and pay')  
  And submit().click('{button}Confirm and pay')
  #Then waitFor('http://localhost:8580/pay')
  #/PSIServicesUK1/73?x_gateway_id=R47568-05&x_fp_sequence=34366&x_show_form=PAYMENT_FORM&x_fp_hash=f21d213af0017fbbd91c660d9a1c7ad8&x_invoice_num=73&x_amount=1802.0&x_currency_code=CNY&x_po_num=290687fa-8add-4a85-897e-bb40e031ad5d&x_login=WSP-PSI-D-KXQ%2526RwB%40PQ&payRootUrl=http%3A%2F%2Flocalhost%3A8380&x_fp_timestamp=1603117281&rootUrl=http%3A%2F%2Flocalhost%3A8086
#  And click('a[id=authorise]')
  And waitFor('a[id=authorise]').click()
  And waitFor('{^}Please wait while we process your payment')
  And retry(3, 10000).exists('{h1}Thank you')
  * screenshot()
#  * retry()
 
 #Scenario: Cancel Activity
#  * timeout(15 * 1000)
#  * timeout()
  Given click('{a}My account')
#  Given driver 'http://localhost:8086/manage-account'
#  * refresh()
  And waitForUrl('http://localhost:8086/manage-account')
  * delay(3000).screenshot()
  * reload()
  When click('{^a}Confirmed bookings')
  * scroll('div[id=footer]')  
  * screenshot()  
#  * refresh()
#  * scroll('div[id=confirmed]')  
#  * screenshot()  
  * def element = locate('{^}UKVI Speaking, listening, reading, and writing at level C2')
  * assert element.present
#  * element.click()
#  * assert exists('{^}C2')
#  * karate.stop(9000)
#  * rightOf('{^}C2').find('{^a}View test').click()
#  Then click('{^a}View test')
  Then click('a[id=confirmed-1-okbutton]')
#  And retry(2, 10000).exists('{^h1}Your booking')
  And waitFor('{^h1}Your booking')
  * screenshot() 
#  * karate.stop(9000) 
#  * scroll('a[id=confirmCancel]')  
#  * scroll('div[id=confirm-and-pay]')  
#  Then click('{^a}Cancel test')
  Then click('#confirmCancel')
  And waitFor('{^h1}Cancel your booking')
#  And retry(2, 10000).exists('{^h1}Cancel your booking')
  * screenshot()  
  Then submit().click('input[id=cancel]')
#  Then submit().click('{input}Cancel booking')
#  And retry(2, 10000).exists('{^h2}Manage your bookings')
#  And waitFor('{^h2}Manage your bookings')
  And waitForUrl('http://localhost:8086/manage-account')
  When click('{^a}Confirmed bookings')
#  * refresh()
  * scroll('div[id=confirmed]')  
  * screenshot()  
  * assert !exists('{^}C2')
#  * karate.stop(9000)
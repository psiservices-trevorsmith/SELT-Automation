Feature: SELT Candidate Login

Background:
  * callonce read('web-setup.feature')
  * call login { username: 'gypsy@test.com', password: 'Fatfr@g99' }

Scenario: Choose to Book Activity C2
# Commence Booking
  Given waitForUrl(baseUrl + accountView.path)
  When click(accountView.bookTestButton)
# No Special requirements
  And click(specialRequirements.proceed)
  
# Choose an Activity
  When click(activityChoice.dropdown)
  And select(activityChoice.option, "{}UKVI Speaking, listening, reading, and writing at level C2")
  And click(activityChoice.proceed)
  
# Search for a Centre
  Given waitFor(centreSearch.countryDropdown)
  When select(centreSearch.countryOption, '{}Afghanistan')
  And input(centreSearch.locationEntry, 'Kabul, Afghanistan')
  And click(centreSearch.searchButton)
  And waitFor(centreSearch.firstAvailableCentre)
  * scroll(centreSearch.secondAvailableCentre) 
  * screenshot()

# Choose a centre  
  When click(centreSearch.firstAvailableCentre)
  
# Choose Slot
  Given waitFor(slotAvailability.title)
  * screenshot()
## Find all other centre day/slots displayed 
  * def secondaryDays = locateAll(slotAvailability.secondaryCentreSlots)
  * print 'Slots: ', secondaryDays
## Choose first day with other centre slot  
  When secondaryDays.get(0).click()
  * scroll(slotAvailability.firstTimeSlot)  
  * screenshot()
## Choose first time slot
  And submit().click(slotAvailability.firstTimeSlot)

# Confirm Booking
  Given waitFor(bookingConfirmation.confirmAndPayButton)
  * scroll(bookingConfirmation.confirmAndPayButton)  
  When submit().click(bookingConfirmation.confirmAndPayButton)
  
# Pay for Booking
  When waitFor(payProviderStub.authorise).click()
  And waitFor(paymentProcessing.waiting)
  And retry(3, 10000).exists(paymentProcessing.thankYou)
  * screenshot()

#
# View Booking
#

# Open Account View
  Given click(header.myAccount)
  And waitForUrl(baseUrl + accountView.path)
## Refresh current bookings
  * delay(3000).screenshot()
  * reload()

# Select the confirmed Booking
  When click(accountView.confirmedTab)
  * scroll(footer.section)  
  * screenshot()  
  * def booking = locate('{^}UKVI Speaking, listening, reading, and writing at level C2')
  Then assert booking.present
## Choose first booking
  And click(accountView.firstConfirmedBooking)

#
# Cancel Booking
#

# View Booking  
  Given waitFor(bookingView.title)
  * screenshot() 
  When click(bookingView.cancelButton)

# Cancel Confirmation
  Given waitFor(bookingCancellation.title)
  * screenshot()  
  When submit().click(bookingCancellation.confirmButton)

# Verify booking cancelled
  Given waitForUrl(baseUrl + accountView.path)
  When click(accountView.confirmedTab)
  * scroll(accountView.confirmedList)  
  * screenshot()  
  Then assert !exists('{^}C2')
  
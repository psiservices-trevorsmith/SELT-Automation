package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static com.psionline.selt.steps.support.BrowserContext.chrome;

import cucumber.api.java.en.Given;

public class ManageBookingsSteps {
    protected WebDriver browser = chrome.driver;

    @Given("^I click book new test$")
    public void i_click_book_new_test() throws Throwable {
        browser.findElement(By.id("book-new-test")).click();
    }

}

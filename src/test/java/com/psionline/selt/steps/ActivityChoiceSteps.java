package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.Select;

import static com.psionline.selt.steps.support.BrowserContext.chrome;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

public class ActivityChoiceSteps {
    private WebDriver browser = chrome.driver;

    @And("^I choose activity '(.*)'$")
    public void i_choose_activity(String activity) throws Throwable {
        browser.findElement(By.id("activity-options")).click();
        {
            Select dropdown = new Select(browser.findElement(By.id("activity-options")));
            dropdown.selectByVisibleText(activity);
        }
        browser.findElement(By.id("proceed")).click();
    }

    @Given("^I have chosen activity '(.*)'$")
    public void chosenActivity(String activity) throws Throwable {
        new ManageBookingsSteps().i_click_book_new_test();
        new SpecialRequirementsSteps().i_proceed_with_no_special_requirements();
        i_choose_activity(activity);
    }

}

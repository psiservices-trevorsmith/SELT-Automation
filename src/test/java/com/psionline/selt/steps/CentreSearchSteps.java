package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static com.psionline.selt.steps.support.BrowserContext.chrome;
import static org.junit.jupiter.api.Assertions.assertEquals;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class CentreSearchSteps {
    private WebDriver browser = chrome.driver;

    @And("^I choose to search in country '(.*)'$")
    public void i_choose_to_search_in_country(String country) throws Throwable {
        browser.findElement(By.id("countries")).click();
        {
            WebElement dropdown = browser.findElement(By.id("countries"));
            dropdown.findElement(By.xpath("//option[. = '" + country + "']")).click();
        }
    }

    @And("^I enter location search for '(.*)'$")
    public void i_enter_location_search_for(String location) throws Throwable {
        browser.findElement(By.id("location")).click();
        browser.findElement(By.id("location")).sendKeys(location);
    }

    @And("^I click search$")
    public void i_click_search() throws Throwable {
        browser.findElement(By.id("_eventId_search")).click();
    }

    @Then("^I am presented with (\\d+) test centres$")
    public void i_am_presented_with_test_centres(int centres) throws Throwable {
        assertEquals(browser.findElements(By.className("psi-centre-details")).size(), centres);
    }
}

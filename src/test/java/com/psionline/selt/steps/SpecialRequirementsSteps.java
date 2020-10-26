package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static com.psionline.selt.steps.support.BrowserContext.chrome;

import cucumber.api.java.en.And;

public class SpecialRequirementsSteps {
    private WebDriver browser = chrome.driver;

    @And("^I proceed with no special requirements$")
    public void i_proceed_with_no_special_requirements() throws Throwable {
        browser.findElement(By.id("proceed")).click();
    }

}

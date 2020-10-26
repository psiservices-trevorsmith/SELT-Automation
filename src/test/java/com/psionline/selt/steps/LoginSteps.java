package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import static com.psionline.selt.steps.support.BrowserContext.chrome;
import static org.junit.Assert.assertEquals;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class LoginSteps {
    private WebDriver browser = chrome.driver;
    private JavascriptExecutor js = chrome.js;

    @Given("I have a registered candidate username '(.*)'")
    public void aRegisteredAccount(String user) {
        // DB stuff? jdbcTemplate.batchUpdate ..
        // org.springframework.jdbc.datasource.init.ScriptUtils
        // iBatis scriptRunner: https://www.tutorialspoint.com/how-to-run-sql-script-using-jdbc
    }

    @Given("my browser is open at URL '(.*)'")
    public void openBrowserAtUrl(String url) {
        browser.get(url);
        browser.manage().window().setSize(new Dimension(1296, 696));
    }

    @And("I enter username '(.*)'")
    public void enterUsername(String user) {
        js.executeScript("window.scrollTo(0,250)");
        browser.findElement(By.id("username")).sendKeys(user);
    }

    @And("I enter password '(.*)'")
    public void password(String pass) {
        browser.findElement(By.id("password")).sendKeys(pass);
    }

    @And("I click the login button")
    public void clickLogin() {
        browser.findElement(By.name("login")).click();
    }

    @Then("my browser navigates to URL '(.*)'")
    public void browserNavigatesTo(String url) {
        assertEquals(url, browser.getCurrentUrl());
        // http://localhost:8086/booking?execution=e1s2
        // h1 Choose a centre
    }

    @Given("I have logged in to SELT with username '(.*)'")
    public void loggedInWithUsername(String username) {
        openBrowserAtUrl("http://localhost:8086/login");
        enterUsername(username);
        password("Fatfr@g99");
        clickLogin();
        browserNavigatesTo("http://localhost:8086/manage-account");
    }

}

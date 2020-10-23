package com.psionline.selt.steps;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class LoginStep {
    private WebDriver driver;
    private Map<String, Object> vars;
    JavascriptExecutor js;

    @Before
    public void doSomethingBefore() {
        System.setProperty("webdriver.chrome.driver", "./drivers/win32/chromedriver.exe");
        System.setProperty("webdriver.chrome.logfile", "./chromedriver.log");
        System.setProperty("webdriver.chrome.verboseLogging", "true");
        driver = new ChromeDriver();
        js = (JavascriptExecutor) driver;
        vars = new HashMap<String, Object>();
    }

    @After
    public void doSomethingAfter(Scenario scenario) {
        driver.quit();
    }

    @Given("I have a registered candidate username '(.*)'")
    public void aRegisteredAccount(String user) {
        // DB stuff? jdbcTemplate.batchUpdate ..
        // org.springframework.jdbc.datasource.init.ScriptUtils
        // iBatis scriptRunner: https://www.tutorialspoint.com/how-to-run-sql-script-using-jdbc
    }

    @Given("my browser is open at URL '(.*)'")
    public void openBrowserAtUrl(String url) {
        driver.get(url);
        driver.manage().window().setSize(new Dimension(1296, 696));
    }

    @And("I enter username '(.*)'")
    public void enterUsername(String user) {
        js.executeScript("window.scrollTo(0,250)");
        driver.findElement(By.id("username")).sendKeys(user);
    }

    @And("I enter password '(.*)'")
    public void password(String pass) {
        driver.findElement(By.id("password")).sendKeys(pass);
    }

    @And("I click the login button")
    public void clickLogin() {
        driver.findElement(By.name("login")).click();
    }

    @Then("my browser navigates to URL '(.*)'")
    public void the_browser_navigates_to(String url) {
        assertEquals(url, driver.getCurrentUrl());
    }
}

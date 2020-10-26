package com.psionline.selt.steps.support;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import java.util.Map;

import static com.psionline.selt.steps.support.BrowserContext.chrome;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;

public class BrowserStepsSupport {
    protected WebDriver driver;
    protected Map<String, Object> vars;
    protected JavascriptExecutor js;

    @Before
    public void doSomethingBefore() {
        driver = chrome.driver;
        js = chrome.js;
    }

    @After
    public void logout(Scenario scenario) {
        driver.findElement(By.id("logout")).click();
    }

    public void closeBrowser(Scenario scenario) {
//        driver.quit();
    }

}

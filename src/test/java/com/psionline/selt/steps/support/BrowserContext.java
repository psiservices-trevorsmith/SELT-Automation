package com.psionline.selt.steps.support;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.HashMap;
import java.util.Map;

public enum BrowserContext {

    chrome;

    public WebDriver driver;
    public Map<String, Object> vars;
    public JavascriptExecutor js;

    BrowserContext() {
        System.setProperty("webdriver.chrome.driver", "./drivers/win32/chromedriver.exe");
        System.setProperty("webdriver.chrome.logfile", "./chromedriver.log");
        System.setProperty("webdriver.chrome.verboseLogging", "true");
        driver = new ChromeDriver();
        js = (JavascriptExecutor) driver;
        vars = new HashMap<String, Object>();
    }

    public void close() {
        driver.quit();
    }

}

package com.psionline.selt.cuke;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(format = { "html:target/cucumber-html-report",
        "json:target/cucumber-json-report.json" }, features = "src/test/resources/features", glue = {
                "classpath:com/psionline/selt/steps" }, tags = { "~@ignore" })
public class RunCukesTest {

}

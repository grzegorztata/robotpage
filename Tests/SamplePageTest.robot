*** Settings ***
Library     SeleniumLibrary
Resource    ../Pages/Common.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/SamplePage.robot

Test Setup      Common.StartTestCase
Test Teardown   Common.FinishTestCase

*** Test Cases ***
Display Sample Page
    [Tags]  Retest
    HomePage.OpenSamplePage
    SamplePage.OpenWordPress


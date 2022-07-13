*** Settings ***
Library     SeleniumLibrary
Variables   ../Objects/SamplePage.py

*** Keywords ***
OpenWordPress
    click element   ${dashboardLink}
    wait until element is visible   ${login}
    title should be   Zaloguj się     Correct Title Page was not displayed
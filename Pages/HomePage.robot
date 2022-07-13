*** Settings ***
Library     SeleniumLibrary
Variables   ../Objects/HomePage.py

*** Keywords ***
OpenSamplePage
    click element   ${sampleLink}
    wait until element is visible     ${sampleHeader}     15s     Sample Page was not displayed

OpenShopPage
    click element   ${shopLink}
    wait until element is visible     ${shopHeader}   15s     Sklep Page was not displayed

OpenAccountPage
    click element   ${accountLink}
    wait until element is visible     ${accountHeader}   15s     My Account Page was not displayed
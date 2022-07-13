*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}      https://i.pl/
${browser}  chrome

*** Keywords ***
StartTestCase
    open browser    ${url}  ${browser}
#    Set Window Size    1400    1200
    maximize browser window
    wait until element contains     xpath://main//h1   Homepage    15s     Homepage header was not displayed

FinishTestCase
    close browser
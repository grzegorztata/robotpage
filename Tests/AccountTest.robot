*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../Pages/Common.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/AccountPage.robot

Test Setup      Common.StartTestCase
Test Teardown   Common.FinishTestCase

*** Test Cases ***
LoginAsCorrectUser
    [Tags]   Retest
    HomePage.OpenAccountPage
    AccountPage.UserLogin    gtata  'correct'
    AccountPage.UserLogout

LoginAsIncorrectUser
    [Tags]   Retest
    HomePage.OpenAccountPage
    AccountPage.UserLogin    gtata  'wrong'

AddingNewBillingAddress
    [Tags]  Retest
    ${nameGen} =     Generate Random String  5   [LETTERS]
    ${phonrNo} =     Generate Random String  9   [NUMBERS]
    HomePage.OpenAccountPage
    AccountPage.UserLogin    gtata  'correct'
    AccountPage.FillingBillingAddressForm   ${nameGen}  ${phonrNo}




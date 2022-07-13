*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../Pages/Common.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/ShopPage.robot

Test Setup      Common.StartTestCase
Test Teardown   Common.FinishTestCase

*** Test Cases ***
VerifyItemsOnThePage
    [Tags]   New
    HomePage.OpenShopPage
    ShopPage.VerifyItemsAmount
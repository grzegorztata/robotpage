*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../Pages/Common.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/AccountPage.robot
Resource    ../Pages/ShopPage.robot
Resource    ../Pages/BasketPage.robot
Resource    ../Pages/OrdersPage.robot

Test Setup      Common.StartTestCase
Test Teardown   Common.FinishTestCase

*** Variables ***
${orderNr}      //li[contains(text(),'Numer zamówienia')]//strong

*** Test Cases ***
OrderWithLoggedUser
    [Tags]   Retest
    HomePage.OpenAccountPage
    AccountPage.UserLogin    gtata  'correct'
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    'allItems'
    BasketPage.GoToPayment
    OrdersPage.FinalizeOrder
    ${order} =  get text    ${orderNr}
    HomePage.OpenAccountPage
    AccountPage.DisplayOrder    ${order}
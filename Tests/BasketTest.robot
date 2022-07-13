*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../Pages/Common.robot
Resource    ../Pages/HomePage.robot
Resource    ../Pages/ShopPage.robot
Resource    ../Pages/BasketPage.robot

Test Setup      Common.StartTestCase
Test Teardown   Common.FinishTestCase

*** Test Cases ***
AddAndRemoveItemFromBasket
    [Tags]   Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.RemoveAndRestoreItem

ChangingAmountOfItemsAndRecalculate
    [Tags]   Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.ChangeQuantity       'positive'

ChangingAmountIntoZeroAndRecalculate
    [Tags]   Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.ChangeQuantity       'zero'

GenerateAmountOfItemsAndRecalculateInRange
    ${genNum} =     Evaluate    random.sample(range(2, 15), 1)     random
    [Tags]  Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.GenerateQuantity     ${genNum}


GenerateAmountOfItemsAndRecalculate
    ${genNum} =     Generate Random String  2   123456789
    [Tags]  Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.GenerateQuantity     ${genNum}

AddCorrectDiscountCodeAndRemove
    [Tags]   Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.AddDiscountCode      'correct'

AddIncorrectDiscountCode
    [Tags]   Retest
    HomePage.OpenShopPage
    ShopPage.CreateTestingBasket    ''
    BasketPage.AddDiscountCode      'incorrect'

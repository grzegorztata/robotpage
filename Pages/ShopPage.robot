*** Settings ***
Library     SeleniumLibrary
Variables   ../Objects/ShopPage.py

*** Keywords ***
AddFirstProductToBasket
    click element   ${firstItem}
    wait until element is visible   ${checkFirstBasket}     15s     Basket link was not displayed after adding first item

AddSecondProductToBasket
    click element   ${secondItem}
    wait until element is visible   ${checkSecondBasket}     15s     Basket link was not displayed after adding second item

AddThirdProductToBasket
    click element   ${thirdItem}
    wait until element is visible   ${checkThirdBasket}     15s     Basket link was not displayed after adding third item

CreateTestingBasket
    [Arguments]     ${steps}
    AddFirstProductToBasket
    IF  ${steps} == 'allItems'
        AddSecondProductToBasket
        AddThirdProductToBasket
    END
    click element   ${checkFirstBasket}
    wait until element is visible   ${basketHeader}     15s     Basket Page was not opened

VerifyItemsAmount
    ${items_on_page}=   get element count   ${shopItems}
    Run Keyword IF  ${items_on_page} == 4   CorrectAmount
    ...     ELSE IF  ${items_on_page} > 4   ExtraAmount
    ...     ELSE    IncorrectAmount

CorrectAmount
    log to console  Correct amount of items on the page
ExtraAmount
    log to console  Extra item was added to the shop
    capture page screenshot     previewPage.png
IncorrectAmount
    log to console  Incorrext amount of items on the page
    fatal error
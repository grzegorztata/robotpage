*** Settings ***
Library  SeleniumLibrary
Variables   ../Objects/BasketPage.py
Variables   ../Objects/ShopPage.py
Variables   ../Objects/HomePage.py

*** Keywords ***
RemoveItemUsingIcon
    click element   ${removeIcon}
    wait until element is visible   ${emptyBasket}  15s     Info about empty basket was not displayed

RestoreItem
    click element   ${restoreItem}
    wait until element is visible     ${basketHeader}  15s     Basket Page was not opened after Restoring Item
    wait until element contains     ${firstItemName}  Test Product  15s     Incorrect Item was restored

ChangeQuantity
    [Arguments]  ${qty}
    clear element text  ${itemQuantity}
    IF  ${qty} == 'positive'
        input text  ${itemQuantity}     5
    ELSE IF  ${qty} == 'zero'
        input text  ${itemQuantity}     0
    END
    click button    ${updateCart}
    IF  ${qty} == 'positive'
        wait until element contains     ${totalValue}   $50.00   15s     Basket shows wrong total amount after recalculating
    ELSE IF  ${qty} == 'zero'
        wait until element contains     ${emptyBasket}  Twój koszyk aktualnie jest pusty.  15s    Basket was no cleaned after changing QTY into zero
    END

GenerateQuantity
    [Arguments]  ${genNum}
    ${price} =  Convert To string   ${genNum}
    ${total} =  Remove String   ${price}    [   ]
    clear element text  ${itemQuantity}
    input text  ${itemQuantity}     ${genNum}
    click button    ${updateCart}
    ${what}=    get text    ${totalValue}
    wait until element contains     ${totalValue}   $${total}0.00   10s     Expected ${what}, there is $${total}0.00

AddDiscountCode
    [Arguments]  ${code}
    IF  ${code} == 'correct'
        input text  ${codeInput}    gtata_kod
    ELSE IF  ${code} == 'incorrect'
        input text  ${codeInput}    something
    END
    click element    ${codeApplyBtn}
    IF  ${code} == 'correct'
        wait until element contains  ${totalValue}    $5.00   15s     Basket was not updated after adding discount code
    ELSE IF  ${code} == 'incorrect'
        wait until element contains  ${errorWrap}    Kupon "something" nie istnieje!    15s     Application did not display message after adding incorrect code
    END

RemoveDiscountCode
    click element   ${removeCode}
    wait until element is not visible   ${removeCode}   15s     Discount code was not removed
    element should contain  ${totalValue}   $10.00

RemoveAndRestoreItem
    RemoveItemUsingIcon
    RestoreItem

GoToPayment
    click element   ${paymentBtn}
    wait until element is visible   ${orderHeader}  15s     Order Page is not displayed

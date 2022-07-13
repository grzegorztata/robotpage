*** Settings ***
Library     SeleniumLibrary
Variables   ../Objects/OrdersPage.py

*** Keywords ***
FinalizeOrder
    wait until element is not visible   ${blockPage}
    wait until element is enabled   ${purchaseBtn}
    click element   ${purchaseBtn}
    wait until element contains  ${orderSuccess}    Dziękujemy.     15s     Order was not sussesfully finalized
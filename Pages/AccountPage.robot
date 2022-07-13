*** Settings ***
Library     SeleniumLibrary
Variables   ../Objects/AccountPage.py

*** Keywords ***
UserLogin
    [Arguments]  ${user}    ${creds}
    input text  ${username}     ${user}
    IF  ${creds} == 'correct'
        input text  ${password}     correctpass
    ELSE IF  ${creds} == 'wrong'
        input text  ${password}     incorrect
    END
    click element   ${loginBtn}
    IF  ${creds} == 'correct'
        wait until element contains     ${accountContent}   Witaj ${user}     15s   User ${user} was not logged correctly
    ELSE IF  ${creds} == 'wrong'
        wait until element contains     ${loginError}   Incorrect username or password  15s
    END


UserLogout
    click element   ${logoutBtn}
    wait until element is visible   ${username}    15s     User was not logged out from the application

DisplayUsersAddresses
    click element   ${addressPage}
    wait until element contains   ${accountContent}    Następujące adresy   15s     Addresses Page is not displayed

AddNewBillingAddress
    ${exAddress} =  get text    ${existingAddress}
    IF  '${exAddress}' == 'Dodaj'
        click element   ${newBillindAddress}
        wait until element is not visible   ${newBillindAddress}    15s     New Billing Address form is not displayed
    ELSE IF  '${exAddress}' == 'Edytuj'
         click element   ${editBillindAddress}
    END

FillingBillingAddressForm
    [Arguments]  ${nameGen}  ${phonrNo}
    DisplayUsersAddresses
    AddNewBillingAddress
    input text  ${firstName}    ${nameGen}_name
    input text  ${surname}    ${nameGen}_surname
    input text  ${company}    ${nameGen}_company
    select from list by value   billing_country     PL
    input text  ${street}    Przedmiejska 10
    input text  ${postcode}    53-015
    input text  ${city}     Wrocław
    input text  ${phone}    ${phonrNo}
    click button    ${saveBtn}
    wait until element contains     ${addAddressMsg}    Adres został    15s     Address was not changed or added
    element should contain  ${addressDetails}   ${nameGen}_company

DisplayOrder
    [Arguments]  ${order}
    click element   ${ordersNav}
    wait until element is visible   xpath://a[contains(text(),'#${order}')]
    click element   xpath://a[contains(text(),'#${order}')]
    wait until element contains  ${accountContent}  Zamówienie nr ${order}  15s  Incorrect order was displayed

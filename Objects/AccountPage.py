# My Account Locators
username = "id:username"
password = "id:password"
loginBtn = "name:login"
accountContent = "xpath://div[@class='woocommerce-MyAccount-content']//p"
addAddressMsg = "class:woocommerce-message"
loginError = "xpath://ul[@class='woocommerce-error']//li"
logoutBtn = "xpath://a[contains(text(),'Wyloguj się')]"
saveBtn = "name:save_address"

addressPage = "xpath://a[contains(text(),'Adresy')]"
ordersNav = "xpath://a[contains(text(),'Zamówienia')]"
newBillindAddress = "xpath://h3[contains(text(),'Adres rozliczeniowy')]//following::a[contains(text(),'Dodaj')]"
editBillindAddress = "xpath://h3[contains(text(),'Adres rozliczeniowy')]//following::a[contains(text(),'Edytuj')]"
existingAddress = "xpath://h3[contains(text(),'Adres rozliczeniowy')]//following::a"

firstName = "id:billing_first_name"
surname = "id:billing_last_name"
company = "id:billing_company"
country = "id:select2-billing_country-container"
chosenCountry = "xpath://option[contains(text(),'Polska')]"
street = "id:billing_address_1"
postcode = "id:billing_postcode"
city = "id:billing_city"
phone = "id:billing_phone"
addressDetails = "xpath://address"

# Shop Page Locators
basketHeader = "xpath://h1[contains(text(),'Koszyk')]"

firstItem = "xpath://h2[contains(text(),'Test Product')]//following::a[contains(text(),'Dodaj do koszyka')]"
secondItem = "xpath://h2[contains(text(),'Test Product 2')]//following::a[contains(text(),'Dodaj do koszyka')]"
thirdItem = "xpath://h2[contains(text(),'Test Product 3')]//following::a[contains(text(),'Dodaj do koszyka')]"

checkFirstBasket = "//h2[contains(text(),'Test Product')]//following::a[contains(text(),'Zobacz koszyk')]"
checksecondBasket = "//h2[contains(text(),'Test Product 2')]//following::a[contains(text(),'Zobacz koszyk')]"
checkThirdBasket = "//h2[contains(text(),'Test Product 3')]//following::a[contains(text(),'Zobacz koszyk')]"

shopItems = "class:add_to_cart_button"

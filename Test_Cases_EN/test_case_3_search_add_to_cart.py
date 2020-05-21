I.Test Case 3 - Search product and add to cart

ID: 003

Title: Search product on the page using filters and add product to cart

Environment: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Precondition: Open browser. The user is not logged.

Suite Setup  Open the web page „https://centrumamis.pl/pl” of the shop
Suite Teardown    Close All Browsers

Test Case 3:

   Scenario 1. Search product in the web store using filter
    [Tags]   Test3   Critical   Ready   Scenario 1
    
    Input keyword in search field
    Use filter for search product by category
    Use filter for search product by producent
    Use filter for search product by price
    The number of products by used keyword

Scenario 2. Add first product to cart and equal alert message with expected.
    [Tags]  Test3   Critical   Ready   Scenario 2
    
    Select first found product
    Add first found product in cart
    Equal alert message appeared after adding the product in cart with expected

Scenario 3. Assertion of the category, producent names and price for product in cart
    [Tags]   Test3   Critical   Ready   Scenario 3
    
    Get product name in cart and equal category, producent names and price
    Equal price of the product in cart with expected according to filter


STEPS WITH DETAILS:
 Scenario1: Search product in the web store using filter

1. Input keyword in serach field
2. Using filter for search product select category "Kontrola wagi"
3. Using filter for search product select producent "Colfarm"
4. Using filter for search product input lower price "20"
5. Using filter for search product input higher price "50"
6. Log to console numbers of found products with name and price. 

Result:

Filter lets select category, producent names and price and found products.

Expected result(behaviour):

Filter lets select category, producent names and price and found products.

Summary:
In this scenario test passed. It means that filter lets select product using it and found products.

Additional information:

In scenario 3 was confirmed that filter works correctly and assertion for category, producent names and selection lower/higher price work correctly. 

STEPS WITH DETAILS:
 Scenario 2. Add first product to cart and equal alert message with expected.

1. Select first found product
2. Click "ADD TO CART" button
3. Appears the alert message with information that product added to cart
4. Check that page contains correct alert message

Result:

This test confirms that after add product to cart appears appropriate alert message "Produkt dodany do koszyka."

Expected result(behaviour):

Appearing the alert message with information that product add to cart.

Summary:

Function adding to cart works correctly. Page appears appropriate alert message.

STEPS WITH DETAILS:
 Scenario 3. Assertion of the category, producent names and price for product in cart

1. Check product name in cart and equal category, producent names and price
2. Equal price of the product in cart with expected according to filter

Result:

In this sceanrio used assertion for confirmation that filter for category, producent names and lower/higher price work correctly. Assertion has no mistakes.


Expected result(behaviour):

Confirm that filter for category, producent names and lower/higher price work correctly.

Summary:

 The filter for category, producent names and lower/higher price work correctly. 





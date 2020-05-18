*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String

Documentation  This is a test suite to test search products on the page using semantic keywords.

Resource   ../resources/resource.robot

Metadata   Robot Framework version 3.1.2
Metadata   Author  Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers


*** Variables ***


*** Test Cases ***
Scenario 1. Search product in the web shop using filter
    [Tags]   Test3   Critical   Ready   Scenario 1

    Input keyword in serach field
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

*** Keywords ***

Equal alert message appeared after adding the product in cart with expected
     Page Should Contain  ${ALERT MESSAGE THAT PRODUCT ADDED TO CART}   loglevel=Alert about adding the product to cart not appeared.
     Log To Console   Alert message about adding the product to cart appeared correctly.
     Log To Console   Alert message is:
     Log To Console   ${ALERT MESSAGE THAT PRODUCT ADDED TO CART}

Get product name in cart and equal category, producent names and price
     ${PRODUCT NAME IN CART}=  Get Element Attribute  xpath=//*[@id="prodimg26125"]    attribute=data-gallery-list
     Sleep   10s
     Log To Console   Product name added to cart is: ${PRODUCT NAME IN CART}
     Should Be Equal   ${PRODUCT NAME IN CART}    ${EXPECTED PRODUCT NAME}
     Page Should Contain    ${CATEGORY NAME}
     Page Should Contain    ${PRODUCENT NAME}
     Log To Console   Assertion of the category, producent names is correct.

Equal price of the product in cart with expected according to filter
     Page Should Contain    ${PRODUCT PRICE IN CART}
     Should Be True  ${INPUT PRICE LOWER} <= ${PRODUCT PRICE IN CART}
     Should Be True  ${PRODUCT PRICE IN CART}  <= ${INPUT PRICE HIGHER}
     Log To Console   Assertion of the price is correct.

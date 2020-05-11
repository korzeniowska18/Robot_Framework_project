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
    [Tags]   critical   Ready

    Input keyword in serach field
    Use filter for search product by category
    Use filter for search product by producent
    Use filter for search product by price
    The number of products by used keyword

Scenario 2. Add first product to cart and equal alert message with expected.
    [Tags]  critical   Ready

    Select first found product
    Add first found product in card
    Equal alert message appeared after adding the product in cart with expected

Scenario 3. Assertion of the category, producent names and price for product in cart
    [Tags]   critical   Ready

    Get product name in cart and equal category, producent names and price
    Equal price of the product in cart with expected according to filter

*** Keywords ***

Input keyword in serach field
     Input Text   ${SEARCH FIELD SELECTOR}  ${FIRST KEYWORD}
     Sleep   3s
     Click Button   ${SUBMIT BUTTON}
     Sleep  3s

Use filter for search product by category
     Click Element   ${CATEGORY SELECTION}
     Sleep  6s
     Click Element   ${CATEGORY SELECTED}
     Sleep  3s

Use filter for search product by producent
     Click Element   ${PRODUCENT SELECTION}
     Sleep  3s
     Click Element   ${PRODUCENT SELECTED}
     Sleep  3s

Use filter for search product by price
     Click Element   ${PRICE SELECTION}
     Sleep   3s
     Input Text    ${PRICE LOWER}   ${INPUT PRICE LOWER}
     Sleep   2s
     Input Text    ${PRICE HIGHER}   ${INPUT PRICE HIGHER}
     Sleep   2s
     Click Button   ${FILTER BUTTON SUBMIT}
     Sleep   2s

The number of products by used keyword
     ${number products by used keyword} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${number products by used keyword} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[1]/div/a[2]    attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[2]/div/a[2]    attribute=title
     Log To Console   Used KEYWORD: ${FIRST KEYWORD}
     Log To Console   ${FOUND PRODUCTS}
     Log To Console  ${number products by used keyword}
     Log To Console  ${PRODUCT NAME1}
     Log To Console  ${PRODUCT NAME2}


Select first found product
     Click Element   ${FIRST SEARCHED PRODUCT}
     Sleep   3s

Add first found product in card
     Click Button    ${BUTTON ADD TO CART}

Equal alert message appeared after adding the product in cart with expected
     Page Should Contain  ${ALERT MESSAGE THAT PRODUCT ADDED TO CART}   loglevel=Alert about adding the product to cart not appeared.
     Should Be Equal ${ALERT MESSAGE THAT PRODUCT ADDED TO CART}   Produkt dodany do koszyka.
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

Equal price of the product in cart with expected according to filter
     Page Should Contain    ${PRODUCT PRICE IN CART}
     Should Be True  ${INPUT PRICE LOWER} <= ${PRODUCT PRICE IN CART}
     Should Be True  ${PRODUCT PRICE IN CART}  <= ${INPUT PRICE HIGHER}
     Log To Console   Assertion of the price is correct.

*** Settings ***
Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation
Resource   ../resources/resource.robot

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers


*** Variables ***

${INPUT WORD}    odchudzanie
${CATEGORY SELECTION}   xpath=//span[text()='Kategorie: (wybierz)']
${CATEGORY SELECTED}    partial link=Kontrola wagi
#${PRODUCENT SELECTION}    xpath=/html/body/div[1]/div[3]/div/div/div[2]/div[1]/div[2]/div[1]/span
${PRODUCENT SELECTION}    xpath=//span[text()='Producent: (wybierz)']
${PRODUCENT SELECTED}    partial link=Colfarm
${PRICE SELECTION}    xpath=//span[text()='Cena: (wybierz)']
${PRICE LOWER}           id=filterprice1
${INPUT PRICE LOWER}    20
${PRICE HIGHER}        id=filterprice2
${INPUT PRICE HIGHER}   50
${FILTER BUTTON SUBMIT}   id=filterprice
${FIRST SEARCHED PRODUCT}   xpath=//*[@id="box_mainproducts"]/div[2]/div/div[1]/div/a[2]/span
${BUTTON ADD TO CART}   xpath=//*[@id="box_productfull"]/div[2]/div/div/div[2]/div[2]/div[1]/form/fieldset[1]/div[2]/button
${ALERT MESSAGE}   Produkt dodany do koszyka.
${PRODUCT NAME SHOULD BE}    Be Slim fast 60 kaps.
${CATEGORY NAME}   Kontrola wagi
${PRODUCENT NAME}   Colfarm
${PRODUCT PRICE IN CART}   "33,81 zł"



*** Test Cases ***
Search product in the web shop
    Input keyword in serach field
    Use filter for search product by category
    Use filter for search product by producent
    Use filter for search product by price
    Select first found product
    Add first found product in card
    Equal alert message appeared after adding the product in cart with expected
    Get product name in cart and equal category and producent names
    Get price of the product in cart

*** Keywords ***


Input keyword in serach field
     Input Text   ${SEARCH FIELD SELECTOR}  ${INPUT WORD}
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

Select first found product
     Click Element   ${FIRST SEARCHED PRODUCT}
     Sleep   3s

Add first found product in card
     Click Button    ${BUTTON ADD TO CART}

Equal alert message appeared after adding the product in cart with expected
     #${ALERT MESSAGE}=  Get Element Attribute  xpath=//*[@id="shop_product10950"]/div[1]/div[3]/div  attribute=p
     Page Should Contain  ${ALERT MESSAGE}

Get product name in cart and equal category and producent names
     ${PRODUCT NAME IN CART}=  Get Element Attribute  xpath=//*[@id="prodimg26125"]    attribute=data-gallery-list
     Sleep   10s
     Log To Console   ${PRODUCT NAME IN CART}

     #Should Be Equal ${PRODUCT NAME IN CART}     ${PRODUCT NAME SHOULD BE}
     Page Should Contain    ${CATEGORY NAME}
     Page Should Contain    ${PRODUCENT NAME}
     #Page Should Contain    ${PRODUCT PRICE IN CART}



Get price of the product in cart
     #${PRODUCT PRICE IN CART}=  Get Element Attribute  xpath=/html/body/div[1]/div[4]/div/div/div[2]/div[3]/div[2]/div/div[1]/div/div[2]/em    attribute=textContent
     Log To Console   ${PRODUCT PRICE IN CART}

     #Should Be True  ${INPUT PRICE LOWER} <= ${PRODUCT PRICE IN CART}
     #<= ${INPUT PRICE HIGHER}
     #Page Should Contain Element   ${PRODUCT PRICE IN CART}

*** Settings ***

Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation



*** Variables ***

${BROWSER}      Chrome
${PAGE URL}    https://centrumamis.pl
${PAGE TITLE}    Sklep zielarski Centrum Amis

${REGISTRATION PAGE}   xpath=//span[text()='Zarejestruj się']
${REGISTRATION BUTTON}   xpath=//button[@class='btn btn-red right register']
${ALERT MESSAGE}   Formularz rejestracji zawiera błędy.
${CANCEL ALERT MESSAGE}   xpath=/html/body/div[1]/div[3]/div/button
${REGISTRATION PAGE INFORMATION}   Rejestracja
${INVALID REGISTRATION MESSAGE}   After registartion with empty data appeared alert:
${USER EMAIL FIELD SELECTOR}    id=input_mail
${USER PASSWORD FIELD SELECTOR}   id=input_pass1
${USER PASSWORD CONFIRMATION FIELD SELECTOR}   id=input_pass2


${CATEGORY SELECTION}   xpath=//span[text()='Kategorie: (wybierz)']
${CATEGORY SELECTED}    partial link=Kontrola wagi
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
${ALERT MESSAGE THAT PRODUCT ADDED TO CART}   Produkt dodany do koszyka.
${EXPECTED PRODUCT NAME}    Be Slim fast 60 kaps.
${CATEGORY NAME}   Kontrola wagi
${PRODUCENT NAME}   Colfarm
${PRODUCT PRICE IN CART}   33,81


${SEARCH FIELD SELECTOR}    class=search__input
${SUBMIT BUTTON}   css=.js__search-submit-btn
${SEARCH BUTTON}   css=.js__search-submit-btn
${FIRST KEYWORD}    odchudzanie
${SECOND KEYWORD NOMINATIVE}    waga
${SECOND KEYWORD GENITIVE}    wagi
${THIRD KEYWORD ENGLISH}    slim
${CHECK CATEGORY}     xpath=/html/body/div[1]/div[3]/div/div/div[1]/div[1]/div[2]/ul/li[11]/a
${FOUND PRODUCTS}  Znaleziono produktów:

${USER EMAIL FIELD SELECTOR}    id=input_mail
${USER PASSWORD FIELD SELECTOR}   id=input_pass1
${USER PASSWORD CONFIRMATION FIELD SELECTOR}   id=input_pass2
${INPUT WRONG EMAIL WITHOUT "@"}   A2.pl
${INPUT WRONG EMAIL}   ZB@zzzzzzzzzz.pl
${INPUT PASSWORD}   12345678
${INPUT CONFIRMATION PASSWORD}   12345678

${CHECKBOX BUTTON FOR REGULATIONS}   xpath=//div[contains(@class, 'input')]//span[2]//label
${RIGHT ALERT MESSAGE FOR WRONG EMAIL}   Formularz rejestracji zawiera błędy.
#${WRONG ALERT MESSAGE FOR WRONG EMAIL}   Dziękujemy za założenie konta.
${CANCEL ALERT MESSAGE}   xpath=/html/body/div[1]/div[3]/div/button

${WRONG ALERT}   Registration page has mistake in Alert message. Registration with wrong email should be impossible. In this case account with wrong email created and alert informed about successuful registration.
${CORRECT ALERT}  Registration page has correct Alert message. Registration with wrong email without "@" impossible.
${ERROR ABOUT EMAIL}   Nieprawidłowy format adresu e-mail
${INCOMPLETE ADITIONAL ALERT}   After invalid registartion with wrong email not informed taht the issue is with email, only about mistake during registartion.



*** Keywords ***
Open the web page of the shop
     Open Browser  ${PAGE URL}  ${BROWSER}
     Sleep  3s
     Maximize Browser Window
     Sleep  3s
     Title Should Be  ${PAGE TITLE}

Select Registration page
    Click Element  ${REGISTRATION PAGE}
    Sleep  3 s
    
Click Registration Button
    Click Button   ${REGISTRATION BUTTON}
    Sleep  3s
    
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

The number of products by first keyword
     ${number products by first keyword} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${number products by first keyword} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[1]/div/a[2]    attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[2]/div/a[2]    attribute=title
     ${PRODUCT NAME3}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[3]/div/a[2]    attribute=title
     ${PRODUCT NAME4}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[4]/div/a[2]    attribute=title
     Page Should Contain  ${FOUND PRODUCTS}
     Log To Console   First KEYWORD: ${FIRST KEYWORD}
     Log To Console   ${FOUND PRODUCTS}
     Log To Console  ${number products by first keyword}
     Log To Console  ${PRODUCT NAME1}
     Log To Console  ${PRODUCT NAME2}
     Log To Console  ${PRODUCT NAME3}
     Log To Console  ${PRODUCT NAME4}


The number of products by second keyword in nominative case
     ${number products by second keyword nominative} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${number products by second keyword nominative} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//div[contains(@class, 'product-inner-wrap')]//a  attribute=title
     Page Should Contain  ${FOUND PRODUCTS}
     Log To Console   Second KEYWORD in Nominative case: ${SECOND KEYWORD NOMINATIVE}
     Log To Console   ${FOUND PRODUCTS}
     Log To Console   ${number products by second keyword nominative}
     Log To Console   ${PRODUCT NAME1}

The number of products by second keyword in genitive case
     ${number products by second keyword genitive} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${number products by second keyword genitive} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10579')]//div//a  attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10392')]//div//a   attribute=title
     ${PRODUCT NAME3}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10950')]//div//a  attribute=title
     ${PRODUCT NAME4}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10904')]//div//a  attribute=title
     ${PRODUCT NAME5}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10393')]//div//a  attribute=title
     ${PRODUCT NAME6}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10431')]//div//a  attribute=title
     ${PRODUCT NAME7}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '20104')]//div//a  attribute=title
     Page Should Contain  ${FOUND PRODUCTS}
     Log To Console   Second KEYWORD in Genitive case: ${SECOND KEYWORD GENITIVE}
     Log To Console   ${FOUND PRODUCTS}
     Log To Console   ${number products by second keyword genitive}
     Log To Console   ${PRODUCT NAME1}
     Log To Console   ${PRODUCT NAME2}
     Log To Console   ${PRODUCT NAME3}
     Log To Console   ${PRODUCT NAME4}
     Log To Console   ${PRODUCT NAME5}
     Log To Console   ${PRODUCT NAME6}
     Log To Console   ${PRODUCT NAME7}

The number of products by third keyword in English
     ${number products by third English keyword} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${number products by third English keyword} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10393')]//div//a  attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10950')]//div//a  attribute=title
     Page Should Contain  ${FOUND PRODUCTS}
     Log To Console   Third KEYWORD in English: ${THIRD KEYWORD ENGLISH}
     Log To Console   ${FOUND PRODUCTS}
     Log To Console   ${number products by third English keyword}
     Log To Console   ${PRODUCT NAME1}
     Log To Console   ${PRODUCT NAME2}

The number of products from Category "KONTROLA WAGI" for which used keywords for this test
     ${CATEGORY NAME}=  Get Element Attribute  xpath=/html/body/div[1]/div[3]/div/div/div[1]/div[1]/div[2]/ul/li[11]/a  attribute=title
     Log To Console   Category name: ${CATEGORY NAME}
     ${number_category_products}=  Get Element Attribute  xpath=//*[@id="category_479"]/em   attribute=textContent
     Log To Console  The number of products in category: ${number_category_products}
     Sleep  3s
     Click Element   ${CHECK CATEGORY}
     Scroll Element Into View  xpath=//*[@id="category_479"]/a
     Sleep  3s
     Capture Page Screenshot
     Sleep  5s
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10950')]//div//a  attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10393')]//div//a   attribute=title
     ${PRODUCT NAME3}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10579')]//div//a  attribute=title
     ${PRODUCT NAME4}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '20104')]//div//a  attribute=title
     ${PRODUCT NAME5}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10904')]//div//a  attribute=title
     ${PRODUCT NAME6}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10392')]//div//a  attribute=title
     ${PRODUCT NAME7}=  Get Element Attribute  xpath=//div[contains(@data-product-id, '10431')]//div//a  attribute=title
     Log To Console   ${PRODUCT NAME1}
     Log To Console   ${PRODUCT NAME2}
     Log To Console   ${PRODUCT NAME3}
     Log To Console   ${PRODUCT NAME4}
     Log To Console   ${PRODUCT NAME5}
     Log To Console   ${PRODUCT NAME6}
     Log To Console   ${PRODUCT NAME7}

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


Select first found product
     Click Element   ${FIRST SEARCHED PRODUCT}
     Sleep   3s

Add first found product in cart
     Click Button    ${BUTTON ADD TO CART}
     Sleep   3s
     
Accept searching using Search button
     Click Button   ${SEARCH BUTTON}
     Sleep  3s

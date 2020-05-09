*** Settings ***

Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation



*** Variables ***

${BROWSER}      Chrome
${PAGE URL}    https://centrumamis.pl
${PAGE TITLE}    Sklep zielarski Centrum Amis

${REGISTRATION PAGE}   xpath=//span[text()='Zarejestruj się']
${REGISTRATION BUTTON}   xpath=/html/body/div[1]/div[3]/div/div/div[2]/div/form/fieldset/div[2]/div[7]/button
${ALERT MESSAGE}   Formularz rejestracji zawiera błędy.
${CANCEL ALERT MESSAGE}   xpath=/html/body/div[1]/div[3]/div/button
${REGISTRATION PAGE INFORMATION}   Rejestracja
${INVALID REGISTRATION MESSAGE}   After registartion with empty data appeared alert:
${USER EMAIL FIELD SELECTOR}    id=input_mail
${USER PASSWORD FIELD SELECTOR}   id=input_pass1
${USER PASSWORD CONFIRMATION FIELD SELECTOR}   id=input_pass2


${SEARCH FIELD SELECTOR}    class=search__input
${SUBMIT BUTTON}   css=.js__search-submit-btn
${SEARCH BUTTON}   css=.js__search-submit-btn
${FIRST KEYWORD}    odchudzanie
${SECOND KEYWORD NOMINATIVE}    waga
${SECOND KEYWORD GENITIVE}    wagi
${THIRD KEYWORD ENGLISH}    slim
${CHECK CATEGORY}     xpath=/html/body/div[1]/div[3]/div/div/div[1]/div[1]/div[2]/ul/li[11]/a
${FOUND PRODUCTS}  Znaleziono produktów:


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


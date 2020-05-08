*** Settings ***

Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation
Resource   ../resources/resource.robot

Metadata   Robot Framework version 3.1.2
Metadata   Author  Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers

*** Variables ***


*** Test Cases ***

Badanie semantycznych słów kluczowych dla sklepu do wyszukiwania produktów
     Wpisać pierwsze słowo kluczowe produktu w polu Szukaj
     Zaakceptować wyszukiwanie przyciskiem
     Liczba produktów według pierwszego słowa kluczowego
     Wpisać drugie słowo kluczowe produktu w mianowniku w polu Szukaj
     Zaakceptować wyszukiwanie przyciskiem
     Liczba produktów według drugiego słowa kluczowego w mianowniku
     Wpisać drugie słowo kluczowe produktu w dopełniaczu w polu Szukaj
     Zaakceptować wyszukiwanie przyciskiem
     Liczba produktów według drugiego słowa kluczowego w dopełniaczu
     Wpisać trzecie słowo kluczowe produktu w języku angielskim w polu Szukaj
     Zaakceptować wyszukiwanie przyciskiem
     Liczba produktów według trzeciego słowa kluczowego w języku angielskim
     Liczba produktów z kategorii KONTROLA WAGI, której dotyczą użyte słowa kluczowe


*** Keywords ***


Wpisać pierwsze słowo kluczowe produktu w polu Szukaj
     Input Text   ${SEARCH FIELD SELECTOR}  ${INPUT KEY WORD1}
     Sleep   3s

Zaakceptować wyszukiwanie przyciskiem
     Click Button   ${SUBMIT BUTTON}
     Sleep  3s

Wpisać drugie słowo kluczowe produktu w mianowniku w polu Szukaj
     Input Text   ${SEARCH FIELD SELECTOR}  ${INPUT KEY WORD2 NOMINATIVE}
     Sleep   3s

Wpisać drugie słowo kluczowe produktu w dopełniaczu w polu Szukaj
     Input Text   ${SEARCH FIELD SELECTOR}  ${INPUT KEY WORD2 GENITIVE}
     Sleep   3s

Wpisać trzecie słowo kluczowe produktu w języku angielskim w polu Szukaj
     Input Text   ${SEARCH FIELD SELECTOR}  ${INPUT KEY WORD3 ENGLISH}
     Sleep   3s

Liczba produktów według pierwszego słowa kluczowego
     ${count} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${count} > 0
     ${PRODUCT NAME1}=  Get Element Attribute  xpath=//*[@id="box_mainproducts"]/div[2]/div/div[1]/div/a[2]    attribute=title
     ${PRODUCT NAME2}=  Get Element Attribute  xpath=/html/body/div[1]/div[3]/div/div/div[2]/div[2]/div[2]/div/div[2]/div/a[1]    attribute=title
     ${PRODUCT NAME3}=  Get Element Attribute  xpath=/html/body/div[1]/div[3]/div/div/div[2]/div[2]/div[2]/div/div[3]/div/a[1]    attribute=title
     ${PRODUCT NAME4}=  Get Element Attribute  xpath=/html/body/div[1]/div[3]/div/div/div[2]/div[2]/div[2]/div/div[4]/div/a[1]    attribute=title
     Get Text  css=.category-name
     Log To Console  ${PRODUCT NAME1}=
     Log To Console  ${PRODUCT NAME2}=
     Log To Console  ${PRODUCT NAME3}=
     Log To Console  ${PRODUCT NAME4}=


Liczba produktów według drugiego słowa kluczowego w mianowniku
     ${count} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${count} > 0

Liczba produktów według drugiego słowa kluczowego w dopełniaczu
     ${count} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${count} > 0

Liczba produktów według trzeciego słowa kluczowego w języku angielskim
      ${count} =  Get Element Count   xpath=//div[contains(@class, 'price f-row')]//em
     Should Be True  ${count} > 0

Liczba produktów z kategorii KONTROLA WAGI, której dotyczą użyte słowa kluczowe
     ${liczba_produktów_kategorii}=  Get Element Attribute  xpath=//*[@id="category_479"]/em   attribute=textContent
     Log To Console  ${liczba_produktów_kategorii}
     Sleep  3s
     Click Element   ${CHECK CATEGORY}
     Scroll Element Into View  xpath=//*[@id="category_479"]/a
     Sleep  3s
     Capture Page Screenshot
     Sleep  5s

*** Settings ***

Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation

*** Variables ***

${BROWSER}      Chrome
${PAGE URL}    https://centrumamis.pl/pl/
${SEARCH FIELD SELECTOR}    class=search__input
${SUBMIT BUTTON}   css=.js__search-submit-btn
${INPUT KEY WORD1}    odchudzanie
${INPUT KEY WORD2 NOMINATIVE}    waga
${INPUT KEY WORD2 GENITIVE}    wagi
${INPUT KEY WORD3 ENGLISH}    slim
${CHECK CATEGORY}     xpath=/html/body/div[1]/div[3]/div/div/div[1]/div[1]/div[2]/ul/li[11]/a

*** Test Cases ***

Badanie semantycznych słów kluczowych dla sklepu do wyszukiwania produktów
     Wejść na stronę internetową sklepu
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
Wejść na stronę internetową sklepu
     Open Browser  ${PAGE URL}  ${BROWSER}
     Sleep  3s
     Maximize Browser Window
     Sleep  3s

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
     [Teardown]  Close Browser

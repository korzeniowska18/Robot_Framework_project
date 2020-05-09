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
${INPUT KEY WORD1}    odchudzanie
${INPUT KEY WORD2 NOMINATIVE}    waga
${INPUT KEY WORD2 GENITIVE}    wagi
${INPUT KEY WORD3 ENGLISH}    slim
${CHECK CATEGORY}     xpath=/html/body/div[1]/div[3]/div/div/div[1]/div[1]/div[2]/ul/li[11]/a


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

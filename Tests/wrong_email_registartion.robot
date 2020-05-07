*** Settings ***
Library  SeleniumLibrary
Documentation  RobotFramework Selenium2Library documentation

Metadata  Author: Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}      Chrome
${PAGE URL}    https://centrumamis.pl
${PAGE TITLE}    Sklep zielarski Centrum Amis
${REGISTRATION PAGE}   xpath=//span[text()='Zarejestruj się']
${USER EMAIL FIELD SELECTOR}    id=input_mail
${USER PASSWORD FIELD SELECTOR}   id=input_pass1
${USER PASSWORD CONFIRMATION FIELD SELECTOR}   id=input_pass2
${INPUT WRONG EMAIL}   A1
${INPUT PASSWORD}   12345678
${INPUT CONFIRMATION PASSWORD}   12345678
${CHECKBOX REGULATIONS}   id=additional_1
${REGISTRATION BUTTON}   xpath=/html/body/div[1]/div[3]/div/div/div[2]/div/form/fieldset/div[2]/div[7]/button
${RIGHT ALERT MESSAGE FOR WRONG EMAIL}   Formularz rejestracji zawiera błędy.
${WRONG ALERT MESSAGE FOR WRONG EMAIL}   Dziękujemy za założenie konta.
${CANCEL ALERT MESSAGE}   xpath=/html/body/div[1]/div[3]/div/button
${REGISTRATION PAGE SHOULD CONTAIN}   Rejestracja
${WRONG ALERT}   Registration page has mistake in Alert message.

*** Test Cases ***
Scenario: Valid registartion using wrong email
    Select Registration page
    Input wrong email in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message


*** Keywords ***

Open the web page of the shop
     Open Browser  ${PAGE URL}  ${BROWSER}
     Maximize Browser Window
     Title Should Be  ${PAGE TITLE}

Select Registration page
    Click Element  ${REGISTRATION PAGE}
    Sleep  3 s

Input wrong email in user email field
     Input Text   ${USER EMAIL FIELD SELECTOR}  ${INPUT WRONG EMAIL}
     Sleep   3s

Input password and confirm it in password fields
     Input Text   ${USER PASSWORD FIELD SELECTOR}  ${INPUT PASSWORD}
     Sleep   3s
     Input Text   ${USER PASSWORD CONFIRMATION FIELD SELECTOR}  ${INPUT CONFIRMATION PASSWORD}
     Sleep   3s

Checkbox Regulations
     Page Should Contain Checkbox  ${CHECKBOX REGULATIONS}
     #Select Checkbox    ${CHECKBOX REGULATIONS}
     #Click Button  ${CHECKBOX REGULATIONS}
     #Checkbox Should Be Selected  ${CHECKBOX REGULATIONS}
     Sleep  3s


Click Registartion Button
    Click Button   ${REGISTRATION BUTTON}
    Sleep  3s

Equal Alert message
    Page Should Contain    ${RIGHT ALERT MESSAGE FOR WRONG EMAIL}
    ${WRONG ALERT MESSAGE}=  Page Should Not Contain    ${WRONG ALERT MESSAGE FOR WRONG EMAIL}

    Log To Console  ${WRONG ALERT MESSAGE}=    ${WRONG ALERT}

Close Alert message and back to Registration page
    Click Button  ${CANCEL ALERT MESSAGE}
    Page Should Contain   ${REGISTRATION PAGE SHOULD CONTAIN}

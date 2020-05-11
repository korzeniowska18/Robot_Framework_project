*** Settings ***

Library  SeleniumLibrary
Library  Collections
Documentation  This is a test suite to test registartion option on the page using wrong email.

Metadata   Robot Framework version 3.1.2
Metadata   Library version:	4.4.0
Metadata   Author  Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers

*** Variables ***

${USER EMAIL FIELD SELECTOR}    id=input_mail
${USER PASSWORD FIELD SELECTOR}   id=input_pass1
${USER PASSWORD CONFIRMATION FIELD SELECTOR}   id=input_pass2
${INPUT WRONG EMAIL WITHOUT "@"}   A2
${INPUT WRONG EMAIL}   ZB@zzzzzzzz.pl
${INPUT PASSWORD}   12345678
${INPUT CONFIRMATION PASSWORD}   12345678
${CHECKBOX REGULATIONS}   id=additional_1
${CHECKBOX BUTTON FOR REGULATIONS}   xpath=//div[contains(@class, 'input')]//span[2]//label
${RIGHT ALERT MESSAGE FOR WRONG EMAIL}   Formularz rejestracji zawiera błędy.
#${WRONG ALERT MESSAGE FOR WRONG EMAIL}   Dziękujemy za założenie konta.
${CANCEL ALERT MESSAGE}   xpath=/html/body/div[1]/div[3]/div/button

${WRONG ALERT}   Registration page has mistake in Alert message. Registration with wrong email should be impossible. In this case account with wrong email created and alert informed about successuful registration.
${CORRECT ALERT}  Registration page has correct Alert message. Registration with wrong email impossible.
${ERROR ABOUT EMAIL}   Nieprawidłowy format adresu e-mail
${INCOMPLETE ADITIONAL ALERT}   After invalid registartion with wrong email not informed taht the issue is with email, only about mistake during registartion.

*** Test Cases ***
Scenario: Valid registartion using wrong email without "@"
    [Tags]  critical
    Select Registration page
    Input wrong email without "@" in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page

Scenario: Valid registartion using wrong email
    [Tags]  critical
    Select Registration page
    Input wrong email in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page


*** Keywords ***

Open the web page of the shop
     Open Browser  ${PAGE URL}  ${BROWSER}
     Maximize Browser Window
     Title Should Be  ${PAGE TITLE}

Select Registration page
    Click Element  ${REGISTRATION PAGE}
    Sleep  3 s

Input wrong email without "@" in user email field
     Input Text   ${USER EMAIL FIELD SELECTOR}  ${INPUT WRONG EMAIL WITHOUT "@"}
     Sleep   3s

Input wrong email in user email field
     Input Text   ${USER EMAIL FIELD SELECTOR}  ${INPUT WRONG EMAIL}
     Sleep   3s

Input password and confirm it in password fields
     Input Text   ${USER PASSWORD FIELD SELECTOR}  ${INPUT PASSWORD}
     Sleep   3s
     Input Text   ${USER PASSWORD CONFIRMATION FIELD SELECTOR}  ${INPUT CONFIRMATION PASSWORD}
     Sleep   3s

Checkbox Regulations
     Click Element    ${CHECKBOX BUTTON FOR REGULATIONS}
     Sleep  3s


Click Registartion Button
    Click Button   ${REGISTRATION BUTTON}
    Sleep  3s

Equal Alert message
    Page Should Contain    ${RIGHT ALERT MESSAGE FOR WRONG EMAIL}  loglevel=${WRONG ALERT}
    Page Should Contain    ${ERROR ABOUT EMAIL}   loglevel=${INCOMPLETE ADITIONAL ALERT}
    Log To Console         ${CORRECT ALERT}



Close Alert message and back to Registration page
    Click Button  ${CANCEL ALERT MESSAGE}
    Page Should Contain   ${REGISTRATION PAGE INFORMATION}

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


*** Test Cases ***
Scenario1: Valid registartion using wrong email without "@"
    [Tags]   critical   Ready
    
    Select Registration page
    Input wrong email without "@" in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page

Scenario2: Valid registartion using wrong email
    [Tags]   critical   Ready
    
    Select Registration page
    Input wrong email in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page


*** Keywords ***


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


Equal Alert message
    Page Should Contain    ${RIGHT ALERT MESSAGE FOR WRONG EMAIL}  loglevel=${WRONG ALERT}
    Page Should Contain    ${ERROR ABOUT EMAIL}   loglevel=${INCOMPLETE ADITIONAL ALERT}
    Log To Console         ${CORRECT ALERT}



Close Alert message and back to Registration page
    Click Button  ${CANCEL ALERT MESSAGE}
    Page Should Contain   ${REGISTRATION PAGE INFORMATION}

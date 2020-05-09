*** Settings ***
Library  SeleniumLibrary
Documentation  This is a test suite to test registartion option on the page with empty data
Resource   ../resources/resource.robot

Metadata   Robot Framework version 3.1.2
Metadata   Library version:	4.4.0
Metadata   Author  Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers

*** Variables ***


*** Test Cases ***
Scenario: Valid registartion when all fields empty
    [Tags]  critical
    [Tags]  Ready
    
    Select Registration page
    Check and empty all required fields for registartion
    Click Registartion Button
    Equal Alert message
    Cancel Alert message and back to Registration page
    Check that this is Registartion page


*** Keywords ***

Select Registration page
    Click Element  ${REGISTRATION PAGE}
    Sleep  3 s

Check and empty all required fields for registartion
    Clear Element Text   ${USER EMAIL FIELD SELECTOR}
    Sleep  3s
    Clear Element Text   ${USER PASSWORD FIELD SELECTOR}
    Sleep   3s
    Clear Element Text  ${USER PASSWORD CONFIRMATION FIELD SELECTOR}
    Sleep   3s

Click Registartion Button
    Click Button   ${REGISTRATION BUTTON}
    Sleep  3s


Equal Alert message
    Page Should Contain    ${ALERT MESSAGE}
    Log To Console  ${INVALID REGISTRATION MESSAGE}
    Log To Console   ${ALERT MESSAGE}

Cancel Alert message and back to Registration page
    Click Button  ${CANCEL ALERT MESSAGE}

Check that this is Registartion page
    Page Should Contain   ${REGISTRATION PAGE INFORMATION}


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
Scenario: Valid registartion when all fields empty
    [Tags]  notReady
    
    Select Registration page
    Click Registartion Button
    Equal Alert message


*** Keywords ***


Click Registartion Button
    Click Button   ${REGISTRATION BUTTON}
    Sleep  3s

Equal Alert message
    Page Should Contain    ${ALERT MESSAGE}
    Log To Console   ${ALERT MESSAGE}

Close Alert message and back to Registration page
    Click Button  ${CANCEL ALERT MESSAGE}
    Page Should Contain   ${REGISTRATION PAGE SHOULD CONTAIN}

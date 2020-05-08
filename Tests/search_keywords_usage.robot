*** Settings ***

Library  SeleniumLibrary
Documentation   This is a test suite to test search products on the page using semantic keywords.
Resource   ../resources/resource.robot

Metadata   Robot Framework version 3.1.2
Metadata   Author  Natalia Korzeniowska

Suite Setup  Open the web page of the shop
Suite Teardown    Close All Browsers


*** Variables ***


*** Test Cases ***

Testing Semantic Keywords for the search products in teh shop
     [Tags]  critical

     Input first keyword of the product in Search field
     Accept searching using Search button
     The number of products by first keyword
     Input second keyword of the product in nominative case in Search field
     Accept searching using Search button
     The number of products by second keyword in nominative case
     Input second keyword of the product in genitive case in Search field
     Accept searching using Search button
     The number of products by second keyword in genitive case
     Input third keyword of the product in English in Search field
     Accept searching using Search button
     The number of products by third keyword in English
     The number of products from Category "KONTROLA WAGI" for which used keywords for this test


*** Keywords ***


Input first keyword of the product in Search field
     Input Text   ${SEARCH FIELD SELECTOR}  ${FIRST KEYWORD}
     Sleep   3s


Input second keyword of the product in nominative case in Search field
     Input Text   ${SEARCH FIELD SELECTOR}  ${SECOND KEYWORD NOMINATIVE}
     Sleep   3s

Input second keyword of the product in genitive case in Search field
     Input Text   ${SEARCH FIELD SELECTOR}  ${SECOND KEYWORD GENITIVE}
     Sleep   3s

Input third keyword of the product in English in Search field
     Input Text   ${SEARCH FIELD SELECTOR}  ${THIRD KEYWORD ENGLISH}
     Sleep   3s



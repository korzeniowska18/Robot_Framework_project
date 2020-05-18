I.Test Case 4 - Search product using semantic keywords

ID: 004

Title: Search product on the page using semantic keywords and analyze results

Environment: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Precondition: Open browser. The user is not logged.

Suite Setup  Open the web page „https://centrumamis.pl/pl” of the shop
Suite Teardown    Close All Browsers

Test Case 4:

Testing Semantic Keywords for the search products in teh shop
     [Tags]  Test4   Sanity   Ready
     
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
     
     
 STEPS WITH DETAILS:
 

1. Input first keyword of the product in Search field
2. Click Search button
3. Log to console numbers of found products
4. Log to console names of found products
5. Input second keyword of the product in nominative case in Search field
6. Click Search button
7. Log to console numbers of found products
8. Log to console names of found products 
9. Input second keyword of the product in genitive case in Search field
10. Click Search button
11. Log to console numbers of found products
12. Log to console names of found products 
13. Input third keyword of the product in English in Search field
14. Click Search button
15. Log to console numbers of found products
16. Log to console names of found products 
17. Get the number of products from Category "KONTROLA WAGI" for which used keywords for this test
18. Log to console the number of products from Category "KONTROLA WAGI" for which used keywords for this test


Result:



Expected result(behaviour):



Summary:

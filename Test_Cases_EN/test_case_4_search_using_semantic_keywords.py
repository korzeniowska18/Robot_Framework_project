I.Test Case 4 - Search product using semantic keywords

ID: 004

Title: Search product on the store page using semantic keywords and analyze results

Environment: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Precondition: Open browser. The user is not logged.

Suite Setup  Open the web page „https://centrumamis.pl/pl” of the shop
Suite Teardown    Close All Browsers

Test Case 4:

Testing Semantic Keywords for the search products in the store
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
 

1. Input first keyword "odchudzanie" of the product in Search field
2. Click Search button
3. Log to console numbers of found products
4. Log to console names of found products
5. Input second keyword of the product "waga" in nominative case in Search field
6. Click Search button
7. Log to console numbers of found products
8. Log to console names of found products 
9. Input second keyword of the product "wagi" in genitive case in Search field
10. Click Search button
11. Log to console numbers of found products
12. Log to console names of found products 
13. Input third keyword of the product "slim" in English in Search field
14. Click Search button
15. Log to console numbers of found products
16. Log to console names of found products 
17. Get the number of products from Category "KONTROLA WAGI" for which used keywords for this test
18. Log to console the number of products from Category "KONTROLA WAGI" for which used keywords for this test


Result:

After input in "SEARCH" field semantic keywords related on the same category of products "Kontrola wagi" we observed different results according to following structure:


Keyword „odchudzanie” - 4 products

Keyword "waga" in nominative case - 1 product

Keyword "wagi" in genitive case - 7 products

Keyword „slim” in English - 2 products

The number of products from Category "KONTROLA WAGI" - 7 products

During the test done screenshot with the nember of products from the category „Kontrola wagi”


Expected result(behaviour):

Appearing as many products as possible on the store's web page using semantic keywords.


Summary:

Based on the test report, we can to see that the keyword resource is not extensive and does not properly account for semantic keywords. 

During the analyze using keyword in genitive case we found more products then using the same keyword in nominative case. 

It would be good to make sure that the changed keywords are also placed in the nominative case.

The nominative case for keywords most often used during searching by users.

During analyze also used some well-known and widely used English word for this category but not found so much products.

Found only products which includes this word in the name. Not found products with Polish equivalents.

It would be good to add well-known English keywords semantically related to keywords in Polish to ensure proper optimization.



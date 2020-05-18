I.Test Case 1 - Registration with empty data

ID: 001

Title: Registration of the new user without input any required data on the shop web page.

Environment: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Precondition: Open browser. The user is not logged.

Suite Setup  Open the web page „https://centrumamis.pl/pl” of the shop
Suite Teardown    Close All Browsers

Test Case:

    Select Registration page
    Check and empty all required fields for registartion
    Click Registration Button
    Equal Alert message
    Cancel Alert message and back to Registration page
    Confirm that this is Registration page

STEPS WITH DETAILS:

1. Select Registration page
2. User email field clear
3. User password field clear
4. User password confirmation field clear
5. Click "Registration" button 
6. Appears the error about mistake during registartion
7. Check that page contains appropriate error message
8. Cancel Error message
9. Check that back to Registration page

Result:

Appears the error "Registration form include the mistakes." 

Expected result(behaviour):

Appearing the error about mistakes in the registartion form. 

Summary:

Registration is impossible without input any data. In this point registartion works correctly.




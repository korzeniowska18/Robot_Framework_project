I.Test Case 2 - Registration with wrong email

ID: 002

Title: Registration new user on the web page using wrong email.

Environment: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Precondition: Open browser. The user is not logged.

Suite Setup  Open the web page „https://centrumamis.pl/pl” of the shop
Suite Teardown    Close All Browsers

Test Case 2:

   Scenario1: Valid registartion using wrong email without "@"
    [Tags]   Test2 Critical   Ready
    
    Select Registration page
    Input wrong email without "@" in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page

Scenario2: Valid registartion using wrong email
    [Tags]   Test 2 critical   Ready
    
    Select Registration page
    Input wrong email in user email field
    Input password and confirm it in password fields
    Checkbox Regulations
    Click Registartion Button
    Equal Alert message
    Close Alert message and back to Registration page


STEPS WITH DETAILS:
 Scenario1: Valid registartion using wrong email without "@"

1. Select Registration page
2. Input wrong email without "@" in user email field
3. Input password in password field
4. Input password confirmation in password field
5. Click "Registration" button 
6. Checkbox Regulations
7. Click Registartion Button
6. Appears the error about mistake during registartion
7. Check that page contains appropriate error message
8. Cancel Error message
9. Check that back to Registration page

Result:

Appears the error "Registration form include the mistakes." 

Expected result(behaviour):

Appearing the error about mistakes in the registartion form. 

Summary:

Registration is impossible using wrong email without "@". In this point registartion works correctly.

STEPS WITH DETAILS:
 Scenario2: Valid registartion using wrong email

1. Select Registration page
2. Input wrong not really email in user email field
3. Input password in password field
4. Input password confirmation in password field
5. Click "Registration" button 
6. Checkbox Regulations
7. Click Registration Button
6. Appears the error about mistake during registration
7. Check that page contains appropriate error message
8. Cancel Error message
9. Check that back to Registration page

Result:

In this scenario with wrong email not appeared the error "Registration form include the mistakes." Registartion done successuful.

Expected result(behaviour):

Appearing the error about mistakes in the registraion form. 

Summary:

Registration page includes mistake and can not to check that email is correct or not, not appered appropriate error. 
Registration lets register with wrong not really email . 
This will be better improve because everyone can register on this page without really email. 



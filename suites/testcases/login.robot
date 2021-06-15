*** Settings ***
Documentation   Test suites for login test cases
Resource        ../../helper/base.robot
Resource        ../../page-objects/home-page.robot
Resource        ../../page-objects/login-page.robot
Test Setup      Run Keywords  Open Kumparan On Browser  AND  Answer Notification Popup
Test Teardown   Close Browser


*** Variables ***
${valid_email}          hshennysinaga@gmail.com
${valid_password}       12qwasZX
${invalid_password}     INVALIDPASSWORD
${unregistered_email}   henny@kumparan.com


*** Test Cases ***
User Successfully Open Login Page
    [Documentation]         User open login page and should be able to view login form
    [Tags]                  login  positive-case
    Open Login Page
    Verify Login Page Is Open

User Successfully Login With Valid Email And Password
    [Documentation]         User should be successfully login and redirect to home page
    [Tags]                  login  positive-case
    Open Login Page
    Input Email On Login Form  ${valid_email}
    Input Password On Login Form  ${valid_password}
    Click Login Button On Login Form
    Verify Loged In User On Home Page

User Should Get Error Message When Login With Invalid Password
    [Documentation]         User failed to login with invalid password and should get error message
    [Tags]                  login  negative-case
    Open Login Page
    Input Email On Login Form  ${valid_email}
    Input Password On Login Form  ${invalid_password}
    Click Login Button On Login Form
    Verify Field Error Message On Login Form  password

User Should Get Error Message When Login With Unregistered Email
    [Documentation]         User failed to login with unregistered email and should get error message
    [Tags]                  login  negative-case
    Open Login Page
    Input Email On Login Form  ${unregistered_email}
    Input Password On Login Form  ${valid_password}
    Click Login Button On Login Form
    Verify Field Error Message On Login Form  email


*** Keywords ***
Verify Login Page Is Open
    [Documentation]                 Validate if login page is open and login form is visible
    Wait Until Element Is Visible   ${login_page.button_login}
    Element Should Be Visible       ${login_page.input_email}
    Element Should Be Visible       ${login_page.input_password}

Verify Loged In User On Home Page
    [Documentation]                 Validate if user succesfully login and redirected to home page
    Wait Until Element Is Visible   ${home_page.button_user_avatar}
    Element Should Not Be Visible   ${home_page.button_login}
    Wait Until Element Is Visible   ${home_page.logo}
    Wait Until Element Is Visible   ${home_page.headline_news.card}
    Wait Until Element Is Visible   ${home_page.headline_news.label_title}

Verify Field Error Message On Login Form
    [Documentation]                 Validate login failed and error message on login form visible
    [Arguments]                     ${field}
    Should Contain Any              ${field}  password  email
    Wait Until Element Is Visible   ${login_page.label_${field}_error}
    Element Text Should Be          ${login_page.label_${field}_error}  Email atau Password Salah

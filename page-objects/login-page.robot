*** Settings ***
Documentation   Action keywords on login page
Variables       ./elements.yaml


*** Variables ***
${valid_email}          hshennysinaga@gmail.com
${valid_password}       12qwasZX


*** Keywords ***
Input Email On Login Form
    [Documentation]                 Input given string on email field
    [Arguments]                     ${email}
    Wait Until Element Is Visible   ${login_page.input_email}
    Input Text                      ${login_page.input_email}  ${email}

Input Password On Login Form
    [Documentation]                 Input given string on password field
    [Arguments]                     ${password}
    Wait Until Element Is Visible   ${login_page.input_password}
    Input Text                      ${login_page.input_password}  ${password}

Click Login Button On Login Form
    [Documentation]                 Click login button to execute login function
    Wait Until Element Is Visible   ${login_page.button_login}
    Click Element                   ${login_page.button_login}

User Has Logged In With Email And Password
    [Documentation]                 Login with valid email and password in one keyword. Can be used as precondition
    Open Login Page
    Input Email On Login Form       ${valid_email}
    Input Password On Login Form    ${valid_password}
    Click Login Button On Login Form

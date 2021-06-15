*** Settings ***
Documentation   Action keywords on change password page
Variables       ./elements.yaml

*** Keywords ***
Input Old Password On Change Password Page
    [Documentation]                 Input given string on old password field
    [Arguments]                     ${old_password}
    Wait Until Element Is Visible   ${change_password_page.input_old_password}
    Input Text                      ${change_password_page.input_old_password}  ${old_password}

Input New Password On Change Password Page
    [Documentation]                 Input given string on new password field
    [Arguments]                     ${new_password}
    Wait Until Element Is Visible   ${change_password_page.input_new_password}
    Input Text                      ${change_password_page.input_new_password}  ${new_password}

Input Retype New Password On Change Password Page
    [Documentation]                 Input given string on retype new password field
    [Arguments]                     ${retype_new_password}
    Wait Until Element Is Visible   ${change_password_page.input_retype_new_password}
    Input Text                      ${change_password_page.input_retype_new_password}  ${retype_new_password}

Click Save Change Password Button On Change Password Page
    [Documentation]                 Click save button to change password
    Wait Until Element Is Visible   ${change_password_page.button_save_password}
    Click Element                   ${change_password_page.button_save_password}

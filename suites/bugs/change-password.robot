*** Settings ***
Documentation   Test suites for change password bugs
Resource        ../../helper/base.robot
Resource        ../../page-objects/home-page.robot
Resource        ../../page-objects/login-page.robot
Resource        ../../page-objects/change-password-page.robot
Test Setup      Run Keywords  Open Kumparan On Browser  AND  Answer Notification Popup
Test Teardown   Close Browser


*** Variables ***
${lowercase_password}   qwaszxqw
${valid_password}       12qwasZX


*** Test Cases ***
Change Password With The Same Password As The Old Password Show Incorrect Error Message
    [Documentation]     Input the same old password as new password should open error message
    ...                 on new password tells that new password cannot be same as old password
    [Tags]              bugs  change-password
    User Has Logged In With Email And Password
    Open Change Password Page
    Input Old Password On Change Password Page  ${valid_password}
    Input New Password On Change Password Page  ${valid_password}
    Input Retype New Password On Change Password Page  ${valid_password}
    Click Save Change Password Button On Change Password Page
    Error Message On Old Password Should Not Open

Change Password With Lowercase Should Fail
    [Documentation]     Change password with lowercase should be error. The valid password should contain uppercase and number
    [Tags]              bugs  change-password
    User Has Logged In With Email And Password
    Open Change Password Page
    Input Old Password On Change Password Page  ${valid_password}
    Input New Password On Change Password Page  ${lowercase_password}
    Input Retype New Password On Change Password Page  ${lowercase_password}
    Click Save Change Password Button On Change Password Page
    Success Change Password Modal Should Not Open


*** Keywords ***
Success Change Password Modal Should Not Open
    [Documentation]                 Validate success change password modal should not appear
    Wait Until Element Is Enabled   ${change_password_page.button_save_password}
    Element Should Not Be Visible   ${change_password_page.success_change_password_modal.container}
    Element Should Not Be Visible   ${change_password_page.success_change_password_modal.label_caption}
    Element Should Not Be Visible   ${change_password_page.success_change_password_modal.button_ok}

Error Message On Old Password Should Not Open
    [Documentation]                 Validate error message should not appear in old password field, but should appear on new password field
    Element Should Not Be Visible   ${change_password_page.label_error_old_password}
    Element Should Be Visible       ${change_password_page.label_error_new_password}
    Element Should Be Visible       ${change_password_page.label_error_retype_new_password}

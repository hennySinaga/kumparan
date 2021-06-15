*** Settings ***
Documentation   Test suites for see news test cases
Resource        ../../helper/base.robot
Resource        ../../page-objects/home-page.robot
Resource        ../../page-objects/login-page.robot
Test Setup      Run Keywords  Open Kumparan On Browser  AND  Answer Notification Popup
Test Teardown   Close Browser


*** Test Cases ***
Guest User Successfully View News From Headline Section
    [Documentation]         Guest user should be able to open news story page
    [Tags]                  see-news  positive-case
    Open News From Headline Section
    Verify News Story Page Has Open

Logged In User Successfully View News From Headline Section
    [Documentation]         Login user should be able to open news story page
    [Tags]                  see-news  positive-case
    User Has Logged In With Email And Password
    Open News From Headline Section
    Verify News Story Page Has Open


*** Keywords ***
Verify News Story Page Has Open
    [Documentation]                 Validate components on news story page
    [Arguments]                     ${headline_news_info}=${NEWS_INFO}  ${is_login}=${FALSE}
    Run Keyword If                  ${is_login}  Wait Until Element Is Visible   ${home_page.button_user_avatar}
    Wait Until Element Is Visible   ${news_page.label_title}
    Element Text Should Be          ${news_page.label_title}  ${headline_news_info['title']}
    Wait Until Element Is Visible   ${news_page.img_author_avatar}
    Wait Until Element Is Visible   ${news_page.label_author_name}
    Element Text Should Be          ${news_page.label_author_name}  ${headline_news_info['author']}
    Wait Until Element Is Visible   ${news_page.label_channel_name}
    Wait Until Element Is Visible   ${news_page.label_publish_date}
    Wait Until Element Is Visible   ${news_page.label_reading_time}
    Wait Until Element Is Visible   ${news_page.label_story}
    Wait Until Element Is Visible   ${news_page.img_story_image}
    Wait Until Element Is Visible   ${news_page.label_story_image_caption}
    Wait Until Element Is Visible   ${news_page.label_tag_topic}
    Wait Until Element Is Visible   ${news_page.card_editor_section}
    Wait Until Element Is Visible   ${news_page.button_like}
    Element Text Should Be          ${news_page.label_like_counter}  ${headline_news_info['like_count']}
    Wait Until Element Is Visible   ${news_page.button_comment}
    Element Text Should Be          ${news_page.label_comment_counter}  ${headline_news_info['comment_count']}
    Wait Until Element Is Visible   ${news_page.button_share_whatsapp}
    Wait Until Element Is Visible   ${news_page.button_share_facebook}
    Wait Until Element Is Visible   ${news_page.button_share_twitter}
    Wait Until Element Is Visible   ${news_page.button_share_line}
    Wait Until Element Is Visible   ${news_page.button_share_copy}

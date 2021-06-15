*** Settings ***
Documentation   Action keywords on home page
Variables       ./elements.yaml

*** Keywords ***
Open Login Page
    [Documentation]                 Open login page from home page
    Wait Until Element Is Visible   ${home_page.button_login}
    Click Element                   ${home_page.button_login}

Answer Notification Popup
    [Documentation]                 Answer notification popup to close it
    [Arguments]                     ${answer}=yes
    Should Contain Any              ${answer}  yes  no
    Wait Until Element Is Visible   ${home_page.notification_popup.button_${answer}}
    Click Element                   ${home_page.notification_popup.button_${answer}}

Open News From Headline Section
    [Documentation]                 Open the news story page from the first news on headline section
    Wait Until Keyword Succeeds     5x  5  Wait Until Element Is Visible  ${home_page.headline_news.card}
    Wait Until Element Is Visible   ${home_page.headline_news.label_title}
    ${NEWS_INFO}                    Get Headline News Administration Info
    Click Element                   ${home_page.headline_news.label_title}
    Set Test Variable               ${NEWS_INFO}

Get Headline News Administration Info
    [Documentation]                 Get news administration info from the first news on headline section
    ${title}                        Get Text    ${home_page.headline_news.label_title}
    ${author}                       Get Text    ${home_page.headline_news.label_author_name}
    ${like_count}                   Get Text    ${home_page.headline_news.label_like_counter}
    ${comment_count}                Get Text    ${home_page.headline_news.label_comment_counter}
    ${reading_time}                 Get Text    ${home_page.headline_news.label_reading_time}
    ${news_administration_info}     Create Dictionary  title=${title}  author=${author}  like_count=${like_count}  comment_count=${comment_count}  reading_time=${reading_time}
    [Return]                        ${news_administration_info}

Open Change Password Page
    [Documentation]                 Open change password page from home page
    Wait Until Element Is Visible   ${home_page.button_user_avatar}
    Click Element                   ${home_page.button_user_avatar}
    Wait Until Element Is Visible   ${home_page.label_menu_setting_privacy}
    Click Element                   ${home_page.label_menu_setting_privacy}
    Wait Until Element Is Visible   ${settings_and_privacy_page.card_password_setting}
    Click Element                   ${settings_and_privacy_page.card_password_setting}

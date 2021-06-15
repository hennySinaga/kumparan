*** Settings ***
Documentation   Test suites for news discovery bugs
Resource        ../../helper/base.robot
Resource        ../../page-objects/home-page.robot
Test Setup      Run Keywords  Open Kumparan On Browser  AND  Answer Notification Popup
Test Teardown   Close Browser


*** Test Cases ***
Reading Time On Home Page Is Not Same As News Story Page
    [Documentation]     Reading time on homepage should be equal as reading time on the news story page
    [Tags]              bugs  news-discovery
    Open News From Headline Section
    Verify News Reading Time


*** Keywords ***
Verify News Reading Time
    [Documentation]                 Compare reading time on home page and reading time on news story with the same news
    [Arguments]                     ${headline_news_info}=${NEWS_INFO}
    Wait Until Element Is Visible   ${news_page.label_reading_time}
    Element Should Contain          ${news_page.label_reading_time}  ${headline_news_info['reading_time']}

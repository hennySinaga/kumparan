*** Settings ***
Documentation   Basic keyword for web testing
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${BASE_URL}     https://kumparan.com/
${BROWSER}      Google Chrome

*** Keywords ***
Open Kumparan On Browser
    [Documentation]                 Open browser and go to base url
    Open Browser                    about:blank   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed              0.2
    Go To                           ${BASE_URL}

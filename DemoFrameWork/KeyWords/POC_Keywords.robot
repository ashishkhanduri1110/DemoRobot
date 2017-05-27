*** Settings ***
Library           Selenium2Library
Resource          ExcelKeyWords.robot

*** Keywords ***
Open Browser and launch application
    ${URL}=    Get value by row col    POCSheet    5    1
    Open Browser    ${URL}    firefox    remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window

enter text in field
    [Arguments]    ${locator}    ${value}
    Input Text    ${locator}    ${value}

Click
    [Arguments]    ${locator}
    Click Element    ${locator}

Browser Close
    Close All Browsers

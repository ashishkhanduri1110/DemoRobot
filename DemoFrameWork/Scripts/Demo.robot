*** Settings ***
Test Setup
Library           ExcelLibrary
Resource          ../KeyWords/ExcelKeyWords.robot
Library           Selenium2Library
Resource          ../KeyWords/POC_Keywords.robot

*** Variables ***
${REMOTE_URL}     ${EMPTY}
${DESIRED_CAPABILITIES}    ${EMPTY}
${LOGIN_FAIL_MSG}    Couldn't find your Google Account
${TAG1}           ${EMPTY}

*** Test Cases ***
demo
    Open Browser and launch application
    Title Should Be    Gmail
    Page Should Contain    with your Google Account
    ${text}=    Get value by row col    POCSheet    6    1
    enter text in field    xpath=//*[@id='identifierId']    ${text}
    click    xpath=//span[text()='Next']
    Page Should Contain    ${LOGIN_FAIL_MSG}
    Browser Close
    Log To Console    tag name
    Set Tags    demo

TestTag
    Log To Console    WORKING

TestTag1
    Log To Console    Working n

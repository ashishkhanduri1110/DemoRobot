*** Settings ***
Library           OperatingSystem
Library           ExcelLibrary
Library           Collections
Library           String

*** Keywords ***
Get value by row col
    [Arguments]    ${SheetName}    ${colnu}    ${rownu}
    ${path}=    Get Excel Path
    ${filename}=    Set Variable    ${path}\\POC_Excel.xls
    Open Excel    ${filename}
    ${cellData}=    Read Cell Data By Coordinates    ${SheetName}    ${rownu}    ${colnu}
    Return From Keyword    ${cellData}

Get Excel Path
    ${Demo1}=    Remove String    ${CURDIR}    \\KeyWords
    ${Demo1}=    Set Variable    ${Demo1}\\excel
    [Return]    ${Demo1}

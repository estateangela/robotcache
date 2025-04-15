*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Url}    https://www.google.com/
${browser}    chrome
${Name}    Angela Shi
${Input}    //*[@id="APjFqb"]

*** Test Cases ***
Search Name
    [Documentation]    請自動化 Google 搜尋自己名字 的流程
    Open Browser To Google
    Type In Name
    Click Search Button
    Check Contents

*** Keywords ***
Open Browser To Google
     Open Browser    ${Url}    ${browser}
     Sleep    5s
Type In Name
    Input Text    ${Input}    ${Name}
    Sleep    5s
Click Search Button
    Press Keys    ${Input}    RETURN
Check Contents
    Wait Until Page Contains    ${Name}    timeout=10s
    Page Should Contain    ${Name}
    

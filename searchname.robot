*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Url}    https://www.google.com/
${browser}    chrome
${Name}    Angela Shi
${Input}    //*[@id="APjFqb"]
${button}    //input[@data-ved="0ahUKEwjquoP_68-MAxUIZvUHHcPEPZMQ4dUDCBk"]

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
Type In Name
    Input Text    ${Input}    ${Name}
Click Search Button
    Press Key    locator    key
Check Contents
    Page Should Contain    ${Name}
    

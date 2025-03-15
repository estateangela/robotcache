*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Url}       https://accounts.google.com/
${Browser}   chrome
${button}    //button[span[text()='下一步']]

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Type In Email    aaaaaaaaaaa
    Click Nextstep

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${Url}    ${Browser}

Type In Email
    [Arguments]    ${Email}
    Input Text    id=identifierId    ${Email}

Click Nextstep
    Click Button    下一步
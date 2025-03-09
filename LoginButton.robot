*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${Url}    https://www.bitopro.com/ns/home
${LOGIN_LINK}     //a[contains(text(), '登入')]
${LOGIN_CSS}      a.sc-52ccb927-0.jjdFtE
${Location}    https://www.bitopro.com/users/sign_in

*** Test Cases ***
Page Navigator
    Open Browser To HomePage
    Sleep    3s
    Click Login
    Login Page Should Be Open
    Close Browser
    [Teardown]

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${Url}    ${BROWSER}

Click Login
    Click Element    ${LOGIN_LINK}

Login Page Should Be Open
    Location Should Be    ${Location}
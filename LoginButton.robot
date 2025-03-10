*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    safari
${Url}    https://www.bitopro.com/ns/home
${LOGIN_LINK}     //a[contains(text(), '登入')]
${LOGIN_CSS}      a.sc-52ccb927-0.jjdFtE
${Location}    https://www.bitopro.com/users/sign_in
${TIMEOUT}    10s

*** Test Cases ***
Page Navigator
    Open Browser To HomePage
    Maximize Browser Window
    Click Login
    Login Page Should Be Open
    Close Browser
    [Teardown]

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${Url}    ${BROWSER}
    Set Selenium Implicit Wait    ${TIMEOUT}

Click Login
    Click Element    ${LOGIN_LINK}

Login Page Should Be Open
    Location Should Be    ${Location}
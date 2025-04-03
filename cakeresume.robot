*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}  https://www.bitopro.com/bito_coin
${Browser}  chrome
${Element}  //a[contains(text(), '人才招募')]
${link}     /html/body/div[1]/div[2]/div/ul[2]/li/a

*** Test Cases ***
Check Url
    [Tags]    Check footer Url  rails
    [Documentation]    檢查連結導向 - Cakeresume
    Open Browser To HomePage
    Click 人才招募
    Sleep    5s
    Click Cakeresume
    Sleep    5s
    Check Url

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${URL}    ${Browser}
Click 人才招募
    Scroll Element Into View    ${Element}
    Click Element   ${Element}
Click Cakeresume
    Scroll Element Into View    ${link}
    Click Element   ${link}
Check Url
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.cakeresume.com/companies/bitogroup
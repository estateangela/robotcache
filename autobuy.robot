*** Variables ***
Library    SeleniumLibrary

*** Settings ***
${URL}    https://www.bitopro.com/ns/home
${Browser}    chrome
${Mousehover}    //*[@id="header-bar"]/header/nav/section[1]/ul/li[3]
${Element}    //*[@class='sc-9cd00289-1 fvgSxR' and text()='聯絡我們']

*** Test Cases ***
Check Auto Buy
    [Tags]    Check Url
    [Documentation]    檢查理財下拉選單超連結 - 定期定額
    Open Browser To HomePage
    Mouse Over On 理財
    Wait Until Element Is Visible    ${Element}    5s
    Wait Until Element Is Enabled    ${Element}    5s
    Click 定期定額
    Check Url

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${URL}    ${Browser}
Mouse Over On 理財
    Mouse Over    ${Mousehover}
Click 定期定額
    Click Element    ${Element} 
Check Url
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.bitopro.com/ns/auto-invest
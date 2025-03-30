*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}  https://www.bitopro.com/ns/home
${Browser}  chrome
${Mousehover}   //*[@id="header-bar"]/header/nav/section[2]/div[1]/ul/li[1]/span
${Element}  //*[@id="header-bar"]/header/nav/section[2]/div[1]/ul/li[1]/div/div/ul/div[4]/a/div/span/div/span

*** Test Cases ***
Check Trading
    [Tags]    Check Url
    [Documentation]    檢查錢包下拉選項超連結 - 現貨交易明細
    Open Browser To HomePage
    Mouse Over On Wallet
    Wait Until Element Is Visible    ${Element}    5s
    Wait Until Element Is Enabled    ${Element}    5s
    Click 現貨交易明細
    Sleep    5s
    Check Url

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${URL}    ${Browser}
Mouse Over On Wallet
    Mouse Over    ${Mousehover}
Click 現貨交易明細
    Click Element    ${Element} 
Check Url
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.bitopro.com/history/order
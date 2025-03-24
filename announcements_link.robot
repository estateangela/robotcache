*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://demo.bitopro.com/bito_coin
${Browser}    chrome
${button}    //*[@id="dropdownMenu_announcement"]
${Element}    //span[contains(text(), '查看更多')]

*** Test Cases ***
Check Contact Us
    [Tags]    Check Url
    [Documentation]    檢查聯絡我們超連結
    Open Browser To HomePage
    Mouse Over On Info
    Wait Until Element Is Visible    ${Element}    5s
    Wait Until Element Is Enabled    ${Element}    5s
    Click Contact Us
    Check Url

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${URL}    ${BROWSER}
Mouse Over On Info
    Mouse Over     ${button}
Click Contact Us
    Click Element    ${Element} 
Check Url
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://demo.bitopro.com/ns/announcements

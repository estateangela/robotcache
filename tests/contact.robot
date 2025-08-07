*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.bitopro.com/ns/home
${Browser}    chrome
${Info}    //*[@id="caption-outlined"]
${Element}    //span[@class='sc-eaf11ace-2 kwrTXJ' and text()='聯絡我們']

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
    Mouse Over     ${Info}
Click Contact Us
    Click Element    ${Element} 
Check Url
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.bitopro.com/contact

*** Settings ***
Library               SeleniumLibrary

*** Variables ***
${Url}    https://zh.wikipedia.org/wiki/Wikipedia:%E9%A6%96%E9%A1%B5
${browser}    chrome

*** Test Cases ***
Open Wikipedia
    Open Browser  ${Url}  ${browser}
    Click Button  //span[@class="vector-icon mw-ui-icon-search mw-ui-icon-wikimedia-search"]
    Input Text  //*[@id="p-search"]/div/div/div  Selenium
    Click Button  //input[@name="search"]
    Sleep  5s
    ${response}=    GET  https://zh.wikipedia.org/wiki/Wikipedia:%E9%A6%96%E9%A1%B5  params=query=ciao  expected_status=200
    Should Be Equal As Strings    1  ${response.json()}[id]
    Close Browser
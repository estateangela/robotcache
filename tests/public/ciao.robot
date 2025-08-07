*** Settings ***
Library               SeleniumLibrary
Library               RequestsLibrary

*** Variables ***
${Url}    https://www.google.com/
${browser}    chrome

*** Test Cases ***
Quick Get Request Test
    Open Browser  ${Url}  ${browser}
    Input Text  //*[@id="APjFqb"]  ciao
    Click Button  //input[@type="submit"]
    Sleep  5s
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200
    Should Be Equal As Strings    1  ${response.json()}[id] 
    Close Browser
   


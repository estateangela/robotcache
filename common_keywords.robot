*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Common Current Link
    [Arguments]    ${expected_url}
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}

*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary          # 若要做 schema 驗證
Library           Collections
Variables         /Users/angelashi/Documents/GitHub/robotcache/resources/variables/PublicAPIVariables.robot


*** Keywords ***
Create Public Session
    [Documentation]    建立到 ${BASE_URL} 的 HTTP session
    Create Session    bitopro    ${BASE_URL}    headers=${DEFAULT_HEADERS}

Call Public GET
    [Arguments]    ${endpoint}    ${params}=None
    [Documentation]    呼叫 GET ${BASE_URL}${endpoint}，並回傳 response 物件
    ${resp}=    GET On Session    bitopro    ${endpoint}    params=${params}
    [Return]    ${resp}

Status Should Be
    [Arguments]    ${resp}    ${expected_status}=200
    [Documentation]    驗證 response status code
    Should Be Equal As Integers    ${resp.status_code}    ${expected_status}

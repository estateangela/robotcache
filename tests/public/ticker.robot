*** Settings ***
Resource          ../../resources/keywords/PublicAPIKeywords.robot
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Suite Setup       Create Public Session
Suite Teardown    Delete All Sessions
Library         SeleniumLibrary

*** Test Cases ***
取得單一交易對最新行情
    [Documentation]    測試 GET /ticker，q=BTC_TWD
    ${params}=    Create Dictionary    q=BTC_TWD
    ${resp}=      Call Public GET    /tickers    ${params}
    Status Should Be    ${resp}    200
    ${json}=      To Json    ${resp.content}
    Should Be Equal    ${json['symbol']}    BTC_TWD
    Should Be True     ${json['last']}>0

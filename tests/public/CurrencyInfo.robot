*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
*** Variables ***
${BASE_URL}       https://api.bitopro.com/v3
${HEADERS}        {"Content-Type": "application/json"}

*** Test Cases ***
取得所有 Provisioning Currencies 回應
    [Documentation]    呼叫 GET /provisioning/currencies，並取得全部回傳內容
    # 1. 建立到 API 的 session
    Create Session    bitopro    ${BASE_URL}    headers=${HEADERS}

    # 2. 送出 GET 請求
    ${response}=      GET On Session    bitopro    /provisioning/currencies

    # 4. 把回應 body 轉成 JSON 結構（新版寫法）
    ${all_data}=    Evaluate    ${response.json()}    response=${response}

    # 5. 檢查回傳結果包含至少一種常見幣別
    Dictionary Should Contain Key    ${all_data}    BTC
    Dictionary Should Contain Key    ${all_data}    USDT

    # 6. 印出整個物件到測試日誌（也會在 log.html 中看到）
    Log               全部回應資料：${all_data}
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://www.bitopro.com/ns/home
${BROWSER}        Chrome
${XPATH_BUTTON}   //button[contains(@class, 'ssc-1k07fow-1 cbnSms')]  # 更新XPath
${EXPECTED_TEXT}  bitopro小編

*** Test Cases ***
測試右下角物件點擊後的文字
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s  # 等待頁面加載

    # **確保按鈕出現在畫面上**
    Wait Until Element Is Visible    ${XPATH_BUTTON}    timeout=10s
    Scroll Element Into View         ${XPATH_BUTTON}
    Sleep    2s

    Click Element    ${XPATH_BUTTON}
    Sleep    2s

    ${page_source} =    Get Page Source
    Should Contain    ${page_source}    ${EXPECTED_TEXT}

    Close Browser

*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}            http://localhost:4723

# iOS App 的相關資訊
${PLATFORM_NAME}            iOS
${DEVICE_NAME}              iPhone SE (3rd generation)
${PLATFORM_VERSION}         18.3
${BUNDLE_ID}                com.apple.Preferences

*** Test Cases ***
成功開啟設定
    [Documentation]    使用 Appium 啟動一個 iOS 應用程式。
    Open App On Ios Device
    Log To Console    iOS App 已成功啟動！
點擊一般設定
    [Documentation]    點擊一般設定
    Click Element    accessibility_id=com.apple.settings.general
返回
    [Documentation]    返回
    Go Back
    Go Back
點擊輔助使用
    [Documentation]    點擊輔助使用
    Click Element    accessibility_id=com.apple.settings.accessibility
返回
    [Documentation]    返回
    Go Back


*** Keywords ***
Open App On Ios Device
   Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    bundleId=${BUNDLE_ID}
    ...    automationName=XCUITest
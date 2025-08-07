*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}            http://localhost:4723

# iOS App 的相關資訊 (請依您的 App 資訊修改)
${PLATFORM_NAME}            iOS
${DEVICE_NAME}              iPhone SE (3rd generation)
${PLATFORM_VERSION}         18.3
${BUNDLE_ID}                com.apple.mobilesafari

*** Test Cases ***
成功開啟 Safari 應用程式
    # 這是測試案例的名稱，描述其目的
    [Documentation]    使用 Appium 啟動一個 iOS 應用程式。
    Open App On Ios Device
    Log To Console    iOS App 已成功啟動！

*** Keywords ***
Open App On Ios Device
    # Open Application 關鍵字用於啟動 Appium 會話
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    bundleId=${BUNDLE_ID}
    ...    automationName=XCUITest   
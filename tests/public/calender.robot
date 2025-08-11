*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}            http://localhost:4723

# iOS App 的相關資訊
${PLATFORM_NAME}            iOS
${DEVICE_NAME}              iPhone SE (3rd generation)
${PLATFORM_VERSION}         18.3
${BUNDLE_ID}                com.apple.mobilecal

*** Test Cases ***
成功開啟 Calender 應用程式
    [Documentation]    使用 Appium 啟動一個 iOS 應用程式。
    Open App On Ios Device
    Log To Console    iOS App 已成功啟動！
建立新行程
    [Documentation]    建立新行程
    Add New Event
    Input Event Title    
Go To Home Screen
    [Documentation]    前往首頁
    Go To Home Screen


*** Keywords ***
Open App On Ios Device
   Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    bundleId=${BUNDLE_ID}
    ...    automationName=XCUITest
Add New Event
    Click Element    accessibility_id=add-plus-button
Input Event Title
    Click Element    accessibility_id=Title
    Input Text    accessibility_id=Title    test
    Click Element    accessibility_id=add-button
Go To Home Screen
    Terminate Application    ${BUNDLE_ID} 
    Click Element    accessibility_id=iconic-date-header-view
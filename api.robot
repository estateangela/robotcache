*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Test Cases ***
Verify GET Request
    Create Session    weather_api    https://www.metaweather.com    verify=true
    ${response}=    GET On Session    weather_api    /api/location/search/    params=query=london
    Status Should Be    200    ${response}
    ${location_type}=    Get Value From Json    ${response.json()}    $[0].location_type
    Should Contain    ${location_type[0]}    City
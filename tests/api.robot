*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Test Cases ***
Verify GET Request
    Create Session    weather_api    https://www.metaweather.com    verify=true
    ${response}=    GET On Session    weather_api    /api/location/search/    params=query=taiwan
    Status Should Be    200    ${response}
    ${location_type}=    Get Value From Json    ${response.json()}    $[0].location_type
    Should Contain    ${location_type[0]}    City
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    mysession    /secure-endpoint    headers=${headers}
    ${data}=    Create Dictionary    name=New Name    email=new@example.com
    ${response}=    PUT On Session    mysession    /users/123    json=${data}
    ${response}=    DELETE On Session    mysession    /users/123
    Status Should Be    204    ${response}

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:8085
${USERNAME}   admin
${PASSWORD}   password

*** Test Cases ***
Login Tests
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Run Keyword    Valid Login
    Run Keyword    Invalid Login
    Run Keyword    Empty Fields Validation

    Close Browser

*** Keywords ***
Valid Login
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    xpath=//button[text()='Login']
    Handle Alert    accept
    Sleep    2s  # Just to see the result

Invalid Login
    Input Text    id=username    wronguser
    Input Text    id=password    wrongpass
    Click Button    xpath=//button[text()='Login']
    Wait Until Element Is Visible    id=message    5s
    Sleep    2s

Empty Fields Validation
    Click Button    xpath=//button[text()='Login']
    Wait Until Element Is Visible    id=message    5s
    Sleep    2s

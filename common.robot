*** Settings ***
Library           OperatingSystem
Library           RPA.Desktop
Library           String

*** Keywords ***
Create new robot dir
    ${random_string}=    Generate Random String    chars=\[LOWER\]
    ${new_robot_dir}=    Set Variable    ${TEMPDIR}${/}generated-robot-${random_string}
    Create Directory    ${new_robot_dir}
    Wait Until Created    ${new_robot_dir}
    [Return]    ${new_robot_dir}

Open VS Code
    [Arguments]    ${dir}
    Run    code ${dir}
    Wait for text    Run a Command...

Wait for text
    [Arguments]    ${text}
    Wait For Element    ocr:"${text}"

Wait for text to disappear
    [Arguments]    ${text}
    Wait For Element    not ocr:"${text}"

Type and run
    [Arguments]    ${text}
    Type Text    ${text}
    Press Keys    enter

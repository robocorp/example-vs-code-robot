*** Settings ***
Documentation     Create and run a new robot using VS Code UI and keyboard
...               shortcuts. This robot is less brittle when compared to the
...               image locator based robot since visual UI changes will not
...               affect it.
Library           OperatingSystem
Library           RPA.Desktop
Library           RPA.Desktop.Windows
Library           String

*** Keywords ***
Create new robot dir
    ${random_string}=    Generate Random String    chars=\[LOWER\]
    ${new_robot_dir}=    Set Variable    %{USERPROFILE}${/}generated-robot-${random_string}
    Create Directory    ${new_robot_dir}
    Wait Until Created    ${new_robot_dir}
    [Return]    ${new_robot_dir}

Open VS Code
    [Arguments]    ${dir}
    Run    code ${dir}
    Wait for text    Run a Command...

Open Command Palette
    Press Keys    ctrl    shift    p

Create robot
    Type and run    robocorp-create-robot
    Wait for text    Update env
    Wait for text to disappear    Update env

Select standard template
    Wait for text    Standard
    Type and run    standard

Enter robot name
    Wait for text    Please provide the name
    Type and run    marias-robot
    Wait for text    Robot successfully created

Run robot
    Type and run    robocorp-run-robot

Type and run
    [Arguments]    ${text}
    Send Keys    ${text}
    Press Keys    enter

Wait for text
    [Arguments]    ${text}
    RPA.Desktop.Wait For Element    ocr:"${text}"

Wait for text to disappear
    [Arguments]    ${text}
    RPA.Desktop.Wait For Element    not ocr:"${text}"

*** Tasks ***
Create and run a new robot using VS Code UI and keyboard shortcuts
    ${new_robot_dir}=    Create new robot dir
    Open VS Code    ${new_robot_dir}
    Open Command Palette
    Create robot
    Select standard template
    Enter robot name
    Open Command Palette
    Run robot

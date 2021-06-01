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
    Sleep    3s

Open Command Palette
    Press Keys    ctrl    shift    p
    Sleep    1s

Create robot
    Type    robocorp-create-robot    5s

Select standard template
    Type    standard    1s

Enter robot name
    Type    marias-robot    1s

Run robot
    Type    robocorp-run-robot    1s

Type
    [Arguments]    ${text}    ${sleep}
    Send Keys    ${text}
    Press Keys    enter
    Sleep    ${sleep}

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

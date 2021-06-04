*** Settings ***
Documentation     Create and run a new robot using VS Code UI and image
...               locators. This robot works (for now), but is quite
...               brittle. For example, switching from dark to light theme in
...               VS Code UI would break the robot since it would not be able
...               to find the elements based on the screenshots.
Library           RPA.Desktop
Library           RPA.Desktop.Windows
Library           String
Task Setup        Setup

*** Variables ***
${NEW_ROBOT_DIR_PREFIX}=    generated-robot-

*** Keywords ***
Setup
    Set Default Timeout    30.0

Open VS Code
    RPA.Desktop.Windows.Open From Search    vscode    Getting Started - Visual Studio Code

Open folder
    Wait and click    alias:VSCode.OpenFolder

Create new folder
    Wait and click    alias:Windows.NewFolder
    Sleep    1s
    ${random_string}=    Generate Random String    chars=\[LOWER\]
    Type Text    ${NEW_ROBOT_DIR_PREFIX}
    Type Text    ${random_string}
    Press Keys    enter

Select folder
    Wait and click    alias:Windows.SelectFolder

Open Command Palette
    Wait and click    alias:VSCode.RunCommand

Create robot
    Type Text    Robocorp
    Wait and click    alias:VSCode.CreateRobotCommand

Select standard template
    Wait and click    alias:VSCode.StandardRobotTemplate

Enter robot name
    Type Text    marias-robot
    Press Keys    enter

Run robot
    Type Text    Robocorp
    Wait and click    alias:VSCode.RunRobotCommand

Wait and click
    [Arguments]    ${locator}
    RPA.Desktop.Wait For Element    ${locator}
    RPA.Desktop.Click    ${locator}

*** Tasks ***
Create and run a new robot using VS Code UI and image locators
    Open VS Code
    Open folder
    Create new folder
    Select folder
    Open Command Palette
    Create robot
    Select standard template
    Enter robot name
    Open Command Palette
    Run robot

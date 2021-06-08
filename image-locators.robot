*** Settings ***
Documentation     Create and run a new robot using VS Code UI and image
...               locators. This robot works (for now), but is quite
...               brittle. For example, switching from dark to light theme in
...               VS Code UI would break the robot since it would not be able
...               to find the elements based on the screenshots.
Resource          common.robot
Task Setup        Setup

*** Keywords ***
Setup
    Set Default Timeout    30.0

Open Command Palette
    Wait and click    alias:VSCode.RunCommand

Create robot
    Type Text    robocorp-create-robot
    Wait and click    alias:VSCode.CreateRobotCommand

Select standard template
    Wait for text    Standard
    Wait and click    alias:VSCode.StandardRobotTemplate

Enter robot name
    Wait for text    Please provide the name
    Type and run    marias-robot
    Wait for text    Robot successfully created

Run robot
    Type Text    robocorp-run-robot
    Wait and click    alias:VSCode.RunRobotCommand

Wait and click
    [Arguments]    ${locator}
    Wait For Element    ${locator}
    Click    ${locator}

*** Tasks ***
Create and run a new robot using VS Code UI and image locators
    ${new_robot_dir}=    Create new robot dir
    Open VS Code    ${new_robot_dir}
    Open Command Palette
    Create robot
    Select standard template
    Enter robot name
    Open Command Palette
    Run robot

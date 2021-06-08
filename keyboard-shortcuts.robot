*** Settings ***
Documentation     Create and run a new robot using VS Code UI and keyboard
...               shortcuts. This robot is less brittle when compared to the
...               image locator based robot since visual UI changes will not
...               affect it.
Resource          common.robot

*** Keywords ***
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

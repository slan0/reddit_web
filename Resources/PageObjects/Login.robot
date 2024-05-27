# This file contains locators and keywords of Reddit Login page
*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Keywords ***
Log in to Reddit
    [Documentation]    Log in to Reddit using username and password
    [Arguments]    ${username}   ${password}

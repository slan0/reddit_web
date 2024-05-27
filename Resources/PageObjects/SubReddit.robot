*** Comments ***
# This file contains locators and keywords of Sub-Reddit page


*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Obtain And Print Out The Most Top Post Title
    [Documentation]    Obtain And Print Out The Most Top Post Title

Vote For Post
    [Documentation]    Vote For Post - Upvote or Downvote
    [Arguments]    ${Upvote_Or_Downvote}

Verify the Vote is Counted
    [Documentation]    Verify the Vote is Counted once Voted

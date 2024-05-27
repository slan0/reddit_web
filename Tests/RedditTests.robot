*** Comments ***
# Instructions
 #This assignment will test your skills with test automation and your selected language
 #
 #Using a test automation framework, create a script (as complex or simple as you wish) to:
 #Open the website https://www.reddit.com/
 #Search for a subreddit called "gaming"
 #Open the sub-reddit
 #Print out the top most post's title
 #Perform a login
 #Downvote the second post if it's upvoted already, upvote otherwise (in case the second post is an advertisement or announcement, use the third)
 #After you finish, zip all your source code and email us back
 #Extra points for:
 #
 #Usage of BDD
 #Page-object pattern
 #Usage of good code standards
 #Documentation
 #Javascript/WebdriverIO (but remember, it's not necessary)
 #########


*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/PageObjects/Homepage.robot
Resource            ../Resources/PageObjects/SubReddit.robot
Resource            ../Resources/PageObjects/Login.robot
Resource            ../Resources/Helpers/Helper.robot
Variables           ../TestData/RedditTests.yml

Suite Setup         Run Keywords
...                     Open Browser    ${URL}    ${BROWSER}
...                     AND
...                     Maximize Browser Window
Suite Teardown      Close Browser


*** Variables ***
${URL}          https://www.reddit.com
${BROWSER}      Chrome


*** Test Cases ***
Scenario: As a user, I would like to be able to upvote or downvote a post
    Given I navigated to homepage
    And I accept cookies
    And I search for sub-reddit    ${Sub_Reddit}
    And I open the sub-reddit
    And I print out the top most post's title
    And I login to the website    ${Username}    ${Password}
    When I vote for the post
    Then I see my vote is counted


*** Keywords ***
I navigated to homepage
    Verify Navigation to Homepage

I accept cookies
    Handle Cookies Pop-up

I search for sub-reddit
    [Arguments]    ${sub_reddit}
    Search for Sub-reddit    ${sub_reddit}

I open the sub-reddit
    [Arguments]    ${sub_reddit}
    Open Sub-reddit   ${sub_reddit}

I print out the top most post's title
    Obtain And Print Out The Most Top Post Title

I login to the website
    [Arguments]    ${username}    ${password}
    Log in to Reddit    ${username}    ${password}

I vote for the post
    [Arguments]    ${upvote_or_downvote}
    Vote For Post    ${upvote_or_downvote}

I see my vote is counted
    Verify the Vote is Counted

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

Test Setup          Run Keywords
...                     Open Browser    ${URL}    ${BROWSER}
...                     AND
...                     Maximize Browser Window
Test Teardown       Close Browser


*** Variables ***
${URL}          https://www.reddit.com
${BROWSER}      Chrome


*** Test Cases ***
Scenario: As a user, I would like to be able to upvote or downvote a post on Reddit
    [Documentation]    This test case aims to: 1) find and open 'gaming' sub-reddit; 2) print out the most popular
    ...    post; 3) log in to reddit; downvote or upvote a post.
    ...    Username and Password: to be passed from terminal during test execution (please refer to the Readme.md file).
    ...    Test data such as sub-reddit name is passed from the test data file: RedditTests.yml
    ...    Note: The test lunches the browser, goes to the URL, verifies the homepage, accepts cookies, tries to perform
    ...    search for a sub-reddit (not working due to locator) and clicks on the Log in button. Please see comments below for
    ...    more details of what has and has not been automated.
    Given I am on the Reddit homepage
    And I accept cookies
# ----below keyword was implemented with the locator found (javascript). But the obtained locator
# ----from JS execution is not working in Selenium. Hence the test Fails.----#
    And I search for sub-reddit    ${Sub_Reddit}
# ----below KW has dependency on the previous KW hence was not implemented
#    And I open the sub-reddit
# ----below KW has dependency on the previous KW hence was not implemented----#
#    And I print out the top most post's title
# ----below KW has been partially implemented - it clicks on the Login page----#
    And I login to the website    ${Username}    ${Password}
# ----below KW has dependency on the previous KW hence was not implemented----#
#    When I vote for the post
# ----below KW has dependency on the previous KW hence was not implemented----#
#    Then I see my vote is counted


*** Keywords ***
I am on the Reddit homepage
    Verify Navigation to Homepage

I accept cookies
    Handle Cookies Pop-up

I search for sub-reddit
    [Arguments]    ${sub_reddit}
    Search for Sub-reddit    ${sub_reddit}

I open the sub-reddit
    [Arguments]    ${sub_reddit}
    Open Sub-reddit    ${sub_reddit}

I print out the top most post's title
    Obtain And Print Out The Most Top Post Title

I login to the website
    [Arguments]    ${username}    ${password}
    Navigate to Login page
###    The below KW was not implemented due to not found locator
#    Log in to Reddit    ${username}    ${password}

I vote for the post
    [Arguments]    ${upvote_or_downvote}
    Vote For Post    ${upvote_or_downvote}

I see my vote is counted
    Verify the Vote is Counted

**Comments***
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
Variables           ../TestData/RedditTests.yml

Suite Setup         Run Keywords
...                     Open Browser    ${URL}    ${BROWSER}
...                     AND
...                     Maximize Browser Window
Suite Teardown      Close Browser


*** Variables ***
${URL}                https://www.reddit.com
${BROWSER}            Chrome
${USERNAME}           your_username
${PASSWORD}           your_password

*** Test Cases ***
Scenario: As a user, I would like to be able to upvote or downvote a post
    Given I navigate to homepage
    And I accept cookies
    And I search for sub-reddit   ${sub_reddit_name}
##${sub_reddit_name}
#    And I open sub-reddit
#    And I print out the top most post's title
#    And I login to the website
#    When I vote for the post
#    Then I see my vote is counted

#    And I get dom of search


*** Keywords ***
I navigate to homepage
    [Documentation]    I navigate to homepage
    Wait until keyword succeeds    1s    5s
    ...    Title Should Be    ${page_title}
    Wait until element is visible    ${reddit_logo}    5s

I accept cookies
    [Documentation]    
    ${accept_all_button}=  Execute Javascript    return document.querySelector('reddit-cookie-banner').shadowRoot.querySelector('div > shreddit-interactable-element#accept-all-cookies-button > button')
    ${status}=   Run Keyword And Return Status
    ...    Element Should Be Visible    ${accept_all_button}
    IF   '${status}' == 'True'
        Click Element    ${accept_all_button}
    END


I search for sub-reddit
    [Arguments]    ${sub_reddit_name}
    Execute Javascript    (document.querySelector('reddit-search-large > form > faceplate-search-input').shadowRoot.querySelector('label > div > span.input-container')).click()
    ${search_field}=   Execute Javascript    return document.querySelector('reddit-search-large > form > faceplate-search-input').shadowRoot.querySelector('label > div > span.input-container > input')
    ${status}=   Run Keyword And Return Status
    ...    Element Should Be Visible    ${search_field}
    IF   '${status}' == 'True'
        Clear Element Text    ${search_field}
        Input Text    ${search_field}
        sleep  5s
        Capture Page Screenshot
    ELSE
        Fail      Locator cannot be found
    END

Scroll to Element
    [Arguments]    ${locator}
    ${x}=  Get Horizontal Position     ${locator}
    ${y}=  Get Vertical Position       ${locator}
    Execute Javascript    window.scrollTo(${x}, ${y})
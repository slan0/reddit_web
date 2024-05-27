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
Library             ../Resources/Helper.py
Resource            ../Resources/PageObjects/Homepage.robot

# Variables    ../TestData/Reddit.yml
Suite Setup         Run Keywords
...                     Open Browser   ${URL}   ${BROWSER}
...                     AND
...                     Maximize Browser Window
Suite Teardown      Close Browser


*** Variables ***
${URL}            https://www.reddit.com
${BROWSER}        Chrome
${USERNAME}       your_username
${PASSWORD}       your_password
${logo_element}   reddit-logo
${search_box}     input[name='q']


*** Test Cases ***
My test
  Given I navigate to homepage
  Get Shadow
#  And I get dom of search

*** Keywords ***
I navigate to homepage
  [Documentation]    I navigate to homepage
  Wait until keyword succeeds    1s    5s
  ...    Title Should Be    ${page_title}
  Wait until element is visible    ${logo_element}    5s

I get dom of logo
  ${reddit_logo_dom}= Get Dom Attribute   ${logo_element}   id
  Log to console   ${reddit_logo_dom}
  Wait until element is visible   ${reddit_logo_dom}   5s
  [Return]   ${reddit_logo_dom}

I get dom of search
# ${search_dom}= Get Dom Attribute    ${search_box}    css
# Log to console    ${search_dom}
# Click element    ${search_dom}
# [Return]    ${search_dom}

Get Shadow
   ${one}=   Evaluate    Get First Shadow()   modules=Helper
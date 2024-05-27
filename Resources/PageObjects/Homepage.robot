#This file contains locators and keywords of the Reddit Homepage

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${page_title}                    Reddit - Dive into anything
${reddit_logo}                   reddit-logo
${search_input_js}               document.querySelector('reddit-search-large > form > faceplate-search-input').shadowRoot.querySelector('label > div > span.input-container')
${accept_all_cookies_button_js}  return document.querySelector('reddit-cookie-banner').shadowRoot.querySelector('div > shreddit-interactable-element#accept-all-cookies-button > button')

*** Keywords ***
Verify Navigation to Homepage
    [Documentation]    Verify Navigation to Homepage
    Wait until keyword succeeds    1s    5s
    ...    Title Should Be    ${page_title}
    Wait until element is visible    ${reddit_logo}    5s

Handle Cookies Pop-up
    [Documentation]    Handle Cookies Pop-up by Accepting All cookies
    ${accept_all_cookies_button}=    Execute Javascript
    ...    ${accept_all_cookies_button_js}
    ${status}=    Run Keyword And Return Status
    ...    Element Should Be Visible   ${accept_all_cookies_button}
    IF    '${status}' == 'True'    
        ...    Click Element    ${accept_all_cookies_button}

Search for Sub-reddit
    [Documentation]    Search for sub-reddit. Specify sub-reddit name as an argument.
    [Arguments]    ${sub_reddit_name}
    ${search_field}=    Execute Javascript    return ${search_input_js}
    Wait Until Element Is Visible    ${search_field}    5s
    Clear Element Text    ${search_field}
    Input Text    ${search_field}
    Capture Page Screenshot

Open Sub-reddit
    [Documentation]    Open the sub-reddit from the search results dropdown
    [Arguments]    ${sub_reddit_name}

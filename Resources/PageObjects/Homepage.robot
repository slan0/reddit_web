*** Comments ***
# This file contains locators and keywords of the Reddit Homepage


*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${page_title}                       Reddit - Dive into anything
${reddit_logo}                      reddit-logo
${search_input_js}                  document.querySelector('reddit-search-large > form > faceplate-search-input').shadowRoot.querySelector('label > div > span.input-container > input')
${accept_all_cookies_button_js}     document.querySelector('reddit-cookie-banner').shadowRoot.querySelector('div > shreddit-interactable-element#accept-all-cookies-button > button')
${login_button_js}                  document.querySelector('reddit-header-action-items > header > nav > div.justify-end > span > faceplate-tracker > faceplate-tooltip > a#login-button')


*** Keywords ***
Verify Navigation to Homepage
    [Documentation]    Verify Navigation to Homepage
    Wait until keyword succeeds    1s    3s
    ...    Title Should Be    ${page_title}
    Wait until element is visible    ${reddit_logo}    timeout=2s

Handle Cookies Pop-up
    [Documentation]    Handle Cookies Pop-up by Accepting All cookies
    ${accept_all_cookies_button}=    Execute Javascript
    ...    return ${accept_all_cookies_button_js}
    ${status}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${accept_all_cookies_button}
    IF    '${status}' == 'True'    Click Element    ${accept_all_cookies_button}

Search for Sub-reddit
    [Documentation]    Search for sub-reddit. Specify sub-reddit name as an argument.
    [Arguments]    ${sub_reddit_name}
    ${search_field}=    Execute Javascript    return ${search_input_js}
    ${status}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${search_field}
    IF    '${status}' == 'True'
        Clear Element Text    ${search_field}
        Input Text    ${search_field}
        Capture Page Screenshot
    ELSE
        Fail    Search Field Not Found
    END

Open Sub-reddit
    [Documentation]    Open the sub-reddit from the search results dropdown
    [Arguments]    ${sub_reddit_name}

Navigate to Login page
    [Documentation]    Click on Log in button from Homepage
    ${log_in_button}=    Execute Javascript    return ${login_button_js}
    Wait Until Element Is Visible    ${log_in_button}    timeout=2s
    Click Element    ${log_in_button}

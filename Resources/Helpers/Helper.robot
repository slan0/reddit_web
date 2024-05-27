*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Scroll to Element
    [Documentation]    This is to get the element into view by executing the javascript
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo(${x}, ${y})

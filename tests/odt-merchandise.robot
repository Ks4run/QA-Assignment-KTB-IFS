*** Settings ***
Library    Browser

*** Variables ***
${URL}           https://merchandise-dev.odds.team/
${BROWSER}       chromium

*** Test Cases ***
Login Merchandise ODDS Success
    New Browser    browser=${BROWSER}    headless=False
    New Page       ${URL}
    Fill Text      id=login-field    customer1
    Fill Text      id=password-field    password
    Click    id=submit-button    left
    Press Keys    Enter
    Wait For Elements State    id=shop-title    visible
    Get Text    id=shop-title    contains    ODT x merchandise
    Wait For Response    https://merchandise-dev.odds.team/api/products?page=1
    Sleep    1s
    Take Screenshot
*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://automationexercise.com    chrome
Suite Teardown    Close Browser

*** Variables ***
${PRODUCT_NAME}   Top
${LOGIN_DETAILS}  username=yourusername,password=yourpassword
${URL_TEST}  http://automationexercise.com/cart
${PRODUCT_ID}     1

*** Test Cases ***
Test Ecommerce Website
    Go To    http://automationexercise.com
    Click Element    css=.card_travel
    Wait Until Page Contains    All Products
    Page Should Contain    All Products
    Input Text    id=search_product    ${PRODUCT_NAME}
    Click Button    id=submit_search
    Page Should Contain    Searched Products 
    # Assuming there's an add to cart button with class 'add-to-cart'
    #Click Element    css=.add-to-cart
    Click Element    css=a[data-product-id='${PRODUCT_ID}']
    Page Should Contain    ${PRODUCT_NAME}


    Click Element    id=menu-item-signup-login
    Input Text    id=username    ${LOGIN_DETAILS}[username]
    
    Click Link    View Cart
    Click Link    Proceed To Checkout


    Input Text    id=password    ${LOGIN_DETAILS}[password]
    Click Button    id=login-button
    Go To    ${URL_TEST}
    Page Should Contain    ${PRODUCT_NAME}

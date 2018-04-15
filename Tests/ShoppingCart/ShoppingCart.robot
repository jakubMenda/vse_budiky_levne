*** Settings ***
Library    Selenium2Library
Resource    ../../Keywords/BrowserKeywords.txt
Resource    ../../Keywords/BudikyKeywords.txt
Resource    ../../Settings/BudikySettings.txt
Resource    ../../Objects/BudikyObjects.txt
Test setup    Open Browser And Maximize Window    ${browser}    ${url}
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
Add the Product To the Shopping Cart
    Add Product And Go To Cart
        
Change Quantity Of a Product
    Add Product And Go To Cart
    Page Should Contain Element    ${quantityInputOnePiece}
    Click On Change Quantity Icon    ${quantityAddButtonClassName}    ${quantityInputTwoPieces}    ${twoProductsCartIcon} 
    Click On Change Quantity Icon    ${quantityRemoveButtonClassName}    ${quantityInputOnePiece}    ${oneProductCartIcon}            
    
Remove Product From Shopping Cart
    Add Product And Go To Cart
    Click Element    ${deleteProductButton}
    Page Should Contain    ${noProductsMsg}   
    
Go From Shopping Cart Back To Catalogue
    Add Product And Go To Cart
    Click Element    ${continueShoppingLink}
    Wait Until Page Contains Element    ${productDetailHeadingClassName} 
    
Go From Shopping Cart To Checkout
    Go To Checkout
       
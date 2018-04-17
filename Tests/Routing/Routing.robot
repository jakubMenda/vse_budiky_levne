*** Settings ***
Library    Selenium2Library
Resource    ../../Keywords/BrowserKeywords.txt
Resource    ../../Keywords/BudikyKeywords.txt
Resource    ../../Settings/BudikySettings.txt
Resource    ../../Objects/BudikyObjects.txt
Test setup    Open Browser And Maximize Window    ${browser}    ${url}
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
Check The Homepage 
    Wait Until Page Contains Element    ${filterSectionClassName}
    Page Should Contain Element    ${catalogueClassName}
    Page Should Contain Element    ${catalogueItemClassName}
    Page Should Contain Element    ${footerClassName}
    Page Should Contain    ${privacyPolicyText}
    Page Should Contain    ${termsText}
    Page Should Contain    ${aboutUsText}
    Page Should Contain    ${contactText}
    
Go To About Us
    Navigate Via Link    ${aboutUsLink}    ${aboutUsUrl}
    Page Should Contain    ${aboutUsHeading}  
    
Go To Contact
    Navigate Via Link    ${contactLink}    ${contactUrl} 
    Page Should Contain    ${contactHeading}  
    
Go To the Shopping Cart
    Go To the Shopping Cart  
    
Go To the Terms
    Navigate Via Link    ${termsLink}    ${termsUrl} 
    Page Should Contain    ${termsHeading}  
    
Go Back To Homepage
    Navigate Via Link    ${aboutUsLink}    ${aboutUsUrl}
    Navigate Via Link    ${clickableLogo}    ${url}
    Wait Until Page Contains Element    ${filterSectionClassName}
    Page Should Contain Element    ${catalogueClassName}
    
Go To the Privacy Policy
    Navigate Via Link    ${privacyPolicyLink}    ${privacyPolicyUrl} 
    Page Should Contain    ${privacyPolicyHeading}  
    
Go To Non Existent Page
    Go To    ${nonExistentUrl}
    Location Should Be    ${nonExistentUrl}
    Page Should Contain    ${NotFoundHeading}
    
Go To Product Detail
    Go To Product Detail
        
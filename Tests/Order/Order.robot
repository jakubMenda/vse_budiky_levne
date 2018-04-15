*** Settings ***
Library    Selenium2Library    implicit_wait=10
Resource    ../../Keywords/BrowserKeywords.txt
Resource    ../../Keywords/BudikyKeywords.txt
Resource    ../../Settings/BudikySettings.txt
Resource    ../../Objects/BudikyObjects.txt
Test setup    Open Browser And Maximize Window    ${browser}    ${url}
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***    
Buy As Company Inputs Visible
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Company Shopping
    Page Should Contain Element    ${billingIcInput}    
    Page Should Contain Element    ${billingDicInput} 
    
Cant Submit With Required Fields Left Blank
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Company Shopping
    Click Element    ${submitNextButton}
    Page Should Contain Element    ${billingFirstNameInput}
    Page Should Contain Element    ${billingStreetInput}
    Page Should Contain Element    ${billingCityInput}
    Page Should Contain Element    ${billingZipInput}
    Page Should Contain Element    ${billingCountrySelect}
    Page Should Contain Element    ${emailInput}
    Page Should Contain Element    ${phoneInput}
    Page Should Contain Element    ${billingIcInput}    
    Page Should Contain Element    ${billingDicInput}
    
Select Personal Order Collection
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Submit The Address
    Select Radio Button    ${shippingMethodRadioGroup}    ${personalCollectionRadioValue}
    Wait Until Page Contains Element    ${shopAddressClassName}    
    
Select Czech Postal Office
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Submit The Address
    Select Radio Button    ${shippingMethodRadioGroup}    ${czechPostalOfficeRadioValue}
    Wait Until Page Contains    ${shippingPriceLabel}
    Wait Until Page Contains Element    ${anotherAddressLink}
    
Go For Cash On Delivery
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    
Go For Bank Transfer
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${bankTransferRadioValue}    ${bankTransferLabel}
    
Try To Submit Without Accepting the Terms
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    Click Element    ${submitConfirm}
    Wait Until Element Is Visible    ${checkoutConfirmContainer}
    Page Should Contain Element    ${termsCheckbox}
    
Change Address Before Submitting
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    Wait Until Element Is Visible    ${addressEditLink}
    Click Element    ${addressEditLink}
    Wait Until Element Is Visible    ${billingFirstNameInput}   
    Page Should Contain Element    ${billingStreetInput}
    Page Should Contain Element    ${billingCityInput}
    Page Should Contain Element    ${billingZipInput}
    Page Should Contain Element    ${billingCountrySelect}
    Page Should Contain Element    ${emailInput}
    Page Should Contain Element    ${phoneInput}    
    
Change Shipping Method Before Submitting
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    Wait Until Element Is Visible    ${shippingEditLink}
    Click Element    ${shippingEditLink}
    Wait Until Element Is Visible    ${checkoutShippingContainer}   
    
Change Payment Method Before Submitting
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    Wait Until Element Is Visible    ${paymentMethodEditLink}
    Click Element    ${paymentMethodEditLink}
    Wait Until Element Is Visible    ${checkoutPaymentContainer} 

Submit the Order
    [Setup]    Run Keyword    Open Browser And Maximize Window    ${browser}    ${url}
    And Go To Checkout 
    Select Payment Method    ${cashOnDeliveryRadioValue}    ${cashOnDeliveryLabel}
    Wait Until Page Contains    ${customerEmail}  
    Page Should Contain    ${personalCollectionLabel}
    Page Should Contain    ${bankTransferLabel}
    Sleep    2
    Select Checkbox    ${termsCheckbox}
    Click Element    ${submitConfirm}
    Wait Until Page Does Not Contain    ${customerEmail}  
    Location Should Be    ${orderCompleteUrl}
    
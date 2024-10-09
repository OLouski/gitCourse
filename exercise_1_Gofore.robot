*** Settings ***
Documentation               Test automation onboarding technical exercises to learn QWeb
...                         Exercise 1: Gofore
Resource                    ${CURDIR}${/}..${/}Resources${/}keywords.resource
Suite Setup                 Open Browser  ${URL_GOFORE}  chrome
Suite Teardown              Close All Browsers

*** Test Cases ***
1. Read more about the hot topic (ClickText, VerifyText, LogScreenshot)
    [Tags]                  1-1
    Appstate                Gofore_Front_Page
    VerifyText              Pioneering an Ethical Digital World
    ClickText               Intelligent Industry
    VerifyText              The new era of industry is 
    LogScreenShot           screenshot.png

2. Read more about the customer case (ClickText, VerifyText, VerifyNoText)
    [Tags]                  1-2
    ClickText               Cases
    VerifyText              View case study
    ClickText               View case study
    VerifyNoText            View case study

3. Exploring customer case via logo (ScrollText, VerifyAll)
    [Tags]                  1-3
    ClickText               Gofore
    ScrollText              Read more about Gofore
    VerifyAll               Offices around Europe, Goforeans, Years in business, MEUR Net sales

4. Social media is all over (ClickItem, ScrollText, VerifyUrl)
    [Tags]                  1-4
    ScrollText              Social media
    ClickItem               X
    VerifyText              Sign in to X     timeout=15
    ClickItem               Close
    VerifyUrl               https://x.com/

5. Sharing is caring (ClickElement, GetAttribute)
    [Tags]                  1-5
    Appstate                Gofore_Posts_Page
    ClickText               View all posts
    VerifyText              Great people tell great stories
    ClickElement            //*[@id\="gofore-crew"]
    ${attribute_value}      GetAttribute      //*[@id\="gofore-crew"]           aria-selected
    VerifyInputValue        ${attribute_value}      true       
    VerifyElement           //button[@aria-selected\="true" and contains(text(),"Gofore Crew")]
    
    ${url}                  GetAttribute            //*[@id\="gofore-crew-tab"]/div[1]/div[1]/a     href
    ClickElement            //*[@id\="gofore-crew-tab"]/div[1]/div[1]/a
    VerifyUrl               ${url}

#    ClickText               On Linkedin             2
    Click Element           //*[@id\="page"]/div[2]/main/section[2]/div/div[1]/div[3]/ul/li[1]/a

#    VerifyText              Stay updated on your professional world.     timeout=15
    Verify Text             LinkedIn         timeout=15
  


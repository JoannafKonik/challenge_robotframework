*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en/login
${REMIND PASSWORD URL}      https://scouts-test.futbolkolektyw.pl/en/remind
${DASHBOARD URL}        https://scouts-test.futbolkolektyw.pl/en
${ADDPLAYER URL}        https://scouts-test.futbolkolektyw.pl/en/players/add
${BROWSER}          Chrome
${LOGIN FIELD}      xpath=//*[@id='login']
${PASSWORD FIELD}       xpath=//*[@id='password']
${EMAIL FIELD}      xpath=//*[@name='email']
${SIGNIN BUTTON}        xpath=//button[@type='submit']
${SIGNOUT BUTTON}       xpath=//*[text()='Sign out']
${PANEL LOGO}       xpath=//*[@title='Logo Scouts Panel']
${SCOUTSPANEL LABEL}        xpath=//*[text()='Scouts Panel']
${PLAYERS LABEL}        xpath=//*[text()='Players']
${ADDED PLAYER SNACKBAR}      xpath=//*[contains(@class, 'Toastify__toast Toastify__toast--success')]
${REMIND PASSWORD LINK}     xpath=//*[text()='Remind password']
${SEND BUTTON}      xpath=//*[@type='submit']
${MESSAGE SNACKBAR}     xpath=//*[contains(@class, 'Toastify__toast-container Toastify__toast-container--top-right')]
${ADD PLAYER BUTTON}        xpath=//*[text()='Add player']
${PLAYER EMAIL FIELD}       xpath=//*[@name='email']
${NAME FIELD}       xpath=//*[@name='name']
${SURNAME FIELD}        xpath=//*[@name='surname']
${PHONE FIELD}      xpath=//*[@name='phone']
${WEIGHT FIELD}     xpath=//*[@name='weight']
${HEIGHT FIELD}     xpath=//*[@name='height']
${CLUB FIELD}       xpath=//*[@name='club']
${LEVEL FIELD}      xpath=//*[@name='level']
${AGE FIELD}        xpath=//*[@name='age']
${MAIN POSITION}        xpath=//*[@name='mainPosition']
${SECOND POSITION}      xpath=//*[@name='secondPosition']
${ACHIEVEMENTS FIELD}       xpath=//*[@name='achievements']
${DISTRICT BUTTON}      xpath=//*[@id='mui-component-select-district']
${NAME DISTRICT}        xpath=//*[@id='menu-district']/div[3]/ul/li[15]
${LEG BUTTON}       xpath=//*[@id='mui-component-select-leg']
${LEFT LEG}     xpath=//*[@id='menu-leg']/div[3]/ul/li[2]
${RIGHT LEG}        xpath=//*[@id='menu-leg']/div[3]/ul/li[1]
${ADD LANGUAGE BUTTON}      xpath=//*[@id='__next']/div[1]/main/div[2]/form/div[2]/div/div[15]/button
${FIRST LANGUAGE FIELD}     xpath=//*[@name='languages[0]']
${SECOND LANGUAGE FIELD}        xpath=//*[@name='languages[1]']
${SUBMIT BUTTON}        xpath=//button[@type='submit']
${CLEAR BUTTON}     xpath=//*[@id='__next']/div[1]/main/div[2]/form/div[3]/button[2]
${REQUIRED FIELD}       xpath=//*[@class='MuiFormHelperText-root Mui-error Mui-required']

*** Test Cases ***
LOGIN TO THE SCOUTS PANEL
    Open Login page
    Type In Login
    Type In Password Valid
    Click On The Sign In Button
    Assert Dashboard
    [Teardown]    Close Browser

LOGIN TO THE SCOUTS PANEL WITH INVALID PASSWORD
    Open Login Page
    Type In Login
    Type In Password Invalid
    Click On The Sign In Button
    Assert Login Page
    [Teardown]    Close Browser

REMIND PASSWORD
    Open Login Page
    Click On The Remind Password Link
    Open Remind Password Page
    Type In Email
    Click On The Send Button
    Assert Remind Password Page
    [Teardown]    Close Browser

LOGOUT OF THE SCOUTS PANEL
    Open Login page
    Type In Login
    Type In Password Valid
    Click On The Sign In Button
    Open Dashboard Page
    Click On The Sign out Button
    Assert Login Page
    [Teardown]    Close Browser

ADD NEW PLAYER - SUBMIT
    Open Login Page
    Type In Login
    Type In Password Valid
    Click On The Sign In Button
    Open Dashboard Page
    Click On The Add Player Button
    Open Addplayer Page
    Type In Player Email
    Type In Name
    Type In Surname
    Type In Phone
    Type In Weight
    Type in Height
    Type In Age
    Click On The Leg Button
    Click On The Left Leg
    Type In Club
    Type In Level
    Type In Main Position
    Type In Second Position
    Click On The District Button
    Click On The Name District
    Type In Achievements
    Click On The Add Language Button
    Type In First Language
    Click On The Submit Button
    Assert Addedplayer Snackbar
    [Teardown]    Close Browser

ADD NEW PLAYER - CLEAR FORM
    Open Login Page
    Type In Login
    Type In Password Valid
    Click On The Sign In Button
    Open Dashboard Page
    Click On The Add Player Button
    Open Addplayer Page
    Type In Player Email
    Type In Name
    Type In Surname
    Type In Phone
    Type In Weight
    Type in Height
    Type In Age
    Click On The Leg Button
    Click On The Right Leg
    Type In Club
    Type In Level
    Type In Main Position
    Type In Second Position
    Click On The District Button
    Click On The Name District
    Type In Achievements
    Click On The Add Language Button
    Type In First Language
    Click On The Add Language Button
    Type In Second Language
    Click On The Clear Button
    Assert Required Field
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}        ${BROWSER}
    Title Should Be    Scouts panel - sign in
Open remind password page
    Open Browser    ${REMIND PASSWORD URL}      ${BROWSER}
    Title Should Be     Remind password
Open dashboard page
    Wait Until Element Is Visible    ${PANEL LOGO}
Open addplayer page
    Wait Until Element Is Visible    ${PLAYER EMAIL FIELD}
Type in login
    Input Text    ${LOGIN FIELD}        user09@getnada.com
Type in password valid
    Input Text    ${PASSWORD FIELD}     Test-1234
Type in password invalid
    Input Text    ${PASSWORD FIELD}     Test
Type in email
    Input Text    ${EMAIL FIELD}        johnny@challenge.com
Type in player email
    Input Text    ${PLAYER EMAIL FIELD}     johnny@challenge.com
Type in name
    Input Text    ${NAME FIELD}     Johnny
Type in surname
    Input Text    ${SURNAME FIELD}      TheBest
Type in phone
    Input Text    ${PHONE FIELD}        909707505
Type in weight
    Input Text    ${WEIGHT FIELD}       189
Type in height
    Input Text    ${HEIGHT FIELD}       83
Type in age
    Input Text    ${AGE FIELD}      15112001
Type in Club
    Input Text    ${CLUB FIELD}     Manchester
Type in level
    Input Text    ${LEVEL FIELD}        Advance
Type in main position
    Input Text    ${MAIN POSITION}      Goalkeeper
Type in second position
    Input Text    ${SECOND POSITION}        Defender
Type in achievements
    Input Text    ${ACHIEVEMENTS FIELD}     World Champion
Type in first language
    Input Text    ${FIRST LANGUAGE FIELD}       English
Type in second language
    Input Text    ${SECOND LANGUAGE FIELD}      Japanese
Click on the sign in button
    Click Element    ${SIGNIN BUTTON}
Click on the remind password link
    Click Element    ${REMIND PASSWORD LINK}
Click on the send button
    Click Element    ${SEND BUTTON}
Click on the sign out button
    Click Element    ${SIGNOUT BUTTON}
Click on the add player button
    Click Element    ${ADD PLAYER BUTTON}
Click on the submit button
    Click Element    ${SUBMIT BUTTON}
Click on the leg button
    Click Element    ${LEG BUTTON}
Click on the left leg
    Click Element    ${LEFT LEG}
Click on the right leg
    Click Element    ${RIGHT LEG}
Click on the district button
    Click Element    ${DISTRICT BUTTON}
Click on the name district
    Click Element    ${NAME DISTRICT}
Click on the add language button
    Click Element    ${ADD LANGUAGE BUTTON}
Click on the clear button
    Click Element    ${CLEAR BUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PANEL LOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Assert login page
    Wait Until Element Is Visible    ${SCOUTSPANEL LABEL}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    alert.png
Assert remind password page
    Wait Until Element Is Visible    ${MESSAGE SNACKBAR}
    Title Should Be    Remind password
    Capture Page Screenshot    alert.png
Assert addplayer page
    Wait Until Element Is Visible    ${PLAYERS LABEL}
    Capture Page Screenshot    alert.png
Assert addedplayer snackbar
    Wait Until Element Is Visible    ${ADDED PLAYER SNACKBAR}
    Capture Page Screenshot    alert.png
Assert required field
    Wait Until Element Is Visible    ${REQUIRED FIELD}
    Capture Page Screenshot    alert.png

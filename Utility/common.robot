*** Keywords ***
display status code
    [Arguments]             ${resp}
    log to console          ${resp.status_code}

display response in json
    [Arguments]             ${resp}
    log to console          ${resp.json()}

display response body
    [Arguments]             ${resp}
    log to console          ${resp}

display variable
    [Arguments]             ${variable}
    log to console          ${variable}

add to reports
    [Arguments]             ${result}
    log                     ${result}


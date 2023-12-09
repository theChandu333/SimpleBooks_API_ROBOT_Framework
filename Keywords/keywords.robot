*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Resource        ../Utility/imports.robot
Resource        ../Utility/common.robot


*** Keywords ***
Authenticate
    [Arguments]                     ${name}                   ${mail}
    ${headers}                      create dictionary         Content-Type=application/json
    ${body}                         create dictionary         clientName=${name}              clientEmail=${mail}
    ${response}                     POST                      url=${url}${auth}               json=${body}  headers=${headers}
    ${token_list}                   get value from json       ${response.json()}              $[accessToken]
    ${token}                        set variable              ${token_list[0]}
    set suite variable              ${token}



GetStatus
    ${response}                     GET                       url=${url}${get_status}
    display status code             ${response}
    display response in json        ${response}



GetBooks
    ${response}                     GET                       url=${url}${get_all_books}
    display status code             ${response}
    display response in json        ${response}



GetSingleBook
    [Arguments]                     ${bookid}
    ${response}                     GET                       url=${url}${get_a_book}${bookid}
    display status code             ${response}
    display response in json        ${response}



SubmitAnOrder
    [Arguments]                     ${book_id}                ${customer_name}
    ${body}                         create dictionary         bookId=${book_id}                 customerName=${customer_name}
    ${headers}                      create dictionary         Authorization=Bearer ${token}     Content-Type=application/json
    ${response}                     POST                      url=${url}${submit_order}         json=${body}    headers=${headers}
    ${orderId_list}                 get value from json       ${response.json()}                $[orderId]
    ${orderid}                      set variable              ${orderId_list[0]}
    set suite variable              ${orderid}


GetAllOrders
    ${headers}                      create dictionary         Authorization=Bearer ${token}
    ${response}                     GET                       url=${url}${get_all_oredrs}       headers=${headers}
    display status code             ${response}
    display response in json        ${response}



GetAnOrder
    ${headers}                      create dictionary         Authorization=Bearer ${token}
    ${response}                     GET                       url=${url}${get_an_order}${orderid}       headers=${headers}
    display status code             ${response}
    display response in json        ${response}



UpdateAnOrder
    [Arguments]                     ${customerName}
    ${body}                         create dictionary         customerName=${customerName}
    ${headers}                      create dictionary         Authorization=Bearer ${token}             Content-Type=application/json
    ${response}                     PATCH                     url=${url}${update_an_order}${orderid}    json=${body}    headers=${headers}
    display status code             ${response}
    display response body           ${response}


Delete an order
    ${headers}                      create dictionary         Authorization=Bearer ${token}
    ${response}                     DELETE                    url=${url}${delete_order}${orderid}      headers=${headers}
    display status code             ${response}
    display response body           ${response}
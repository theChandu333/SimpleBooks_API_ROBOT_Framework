*** Settings ***
Resource                ../Utility/imports.robot
Suite Setup             Authenticate        ${Name}      ${Email}

*** Test Cases ***
Books
    [Tags]              smoke
    GetStatus
    GetBooks
    GetSingleBook       ${book_id}

Orders
    [Tags]              sanity
    SubmitAnOrder       ${fav_book}     ${customer}
    GetAllOrders
    GetAnOrder
    UpdateAnOrder       ${update_user_name}
    GetAnOrder
    Delete an order

# the model view Controller MVC Pattern
GET /about HTTP/1.1
Host: 127.0.0.1
(what the line above said is GET for "/about" for me)

## Routes
Matches the URL that we requested

in other word if you requested for GET "/about" it be like i see you requested for "/about", we'll give you to the AboutController to handle.

## Models
Data Wrappers

User
* query records
* wrap individual records

in other words its interacting with our database and table together


## Views
the response Body content, it could be
* HTMl 
* PDF
* CSV
* XML


## Controllers
Decide how to process a request and define a responese

# Drais Sample Aplication

This is a sample application that demonstrate the usage of the framework Drails. It is composed by two parts:

* Client Application
* Server Application

you can see it in action on: http://drails-sample-app.herokuapp.com/

## Client Application
The client application was created using Polymer framework. This is a Single Page Application that retrieve data from the server. This data is composed by three models:

* Person
* Employee
* User

The server responds with JSON data corresponding those models.

The application contains two menus, one for Person and one for Employee. Employee menu can be accessed by Admin users (`username: jhon` and `password: jhon`) and public users (`username: jake` and `password: jake`). Only Admin users can update and insert Employees.

## Server Application
The server side application is a web-service that only responds with JSON data corresponding to the previous mentioned models.

The application Contains two controllers:

* EmployeesController: in charge of responding Employees JSON data and check authorization and authentication for Public and Admin Users
* PersonsController: in charge of responding Persons JSON data (this controller doesn't have security logic).

The server side application also contains two principal proxy methods:

### Login
This is executed through a POST request that contains an user JSON object as body

```JSON
{"username": "jhon", "password":"jhon"}
```

Once the server receive this information, it creates a session and send back public user information (username and roles, password should never be sent back to client). Once the client receive this information, it should save it locally (in this case is saved as sessionStorage variable in JSON format).

### Logout
This is executed through a GET request without any optional parameters.

Once the server receive this request, it delete the session and responds with Http.OK and empty body. The client should be responsible for further actions (in this case shows again the login form)

## Shared Libraries
In this application models are shared between server and client side applications. By the moment validation logic has not been added to Drails. However in the futere validation is going to be shared between the server and the client.
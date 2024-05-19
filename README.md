# task_manager_app

Test Project: Task Manager App
Overview:
Build a task manager app using Flutter that allows users to manage their tasks efficiently. The
app should have a clean and intuitive user interface, robust state management, seamless
performance, local storage for persistent data, and comprehensive unit tests to ensure
functionality.

Key Features:

1. User Authentication: Implement user authentication using the https://dummyjson.com/docs/auth.
   Users should be able to log in securely with their Username and Password.
2. Task Management: Allow users to view, add, edit, and delete tasks.
   Use https://dummyjson.com/docs/todos for managing task data.
3. Pagination: Implement pagination for fetching a large number of tasks efficiently. Utilize
   the https://dummyjson.com/todos?limit=10&skip=10 endpoint for pagination as mentioned in the docs
   in the previous point.
4. State Management: Implement state management using one of the following patterns:
   Provider, Bloc, or Redux. Ensure that state is managed efficiently and updated across
   the app as needed.
5. Local Storage: Persist tasks locally using Flutter's shared preferences or SQLite
   database. Ensure that tasks remain accessible even when the app is closed and
   reopened.
6. Unit Tests: Write comprehensive unit tests to cover critical functionalities such as task
   CRUD operations, input validation, state management, and network requests. Use mock
   responses for testing against reqres.in endpoints.

Challenges :

1. i do not have specific UI so it take me some time to decide what the UI i should use (in
   companies it is UI/UX job).

App notes :

1. I used flutter sdk version 3.19.5
2. I add some simple animations.
3. I used cubit as StateManagement.
4. I used (sqflite) as local storage.
5. I can not edit or delete on the data in the API (I can not delete note from API database).
6. I add edit, insert, delete, read from the local database.
7. If there is net connection it will get the data from API.
8. If there is not net connection it will get the data from local database.
9. For testing code for myself i usually use print and Debug mostly on debug.
10. The username and password in auth can not be change if you change theme than restart the app.
11. If you want to test my code from syria you must use VPN.

MUST READ :

1. I made the app as i understand from the requests you ask but if there is something that is not as
   what you want that mean i did not get what you want so you can free contact my (
   knakri02@gmail.com) and i can do it for you.




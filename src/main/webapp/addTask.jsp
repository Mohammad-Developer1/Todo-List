<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2c2c2c;
            margin: 0;
            padding: 0;
            color: #f8f8f8;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #3a3a3a;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            color: #f8f8f8;
        }
        h1 {
            text-align: center;
            color: #f1c40f;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #f8f8f8;
        }
        input[type="text"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #f1c40f;
            border-radius: 4px;
            background-color: #2c2c2c;
            color: #f8f8f8;
        }
        input[type="text"]::placeholder {
            color: #cccccc;
        }
        button {
            background-color: #f1c40f;
            color: #2c2c2c;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #d4ac0d;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            color: #f1c40f;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
            color: #d4ac0d;
        }
        .success-message {
            margin-top: 15px;
            color: #27ae60;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add a New Task</h1>
    <form action="addTask.jsp" method="post">
        <label for="task">Task:</label>
        <input type="text" name="task" id="task" placeholder="Enter your task here" required>
        <button type="submit">Add Task</button>
    </form>
    <a href="viewTasks.jsp">View All Tasks</a>

    <%
        String newTask = request.getParameter("task");
        if (newTask != null && !newTask.trim().isEmpty()) {
            java.util.List<String> tasks = (java.util.List<String>) session.getAttribute("tasks");
            if (tasks == null) {
                tasks = new java.util.ArrayList<>();
                session.setAttribute("tasks", tasks);
            }
            tasks.add(newTask);
    %>
    <p class="success-message">Task added successfully!</p>
    <%
        }
    %>
</div>
</body>
</html>

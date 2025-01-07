<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin-bottom: 10px;
            background: #f1c40f;
            color: #2c2c2c;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #c0392b;
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
        .no-tasks {
            text-align: center;
            color: #f8f8f8;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Your Tasks</h1>
    <a href="addTask.jsp">Add New Task</a>
    <br><br>
    <%
        java.util.List<String> tasks = (java.util.List<String>) session.getAttribute("tasks");
        if (tasks != null && !tasks.isEmpty()) {
    %>
    <ul>
        <% for (int i = 0; i < tasks.size(); i++) { %>
        <li>
            <span><%= tasks.get(i) %></span>
            <form action="viewTasks.jsp" method="post" style="margin: 0;">
                <input type="hidden" name="taskIndex" value="<%= i %>">
                <button type="submit">Delete</button>
            </form>
        </li>
        <% } %>
    </ul>
    <%
    } else {
    %>
    <p class="no-tasks">No tasks found. <a href="addTask.jsp">Add one now</a>!</p>
    <%
        }
    %>

    <%

        String taskIndexStr = request.getParameter("taskIndex");
        if (taskIndexStr != null) {
            try {
                int taskIndex = Integer.parseInt(taskIndexStr);
                if (tasks != null && taskIndex >= 0 && taskIndex < tasks.size()) {
                    tasks.remove(taskIndex);
                }
            } catch (NumberFormatException e) {
            }
        }
    %>
</div>
</body>
</html>

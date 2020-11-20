<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome ${user.getUsername()}</h1>
<a href="/tasks">Your Tasks</a>
<h1>Create a new Task</h1>
<form method="post" action="/createtask">
<label for="description">Task Description</label>
<input type ="text" name="description"/><br /><br />
<label for="ddate">Due Date</label>
<input type ="date" name="ddate"/><br /><br />
<label for="status">status</label>
 <select id="status" name="status">
    <option value="assigned">Assigned</option>
    <option value="inprogress">Inprogress</option>
    <option value="completed">Completed</option>
  </select>
<input type ="submit" value="create"/>
</form>
</body>
</html>
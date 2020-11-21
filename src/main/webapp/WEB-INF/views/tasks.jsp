<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/custom.js"></script>
</head>
<body>
<div>
<a href="/logout">
    <input type="button" value="LogOut" />
</a>
</div><br /><br />
<a href ="/homepage">Return to Profile</a><br /><br />
<h1>Tasks</h1>
<c:choose>
<c:when test ="${ fn:length(user.getTasks()) > 0}">
<label for="searchstatus">Search by Status</label>
<input name ="searchstatus" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by status..">
<label for="searchDescription">Search by Description</label>
<input name ="searchDescription" type="text" id="myInput1" onkeyup="myFunction1()" placeholder="Search by Description.."><br /><br />
<table id="myTable">
<thead>
<tr>
<th>Description</th>
<th>Due On</th>
<th>Task-Status</th>
<th></th>
<th></th>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
<c:forEach var="task" items ="${user.getTasks()}">
<tr>
<td>${task.getDescription()}</td>
<td>${task.getDuedate()}</td>
<td id="myInput">${task.getStatus()}</td>
<td><a href="completed?id=${task.getId()}">
    <input type="button" value="Completed" />
</a><td>
<td><a href ="delete?id=${task.getId()}">Delete</a><td>
</tr>
</c:forEach>
</tbody>
</table>
<button id="" onclick=sortByDate()>Sort By Due Date</button>
</c:when>
<c:otherwise>
<p>No Tasks found</p>
</c:otherwise>
</c:choose> 
<br /><br />
</body>
</html>
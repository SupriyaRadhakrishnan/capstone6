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
</head>
<body>
<h1>Tasks</h1>
<c:choose>
<c:when test ="${ fn:length(user.getTasks()) > 0}">
<table>
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
<td>${task.getStatus()}</td>
<td><a href="completed?id=${task.getId()}">Completed</a><td>
<td><a href ="delete?id=${task.getId()}">Delete</a><td>
</tr>
</c:forEach>
</tbody>
</table>
</c:when>
<c:otherwise>
<p>No Tasks found</p>
</c:otherwise>
</c:choose>
</body>
</html>
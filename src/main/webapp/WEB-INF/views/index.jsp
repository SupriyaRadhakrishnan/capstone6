<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Please Login</h1>
<p>${message}</p>
<form method="post" action="/login">
<label for="email">Email</label>
<input type="email" name="email"/> <br /><br />
<label for="password">Password</label>
<input type ="password" name="password"/><br /><br />
<input type ="submit" value="Login"/>
</form>
<h1>Register</h1>
<form method="post" action="/register">
<label for="username">Username</label>
<input type ="text" name="username" required/><br /><br />
<label for="email">Email</label>
<input type ="email" name="email" required/><br /><br />
<label for="password">Password</label>
<input type ="password" name="password" required/><br /><br />
<input type ="submit" value="Login"/>
</form>
</body>
</html>
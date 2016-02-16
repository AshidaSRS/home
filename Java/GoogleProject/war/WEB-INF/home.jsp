<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>The time is</title>
</head>
<body>
	<c:choose>
	<c:when test = ${ user != null} }$>
		<p>
			Welcome, ${ user.email }! You can <a href = ${ logOut} }>sign out </a>
		</p>
	</c:when>
	<c:otherwise>
		<p>
			Welcome, <a href= "${ loginURL} }">Sign In or Register</a> to customize
		</p>
	</c:otherwise>
	</c:choose>
	<p>The time is: ${ currentTime }</p>
</body>
</html>
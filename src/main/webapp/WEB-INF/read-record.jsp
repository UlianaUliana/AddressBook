<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read Record From Address Book</title>
</head>
<body>

<%@include file="header.html"%>
<br><br>

<%
    String firstName = (String) request.getAttribute("first-name");
    String lastName = (String) request.getAttribute("last-name");
    String address = (String) request.getAttribute("address");
%>
    <p><b>First name:</b> <%=firstName%></p>
    <p><b>Last name:</b> <%=lastName%></p>
    <p><b>Address:</b> <%=address%></p>
</body>
</html>

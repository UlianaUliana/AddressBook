<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Record in Address Book</title>
</head>
<body>

<%@include file="header.html"%>
<%String massage = (String) request.getAttribute("massage"); %>
<br>
<p><%=massage%></p>
<br>
<form action="/records/create" method="post">
    <table>
        <tr>
            <td>
                <label for="first-name">First name: </label>
            </td>
            <td>
                <input type="text" id="first-name" name="first-name">
            </td>
        </tr>
        <tr>
            <td>
                <label for="last-name">Last Name: </label>
            </td>
            <td>
                <input type="text" id="last-name" name="last-name">
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">Address: </label>
            </td>
            <td>
                <input type="text" id="address" name="address">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Create">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>
</body>
</html>

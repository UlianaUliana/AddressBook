<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Existing Record in Address Book</title>
</head>
<body>
<%@include file="header.html"%>
<br><br>

<form action="/records/update" method="post">
    <%
        String firstName = (String) request.getAttribute("first-name");
        String lastName = (String) request.getAttribute("last-name");
        String address = (String) request.getAttribute("address");

    %>
    <table>
        <tr>
            <td>
                <label for="first-name">First name: </label>
            </td>
            <td>
                <input type="text" id="first-name" name="first-name" value="<%=firstName%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="last-name">Last Name: </label>
            </td>
            <td>
                <input type="text" id="last-name" name="last-name" value="<%=lastName%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">Address: </label>
            </td>
            <td>
                <input type="text" id="address" name="address" value="<%=address%>">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Update">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>
</body>
</html>

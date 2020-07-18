<%@ page import="java.util.List" %>
<%@ page import="com.softserve.itacademy.AddressBook" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #all_records {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #all_records td, #all_records th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #all_records tr:nth-child(even){background-color: #f2f2f2;}

    #all_records tr:hover {background-color: #ddd;}

    #all_records th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #4CAF50;
        color: white;
    }
</style>

<html>
<head>
    <title>List of Records from Address Book</title>
</head>
<body>

<%@include file="header.html"%>
<br><br>

<p>Sort by:
    <a href="/records/list?sort=asc">ascending</a>
    <a href="/records/list?sort=desc">descending</a>
</p>

<table id="all_records">
    <tr>
        <th>No.</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Address</th>
        <th colspan="3">Operations</th>
    </tr>
    <%
        int count = 0;
        for(Object record : (AddressBook) request.getAttribute("records")) {
            String[] words = record.toString().split(",?:?\\s+");
            String firstName = words[2];
            String lastName = words[5];
            String address = "";
            for (int i = 7; i < words.length; i++) {
                address += " " + words[i];
            }
    %>
    <tr>
        <td><%=++count%></td>
        <td><%=firstName%></td>
        <td><%=lastName%></td>
        <td><%=address%></td>
        <td>
            <a href="/records/read?first-name=<%=firstName%>&last-name=<%=lastName%>">Read</a>
        </td>
        <td>
            <a href="/records/update?first-name=<%=firstName%>&last-name=<%=lastName%>">Update</a>
        </td>
        <td>
            <a href="/records/delete?first-name=<%=firstName%>&last-name=<%=lastName%>">Delete</a>
        </td>
    </tr>
    <%        
        }
    %>
</table>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des employés</title>
</head>
<body>
    <h1>Liste des employés</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Email</th>
            <th>Département</th>
            <th>Poste</th>
        </tr>
<%@ page import="beans.Employee" %>
<%@ page import="java.util.List" %>

        <% List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");

        for (Employee employee : employeeList) { %>
            <tr>
                <td><%= employee.getId() %></td>
                <td><%= employee.getFirstName() %></td>
                <td><%= employee.getLastName() %></td>
                <td><%= employee.getEmail() %></td>
                <td><%= employee.getDepartment() %></td>
                <td><%= employee.getPosition() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>

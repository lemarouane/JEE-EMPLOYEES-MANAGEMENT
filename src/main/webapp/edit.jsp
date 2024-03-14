<%@ page import="beans.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Modifier un employé</title>
    <!-- CSS styles -->
    <style>
        /* Ajoutez vos styles CSS personnalisés ici */
    </style>
</head>
<body>
    <h1>Modifier un employé</h1>

    <form action="register" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="employeeId" value="<%= request.getParameter("employeeId") %>" />

        <label for="first_name">First Name:</label>
        <input type="text" name="first_name" id="first_name" value="" /><br>

        <label for="last_name">Last Name:</label>
        <input type="text" name="last_name" id="last_name" value="" /><br>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="" /><br>

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" value="" /><br>

        <label for="position">Position:</label>
        <input type="text" name="position" id="position" value="" /><br>

        <input type="submit" value="Modifier" />
    </form>
</body>
</html>

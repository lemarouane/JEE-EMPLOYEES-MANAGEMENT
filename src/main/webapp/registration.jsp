<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ajout d'un employé dans Albarid Bank</title>
<link rel="icon" href="images/albarid-bank-icon.png" type="image/png">

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ page import="beans.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>

<style>
.action-buttons {
  display: flex;
}

.action-buttons .action-button {
  margin-right: 5px;
}

.search-form {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

/* Adjust the width of the text input field to shorten it */
.search-form input[type="text"] {
  width: 150px; /* You can adjust the value to your preferences */
  padding: 8px;
  border: 1px solid #ddd;
}

/* Reduce the right margin to bring the search bar closer to the button */
.search-form input[type="text"] {
  margin-right: 5px; /* You can adjust the value to your preferences */
}

/* Styles for the buttons */
.search-form button {
  padding: 6px 10px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

/* Styles for the button icon */
.search-form button::before {
  content: "";
  margin-right: 5px; /* You can adjust the value to your preferences */
}

/* Styles on hover of the button */
.search-form button:hover {
  background-color: #45a049;
}


    
.employee-list {
  margin-top: 20px;
}

.employee-list h2 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}

.employee-list table {
  width: 100%;
  border-collapse: collapse;
}

.employee-list table th,
.employee-list table td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.employee-list table th {
  background-color: #f2f2f2;
  font-weight: bold;
}

.employee-list table tr:nth-child(even) {
  background-color: #f9f9f9;
}

.employee-list table tr:hover {
  background-color: #f5f5f5;
}

.employee-list table .action-button {
  display: block;
  padding: 5px 10px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
}

.employee-list table .action-button.edit {
  background-color: #2196f3;
}

.employee-list table .action-button.delete {
  background-color: #f44336;
}

.search-form {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.search-form input[type="text"] {
  width: 200px;
  margin-right: 10px;
  padding: 8px;
  border: 1px solid #ddd;
}

.search-form button {
  padding: 8px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.search-form button:hover {
  background-color: #45a049;
}
</style>

  <style>
    /* Styles pour les champs Ville et Région */
    .form-group-select {
        position: relative;
    }

    .form-group-select select {
        width: 100%;
        padding: 12px 20px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        appearance: none;
        -webkit-appearance: none;
        background-image: url("chemin/vers/icone-dropdown.png"); /* Remplacez par le chemin vers votre icône de flèche vers le bas */
        background-repeat: no-repeat;
        background-position: right 15px center;
        background-size: 20px;
    }

    /* Styles pour les options par défaut */
    .form-group-select select option {
        color: #555;
    }
</style>
<body style="background-color: #EABA6B;">

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

    <div class="main" style="background-color: #EABA6B;">
        <!-- Sign up form -->
        <section class="signup">
<div class="container" style="width: 100%;" >

                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Ajoutez un employé</h2>
                        <form method="post" action="register" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="first_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="first_name" id="first_name" placeholder="First Name" />
                            </div>
                            <div class="form-group">
                                <label for="last_name"><i class="zmdi zmdi-account"></i></label>
                                <input type="text" name="last_name" id="last_name" placeholder="Last Name" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email" />
                            </div>
                            <div class="form-group form-group-select">
                                <label for="department"><i class="zmdi zmdi-case"></i></label>
                                
                                <select name="department" id="department">
    <option value="">Choisissez un département</option>
    <option value="Ressources humaines">Ressources humaines</option>
    <option value="Comptabilité">Comptabilité</option>
    <option value="Marketing">Marketing</option>
    <option value="Ventes">Ventes</option>
    <option value="Informatique">Informatique</option>
    <!-- Ajoutez ici les autres départements -->
</select>

                            </div>
                            <div class="form-group form-group-select">
                                <label for="position"><i class="zmdi zmdi-label"></i></label>
                               <select name="position" id="position">
    <option value="">Choisissez une position</option>
    <option value="Manager">Manager</option>
    <option value="Assistant">Assistant</option>
    <option value="Analyste">Analyste</option>
    <option value="Développeur">Développeur</option>
    <option value="Commercial">Commercial</option>
    <!-- Ajoutez ici les autres positions -->
</select>

                            </div>
                            <div class="form-group form-group-select">
                                <label for="position"><i class="zmdi zmdi-label"></i></label>
                                <select name="agency" id="agency">
    <option value="">Choisissez une agence</option>
    <option value="Agence Casablanca">Agence Casablanca</option>
    <option value="Agence Rabat">Agence Rabat</option>
    <option value="Agence Marrakech">Agence Marrakech</option>
    <option value="Agence Fès">Agence Fès</option>
    <option value="Agence Tanger">Agence Tanger</option>
    <option value="Agence Agadir">Agence Agadir</option>
    <option value="Agence Meknès">Agence Meknès</option>
    <option value="Agence Oujda">Agence Oujda</option>
    <option value="Agence Kénitra">Agence Kénitra</option>
    <option value="Agence Tétouan">Agence Tétouan</option>
    <option value="Agence Safi">Agence Safi</option>
    <option value="Agence Mohammedia">Agence Mohammedia</option>
    <option value="Agence El Jadida">Agence El Jadida</option>
    <option value="Agence Béni Mellal">Agence Béni Mellal</option>
    <option value="Agence Nador">Agence Nador</option>
    <option value="Agence Taza">Agence Taza</option>
    <option value="Agence Settat">Agence Settat</option>
    <option value="Agence Khémisset">Agence Khémisset</option>
    <option value="Agence Inezgane">Agence Inezgane</option>
    <option value="Agence Khouribga">Agence Khouribga</option>
    <!-- Ajoutez ici les autres agences de différentes villes -->
</select>


                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Ajouter" />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="images/reg.png" alt="reg image">
                        </figure>
                    </div>
                </div>

                <%     
                List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
                if (employeeList != null && !employeeList.isEmpty()) {
                %>
                <div class="employee-list">
                    <div class="search-form">
                        <input type="text" id="search-input" placeholder="Rechercher par nom">
                        <button type="button" onclick="searchEmployee()">Rechercher</button>
                    </div>
                    <div class="search-form">
                        <input type="text" id="agency-search-input" placeholder="Rechercher par agence">
                        <button type="button" onclick="searchByAgency()">Rechercher par agence</button>
                    </div>
                    
                    <h2 class="form-title"><center>Liste des employés:</h2>
                    <table id="employee-table">
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Position</th>
                            <th>Agency</th>
                            <th>Action</th>
                        </tr>
                        <% 
                        for (Employee employee : employeeList) {
                        %>
                        <tr class="employee-row">
                            <td><%= employee.getId() %></td>
                            <td><%= employee.getFirstName() %></td>
                            <td><%= employee.getLastName() %></td>
                            <td><%= employee.getEmail() %></td>
                            <td><%= employee.getDepartment() %></td>
                            <td><%= employee.getPosition() %></td>
                            <td><%= employee.getAgency() %></td>
                            <td>
  <div class="action-buttons">
    <a href="#" onclick="editEmployee('<%= employee.getId() %>', '<%= employee.getFirstName() %>', '<%= employee.getLastName() %>', '<%= employee.getEmail() %>', '<%= employee.getDepartment() %>', '<%= employee.getPosition() %>', '<%= employee.getAgency() %>')" class="action-button edit">Modifier</a>
    <a href="#" onclick="confirmDelete('<%= employee.getId() %>')" class="action-button delete">Supprimer</a>
  </div>
</td>

                        </tr>
                        <% 
                        }
                        %>
                    </table>
                </div>
                <% 
                }
                %>
            </div>
        </section>
    </div>

<!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">

    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "success") {
            swal("Congrats", "Employé bien ajouté", "success");
        }
    </script>

    <script>
        function confirmDelete(employeeId) {
            if (confirm("Êtes-vous sûr de vouloir supprimer cet employé ?")) {
                // Envoie de la requête AJAX pour supprimer l'employé
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "register?action=delete&employeeId=" + employeeId, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Actualisez la page après la suppression
                        location.reload();
                    }
                };
                xhr.send();
            }
        }

        function editEmployee(id, firstName, lastName, email, department, position) {
            // Remplir les champs du formulaire avec les informations de l'employé
            document.getElementById("first_name").value = firstName;
            document.getElementById("last_name").value = lastName;
            document.getElementById("email").value = email;
            document.getElementById("department").value = department;
            document.getElementById("position").value = position;
            
            // Mettre à jour l'action et le texte du bouton
            document.getElementById("register-form").action = "register?action=update";
            document.getElementById("signup").value = "Modifier";
            
            // Ajouter un champ caché pour l'ID de l'employé
            var employeeIdField = document.createElement("input");
            employeeIdField.type = "hidden";
            employeeIdField.name = "employeeId";
            employeeIdField.value = id;
            
            // Ajouter le champ caché au formulaire
            document.getElementById("register-form").appendChild(employeeIdField);
        }

        function searchEmployee() {
            var searchValue = document.getElementById("search-input").value.toLowerCase();
            var rows = document.getElementsByClassName("employee-row");

            for (var i = 0; i < rows.length; i++) {
                var firstName = rows[i].getElementsByTagName("td")[1].textContent.toLowerCase();
                var lastName = rows[i].getElementsByTagName("td")[2].textContent.toLowerCase();

                if (firstName.includes(searchValue) || lastName.includes(searchValue)) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }

        function searchByAgency() {
            var searchValue = document.getElementById("agency-search-input").value.toLowerCase();
            var rows = document.getElementsByClassName("employee-row");

            for (var i = 0; i < rows.length; i++) {
                var agency = rows[i].getElementsByTagName("td")[6].textContent.toLowerCase();

                if (agency.includes(searchValue)) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

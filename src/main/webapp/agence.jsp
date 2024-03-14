<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Ajout d'une agence dans Albarid Bank</title>
<link rel="icon" href="images/albarid-bank-icon.png" type="image/png">

  <!-- Font Icon -->
  <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

  <!-- Main css -->
  <link rel="stylesheet" href="css/style.css">
  <style>
    .agence-list {
  margin-top: 20px;
}

.agence-list h2 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}

.agence-list table {
  width: 100%;
  border-collapse: collapse;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.agence-list table th,
.agence-list table td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.agence-list table th {
  background-color: #f2f2f2;
  font-weight: bold;
}

.agence-list table tr:nth-child(even) {
  background-color: #f9f9f9;
}

.agence-list table tr:hover {
  background-color: #f5f5f5;
}

.agence-list table .action-button {
  display: inline-block;
  padding: 5px 10px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.agence-list table .action-button.edit {
  background-color: #2196f3;
}

.agence-list table .action-button.delete {
  background-color: #f44336;
}


   .search-form {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

/* Ajustez la largeur du champ de saisie de texte pour le raccourcir */
.search-form input[type="text"] {
  width: 150px; /* Vous pouvez ajuster la valeur selon vos préférences */
  padding: 8px;
  border: 1px solid #ddd;
}

/* Réduire la marge droite pour rapprocher la barre de recherche du bouton */
.search-form input[type="text"] {
  margin-right: 5px; /* Vous pouvez ajuster la valeur selon vos préférences */
}

/* Styles pour les boutons */
.search-form button {
  padding: 6px 10px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

/* Styles pour l'icône du bouton */
.search-form button::before {
  content: "";
  margin-right: 5px; /* Vous pouvez ajuster la valeur selon vos préférences */
}

/* Styles au survol du bouton */
.search-form button:hover {
  background-color: #45a049;
}



    /* Styling for the agency table */
#agence-table {
  margin-top: 20px;
  width: 100%;
  border-collapse: collapse;
}

#agence-table th,
#agence-table td {
  padding: 12px;
  text-align: left;
}

#agence-table th {
  background-color: #f2f2f2;
  font-weight: bold;
  border-bottom: 1px solid #ddd;
}

#agence-table td {
  border-bottom: 1px solid #ddd;
}

#agence-table tr:nth-child(even) {
  background-color: #f9f9f9;
}

#agence-table tr:hover {
  background-color: #f5f5f5;
}

.agence-row .action-button {
  margin-right: 5px;
  padding: 8px 12px;
  font-size: 14px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.agence-row .action-button.edit {
  background-color: #2196f3;
}

.agence-row .action-button.delete {
  background-color: #f44336;
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
</head>

<body style="background-color: #EABA6B;">
  <%@ page import="beans.Agence" %>
  <%@ page import="java.util.List" %>

  <div class="main" style="background-color: #EABA6B;">
    <!-- Sign up form -->
    <section class="signup">
<div class="container" style="width: 100%;">
        <div class="signup-content">
<div class="signup-form">
    <h2 class="form-title">Ajoutez une agence</h2>
    <form method="post" action="agence" class="register-form" id="register-form">
         <div class="form-group">
            <label for="nom"><i class="zmdi zmdi-business material-icons"></i></label>
            <input type="text" name="nom" id="nom" placeholder="Nom" />
        </div>
        <div class="form-group">
            <label for="adresse"><i class="zmdi zmdi-pin material-icons"></i></label>
            <input type="text" name="adresse" id="adresse" placeholder="Adresse" />
        </div>
         <div class="form-group form-group-select">
            <label for="ville"><i class="zmdi zmdi-city material-icons"></i></label>
            <select name="ville" id="ville">
    <option value="">Choisissez une ville</option>
    <option value="Casablanca">Casablanca</option>
    <option value="Rabat">Rabat</option>
    <option value="Marrakech">Marrakech</option>
    <option value="Fès">Fès</option>
    <option value="Tanger">Tanger</option>
    <option value="Agadir">Agadir</option>
    <option value="Meknès">Meknès</option>
    <option value="Oujda">Oujda</option>
    <option value="Kenitra">Kénitra</option>
    <option value="Tétouan">Tétouan</option>
    <option value="Safi">Safi</option>
    <option value="Mohammedia">Mohammedia</option>
    <option value="El Jadida">El Jadida</option>
    <option value="Beni Mellal">Béni Mellal</option>
    <option value="Nador">Nador</option>
    <option value="Taza">Taza</option>
    <option value="Settat">Settat</option>
    <option value="Khémisset">Khémisset</option>
    <option value="Inezgane">Inezgane</option>
    <option value="Khouribga">Khouribga</option>
    <!-- Ajoutez ici les autres villes -->
</select>

        </div>
         <div class="form-group form-group-select">
            <label for="code_postal"><i class="zmdi zmdi-local-post-office material-icons"></i></label>
            <select name="code_postal" id="code_postal">
    <option value="">Choisissez un code postal</option>
    <option value="20000">20000 - Casablanca</option>
    <option value="10000">10000 - Rabat</option>
    <option value="40000">40000 - Marrakech</option>
    <option value="30000">30000 - Fès</option>
    <option value="90000">90000 - Tanger</option>
    <option value="80000">80000 - Agadir</option>
    <option value="50000">50000 - Meknès</option>
    <option value="60000">60000 - Oujda</option>
    <option value="14000">14000 - Kénitra</option>
    <option value="93000">93000 - Tétouan</option>
    <option value="46000">46000 - Safi</option>
    <option value="20600">20600 - Mohammedia</option>
    <option value="24000">24000 - El Jadida</option>
    <option value="23000">23000 - Béni Mellal</option>
    <option value="62000">62000 - Nador</option>
    <option value="35000">35000 - Taza</option>
    <option value="26000">26000 - Settat</option>
    <option value="11000">11000 - Khémisset</option>
    <option value="80004">80004 - Inezgane</option>
    <option value="25000">25000 - Khouribga</option>
    <!-- Ajoutez ici les autres codes postaux -->
</select>

        </div>
        <div class="form-group form-group-select">
            <label for="region"><i class="zmdi zmdi-label material-icons"></i></label>
            <select name="region" id="region">
    <option value="">Choisissez une région</option>
    <option value="Tanger-Tétouan-Al Hoceïma">Tanger-Tétouan-Al Hoceïma</option>
    <option value="Oriental">Oriental</option>
    <option value="Fès-Meknès">Fès-Meknès</option>
    <option value="Rabat-Salé-Kénitra">Rabat-Salé-Kénitra</option>
    <option value="Béni Mellal-Khénifra">Béni Mellal-Khénifra</option>
    <option value="Casablanca-Settat">Casablanca-Settat</option>
    <option value="Marrakech-Safi">Marrakech-Safi</option>
    <option value="Drâa-Tafilalet">Drâa-Tafilalet</option>
    <option value="Souss-Massa">Souss-Massa</option>
    <option value="Guelmim-Oued Noun">Guelmim-Oued Noun</option>
    <option value="Laâyoune-Sakia El Hamra">Laâyoune-Sakia El Hamra</option>
    <option value="Dakhla-Oued Ed-Dahab">Dakhla-Oued Ed-Dahab</option>
    <!-- Ajoutez ici les autres régions -->
</select>

        </div>
        <div class="form-group form-button">
            <input type="submit" name="signup" id="signup" class="form-submit" value="Ajouter" />
        </div>
    </form>
</div>


          <div class="signup-image">
            <figure>
              <img src="images/agency.png" alt="agency image">
            </figure>
          </div>
        </div>
        <%     
                    List<Agence> agenceList = (List<Agence>) request.getAttribute("agenceList");
                    if (agenceList != null && !agenceList.isEmpty()) {
                %>
        <div class="agence-list">
         <div class="search-form">
  <input type="text" id="search-input" placeholder="">
  <button type="button" onclick="searchAgence()">Rechercher</button>
</div>

          <div>
            <h2>Liste des agences:</h2>
          </div>
        </div>
        <table id="agence-table">
          <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse</th>
            <th>Ville</th>
            <th>Code Postal</th>
            <th>Région</th>
            <th>Action</th>
          </tr>
          <% 
                        for (Agence agence : agenceList) {
                    %>
          <tr class="agence-row">
            <td><%= agence.getId() %></td>
            <td><%= agence.getNom() %></td>
            <td><%= agence.getAdresse() %></td>
            <td><%= agence.getVille() %></td>
            <td><%= agence.getCodePostal() %></td>
            <td><%= agence.getRegion() %></td>
            <td>
              <a href="#" onclick="editAgence('<%= agence.getId() %>', '<%= agence.getNom() %>', '<%= agence.getAdresse() %>', '<%= agence.getVille() %>', '<%= agence.getCodePostal() %>', '<%= agence.getRegion() %>')" class="action-button edit">Modifier</a>
              <a href="#" onclick="confirmDelete(<%= agence.getId() %>)" class="action-button delete">Supprimer</a>
            </td>
          </tr>
          <% 
                        }
                    %>
        </table>
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
      swal("Congrats", "Agence bien ajoutée", "success");
    }
  </script>

  <script>
    function confirmDelete(agenceId) {
      if (confirm("Êtes-vous sûr de vouloir supprimer cette agence ?")) {
        // Envoie de la requête AJAX pour supprimer l'agence
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "agence?action=delete&agenceId=" + agenceId, true);
        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
            // Actualisez la page après la suppression
            location.reload();
          }
        };
        xhr.send();
      }
    }

    function editAgence(id, nom, adresse, ville, codePostal, region) {
      // Remplir les champs du formulaire avec les informations de l'agence
      document.getElementById("nom").value = nom;
      document.getElementById("adresse").value = adresse;
      document.getElementById("ville").value = ville;
      document.getElementById("code_postal").value = codePostal;
      document.getElementById("region").value = region;

      // Mettre à jour l'action et le texte du bouton
      document.getElementById("register-form").action = "agence?action=update";
      document.getElementById("signup").value = "Modifier";

      // Ajouter un champ caché pour l'ID de l'agence
      var agenceIdField = document.createElement("input");
      agenceIdField.type = "hidden";
      agenceIdField.name = "agenceId";
      agenceIdField.value = id;

      // Ajouter le champ caché au formulaire
      document.getElementById("register-form").appendChild(agenceIdField);
    }

    function searchAgence() {
      var searchValue = document.getElementById("search-input").value.toLowerCase();
      var rows = document.getElementsByClassName("agence-row");

      for (var i = 0; i < rows.length; i++) {
        var nom = rows[i].getElementsByTagName("td")[1].textContent.toLowerCase();

        if (nom.includes(searchValue)) {
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

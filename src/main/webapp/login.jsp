<!DOCTYPE html>
<html lang="en">
<head>
<style>

body {
            background: linear-gradient(45deg, #FFB20F, #FFE548, #FFDB5B, #FFFFFF);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            font-family: "Helvetica", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        @keyframes gradientAnimation {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
.toggle-password {
  position: absolute;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

.sign-in .form-group .toggle-password i {
  color: black;
}
.signin-image {
  margin-top: 20px;
}
}

</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In</title>
<link rel="icon" href="images/albarid-bank-icon.png" type="image/png">

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body >
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="main" >
    <!-- Sing in  Form -->
    <section class="sign-in">
<div class="container" style="width: 100%;">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="assets/img/avataaars.png" alt="sing up image">
                    </figure>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Se connecter</h2>
                    <form method="post" action="login" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="votre email" />
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="votre mot de passe" />
                            <span class="toggle-password" onclick="togglePasswordVisibility()"><i class="zmdi zmdi-eye"></i></span>
                        </div>

                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                        </div>
                    </form>
                    <div class="social-login">
                        <a href="forgotPassword.jsp">Mot de passe oublie</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
    function togglePasswordVisibility() {
        var passwordInput = document.getElementById("password");
        var eyeIcon = document.getElementById("eye-icon");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            eyeIcon.style.display = "inline-block";
        } else {
            passwordInput.type = "password";
            eyeIcon.style.display = "none";
        }
    }

    var status = document.getElementById("status").value;
    if (status == "failed") {
        swal("Sorry", "Infos are wrong", "failed");
    }

    // Afficher ou masquer l'icône de l'œil en fonction de l'état initial du champ de mot de passe
    var passwordInput = document.getElementById("password");
    var eyeIcon = document.getElementById("eye-icon");

    passwordInput.addEventListener("input", function() {
        eyeIcon.style.display = passwordInput.value ? "inline-block" : "none";
    });
</script>

</body>
</html>

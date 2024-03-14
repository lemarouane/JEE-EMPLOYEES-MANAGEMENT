<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title></title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Conteneur contenant tous les éléments -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- Conteneur blanc -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- En-tête principale -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Réinitialiser le mot de passe</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="newPassword" method="POST">
								<!-- Champ pour le nouveau mot de passe -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password" placeholder="&#xf084; &nbsp; Nouveau mot de passe"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Champ pour confirmer le nouveau mot de passe -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirmer le nouveau mot de passe"
											class="form-control border-info placeicon">
									</div>
								</div>
							
								<!-- Bouton pour réinitialiser le mot de passe -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Réinitialiser"
											class="btn btn-block btn-info">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="mx-0 px-0 bg-light">
							
							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
							<!-- Register Now -->
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	
</body>
</html>
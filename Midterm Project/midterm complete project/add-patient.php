<?php
session_start();
error_reporting(0);
include('config.php');


if(isset($_POST['submit']))
{
#$pat_id=$_POST['id'];
$firstname=$_POST['firstname'];
$lastname=$_POST['lastname'];
$email=$_POST['email'];
$phone=$_POST['phone'];
$address=$_POST['patientaddress'];
$city=$_POST['city'];
$code=$_POST['areacode'];
$state=$_POST['state'];
$country=$_POST['country'];
$gender=$_POST['gender'];

$query=pg_query($link,"insert into patient(first_name,last_name,email,phone,street_address,city,zip,states,country,gender) 
                       values('$firstname','$lastname','$email','$phone','$address','$city','$code','$state','$country','$gender')");
if($query)
{
echo "alert('New Patient added Successfully.')>";
echo "<script>window.location.href ='manage-patient.php'</script>";

}
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Receptionist | Add Patient</title>
		
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />



	</head>
	<body>
		<div id="app">		

			<div class="app-content">
				
						
						
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">Receptionist | Add Patient</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span>Receptionist</span>
									</li>
									<li class="active">
										<span>Add Patient</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-md-12">
									
									<div class="row margin-top-30">
										<div class="col-lg-8 col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">Add Patient</h5>
												</div>
												<div class="panel-body">
									
													<form role="form" name="addpatient" method="post" onSubmit="return valid();">
													


<div class="form-group">
															<label for="firstname">
																Patient First Name
															</label>
					<input type="text" name="firstname" class="form-control"  placeholder="Enter Patient First Name" required="true">
														</div>


<div class="form-group">
															<label for="lastname">
																 Patient Last Name
															</label>
					<input type='text' name="lastname" class="form-control"  placeholder="Enter Patient Last Name" required="true"></textarea>
														</div>
<div class="form-group">
															<label for="email">
																Patient Email
															</label>
					<input type="email" id ="email" name="email" class="form-control"  placeholder="Enter Patient Email" required="true">
														</div>
	
<div class="form-group">
									<label for="phone">
																 Patient Contact no
															</label>
					<input type="tel" name="phone" class="form-control"  placeholder="Enter Patient Contact no" required="true">
														</div>
													
<div class="form-group">
															<label for="address">
																Street Address
															</label>
					<input type="text" name="patientaddress" class="form-control"  placeholder="Street Address" required="required">
														</div>
														
														<div class="form-group">
															<label for="city">
																City
															</label>
					<input type="text" name="city" class="form-control"  placeholder="City" required="required">
														</div>

<div class="form-group">
															<label for="city">
																Area Code
															</label>
					<input type="text" name="areacode" class="form-control"  placeholder="Area Code" required="required">
														</div>
														
<div class="form-group">
															<label for="state">
																State
															</label>
					<input type="text" name="state" class="form-control"  placeholder="State" required="required">
														</div>


<div class="form-group">
									<label for="country">
																 Country
															</label>
				    <input type="text" name="country" class="form-control"  placeholder="Country" required="required">
														</div>	

<div class="form-group">
									<label for="gender">
																 Gender
															</label>
	<input type="text" name="gender" class="form-control"  placeholder="Gender" required="true">
	</div>											
														
														
														<button type="submit" name="submit" id="submit" class="btn btn-o btn-primary">
															Add
														</button>
													</form>
												</div>
											</div>
										</div>
											
											</div>
										</div>
									<div class="col-lg-12 col-md-12">
											<div class="panel panel-white">
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end: BASIC EXAMPLE -->
			
					
					
						
						
					
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>
			</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
		<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script src="vendor/autosize/autosize.min.js"></script>
		<script src="vendor/selectFx/classie.js"></script>
		<script src="vendor/selectFx/selectFx.js"></script>
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>

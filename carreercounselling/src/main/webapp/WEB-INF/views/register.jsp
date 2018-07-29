<!DOCTYPE HTML>
<!--
	Aesthetic by gettemplates.co
	Twitter: http://twitter.com/gettemplateco
	URL: http://gettemplates.co
-->
<html>
	<head>
	

  

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<%@ include file="nav.jsp" %>
	<!-- Animate.css -->
	<link rel="stylesheet" href="${css}/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${css}/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="${css}/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${css}/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${css}/magnific-popup.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${css}/bootstrap-datepicker.min.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${css}/owl.carousel.min.css">
	<link rel="stylesheet" href="${css}/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${css}/style2.css">
	
	<body>

		<div class="gtco-loader"></div>

	


		<!-- <div class="page-inner"> -->
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">

				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div id="gtco-logo"><a href="index.html">Christ<em>.</em></a></div>
					</div>
					
				</div>

			</div>
		</nav>




<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(${images}/ll.jpg);">
		<div class="overlay"></div>
		<div class="gtco-container">

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">Don't be shy</span>

							<h1>Come Join us.</h1>
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap"style="left:-250px">
								<div class="tab">


									<div class="tab-content container-fluid">
										<div class="tab-content-inner active " data-content="signup">
											<h3>Registration</h3>
											<c:url var="register" value="/registeruser"></c:url>
											<form action="${register}" method="post">
<div class="row from-group">
													<div class="col-xs-6">
														<label for="fullname">Name</label>
														<input type="text" id="fullname" class="form-control " placeholder="Name">
													</div>
													<div class="col-xs-6">
														<label for="uname">User Name</label>
														<input type="text" id="uname" class="form-control " placeholder="Full Name ">
													</div>
</div>
												<div class="row form-group">
													<div class="col-xs-6">
														<label for="email">Email</label>
														<input type="text" id="email" class="form-control " placeholder="username@example.com">
													</div>
													<div class="col-xs-6">
														<label for="institue">Institute</label>
														<input type="text" id="institute" class="form-control " placeholder="Institute">
													</div>
												</div>
<!-- <div class="row form-group"> -->
<!-- 													<div class="col-xs-6"> -->
<!-- 														<label for="date-start">D.o.b</label> -->
<!-- 								<input type="text" id="date-start" class="form-control " placeholder="D.O.B"> -->
<!-- 													</div> -->
<!-- 													<div class="col-xs-6"> -->
<!-- 														<label for="Gender">Gender</label> -->
<!-- 														<select name="#" id="Gender" class="form-control" placeholder="Gender"> -->
<!-- 															<option value="">Female</option> -->
<!-- 															<option value="Male">Male</option> -->
<!-- 														</select> -->
<!-- 													</div> -->
<!-- 												</div> -->

<div class="row form-group">
													<div class="col-xs-6">
														<label for="pd">Password</label>
														<input type="password" id="pd" class="form-control " placeholder="*********">
													</div>
													<div class="col-xs-6">
														<label for="cpd">Confirm Password</label>
														<input type="password" id="cpd" class="form-control " placeholder="*********">
													</div>
												</div>



<div class="row form-group">
												<!--	<div class="col-md-12">
														<label for="fullname">Confirm Password</label>
														<input type="text" id="fullname" class="form-control">
													</div> -->
												</div><!--
												<div class="row form-group">
													<div class="col-md-12">
														<label for="activities">Activities</label>
														<select name="#" id="activities" class="form-control">
															<option value="">Activities</option>
															<option value="">Hiking</option>
															<option value="">Caving</option>
															<option value="">Swimming</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="destination">Destination</label>
														<select name="#" id="destination" class="form-control">
															<option value="">Philippines</option>
															<option value="">USA</option>
															<option value="">Australia</option>
															<option value="">Singapore</option>
														</select>
													</div>
												</div> -->

												<!--<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Date Travel</label>
														<input type="text" id="date-start" class="form-control">
													</div>
												</div> -->

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="Submit">
													</div>

							<!--&nbsp; &nbsp; &nbsp;<a class="gtco-footer-links" href="register.html#target">Not registered ? Click here</a>-->

												</div>
											</form>
										</div>


									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</header>


			<!--<div class="row">
				<div class="col-md-12">
					<div class="col-md-6 animate-box">
					<a id="target"><h3>Register</h3></a>
					<form action="#" style="justify-content: center;">
						<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="name">Name</label>
								<input type="text" id="name" class="form-control" placeholder="Your firstname">
							</div>

						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="email">Email</label>
								<input type="text" id="email" class="form-control" placeholder="Your email address">
							</div>
						</div>
<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="pd">Password</label>
								<input type="password" id="pd" class="form-control" placeholder="Password">
							</div>

						</div>
<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="pd1">Confirm Passwrod</label>
								<input type="password" id="pd1" class="form-control" placeholder="Confirm Password">
							</div>

						</div>
<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="date-start">Date</label>
								<input type="text" id="date-start" class="form-control" placeholder="D.O.B">
							</div>

						</div>
<div class="row form-group">
													<div class="col-md-12">
														<label class="sr-only"for="Gender">Destination</label>
														<select name="#" id="Gender" class="form-control" placeholder="Gender">female
															<option value="">Female</option>
															<option value="Male">Male</option>
														</select>
													</div>
												</div>
<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start"></label>
														<input type="text" id="date-start" class="form-control" placeholder="D.O.B">
													</div>-->

						<!--<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="subject">Subject</label>
								<input type="text" id="subject" class="form-control" placeholder="Your subject of this message">
							</div>-->


						<!--<div class="row form-group">
							<div class="col-md-12">
								<label class="sr-only" for="message">Address</label>
								<textarea name="message" id="message" cols="30" rows="10" class="form-control" placeholder="Write us something"></textarea>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" value="Submit" class="btn btn-primary">
						</div>

					</form>
				</div>
				<div class="col-md-5 col-md-push-1 animate-box">

					<div class="gtco-contact-info">
						<h3>Contact Information</h3>
						<ul>
							<li class="address">198 West 21th Street, <br> Suite 721 New York NY 10016</li>
							<li class="phone"><a href="tel://1234567920"> +91 77603 92595</a></li>
							<li class="email"><a href="mailto:info@yoursite.com"> kasspanguila@gmail.com</a></li>
							<!--<li class="url"><a href="http://GetTemplates.co">GetTemplates.co</a></li>
						</ul>
					</div>


				</div>
				</div>
			</div>
                      </div>
		</div>
	</div>-->


	<footer id="gtco-footer" role="contentinfo">
		<div class="gtco-container">
			<div class="row row-p	b-md">

				<div class="col-md-4">
					<div class="gtco-widget">
						<h3>About Us</h3>
						<p>Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah Blah BLah</p>
					</div>
				</div>

				<!--<div class="col-md-2 col-md-push-1">
					<div class="gtco-widget">
						<h3>Destination</h3>
						<ul class="gtco-footer-links">
							<li><a href="#">Europe</a></li>
							<li><a href="#">Australia</a></li>
							<li><a href="#">Asia</a></li>
							<li><a href="#">Canada</a></li>
							<li><a href="#">Dubai</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-2 col-md-push-1">
					<div class="gtco-widget">
						<h3>Hotels</h3>
						<ul class="gtco-footer-links">
							<li><a href="#">Luxe Hotel</a></li>
							<li><a href="#">Italy 5 Star hotel</a></li>
							<li><a href="#">Dubai Hotel</a></li>
							<li><a href="#">Deluxe Hotel</a></li>
							<li><a href="#">BoraBora Hotel</a></li>
						</ul>
					</div>
				</div>-->

				<div class="col-md-3 col-md-push-1">
					<div class="gtco-widget">
						<h3>Contact Us</h3>
						<ul class="gtco-quick-contact">
							<li><a href="#"><i class="icon-phone"></i> +91 99999 99999</a></li>
							<li><a href="#"><i class="icon-mail2"></i> XYZ</a></li>
							<!--<li><a href="#"><i class="icon-chat"></i> Live Chat</a></li>-->
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-md-push-1 style="top:-30px"">
				<form>
				  <div class="row form-wrap">
				    <div class="col-md-12 w-50">
							<div class="form-group">
				      <input type="text" class="form-control input-sm" placeholder="Your name">
						</div>
				    </div>

						<div class="form-group col-md-12 w-50">
<textarea class="form-control" rows="4" id="comment" placeholder="Write to us..."></textarea>
</div>
				    </div>

							<div class="col-md-12">
								<input type="submit" class="btn btn-primary btn-block" value="Send">
							</div>
				  </div>
				</form>
			</div>
			</div>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="${js}/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${js}/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${js}/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${js}/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${js}/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${js}/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="${js}/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="${js}/jquery.magnific-popup.min.js"></script>
	<script src="${js}/magnific-popup-options.js"></script>

	<!-- Datepicker -->
	<script src="${js}/bootstrap-datepicker.min.js"></script>


	<!-- Main -->
	<script src="${js}/main.js"></script>

	</body>
</html>

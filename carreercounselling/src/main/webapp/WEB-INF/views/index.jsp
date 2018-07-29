
<%@ include file="nav.jsp" %>
<style>
	.content{padding-top:80px; padding-bottom:80px;}
.mb40{margin-bottom:40px;}
.team-block { margin-bottom: 20px; }
.team-content { position: absolute; background-color: rgba(17, 24, 31, 0.8); bottom: 0px; display: block; width: 100%; color: #fff; padding: 30px; }
.team-img { position: relative; }
.team-img img { width: 100%; }
.team-title { }
.team-meta { color: #9da4aa; font-weight: 400; font-size: 16px; }
.overlay { border-radius: 0px; position: absolute; top: 0; bottom: 0; left: 0; right: 0; height: 100%; width: 100%; opacity: 0; transition: 1s ease; background-color: #11181f; }
.team-img:hover .overlay { opacity: .8; }
.team-img:hover .team-content { opacity: 0; }
.text { color: #fff; position: absolute; top: 30%; left: 30%; transform: translate(-26%, -26%); -ms-transform: translate(-26%, -26%); right: 0; font-weight: 400; font-size: 16px; }

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
    
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    border-radius: 15px 50px;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: #029eb7;
    color: white;
    font-size: 25px;
    text-align: center;
}

.price li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: justify;
    
   
}

.price .grey {
    background-color: #eee;
    font-size: 20px;
}

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
	</style>
<section class="banner_top" id="home">

		<div  id="page-top" class="slider">
			<div class="wrapper">
			
			
				
				<!-- Slideshow 3 -->
				<ul class="rslides" id="slider">
					<li>
						<div class="agile_banner_text_info">
							<h3>The Best Learning Institution </h3>
							<p>Preparing students for life by educating with the skills required for 21st century.</p>
						</div>
					</li>
					<li>
						<div class="agile_banner_text_info">
							<h3>The Best Learning Institution </h3>
							<p>Parental involvement in Education and Achievements for better social skills and improved behavior.</p>
						</div>
					</li>
					<li>
						<div class="agile_banner_text_info">
							<h3>The Best Learning Institution </h3>
							<p>Establishing a connection school-to-work through early career planning.</p>
						</div>
					</li>
					<li>
						<div class="agile_banner_text_info">
							<h3>The Best Learning Institution </h3>
							<p>Associate innovative and engaging teachings of classroom to real life with major focus on Science, Technology, Engineering and Mathematics(STEM).</p>
						</div>
					</li>
				</ul>
				<!-- Slideshow 3 Pager -->
				<ul id="slider3-pager">
					<li><a href="#"><img src="${img}/bg0.jpg" data-selector="img" alt=""></a></li>
					<li><a href="#"><img src="${img}/bg11.jpg" data-selector="img" alt=""></a></li>
					<li><a href="#"><img src="${img}/bg12.jpg" data-selector="img" alt=""></a></li>
					
					<li><a href="#"><img src="${img}/bg13.jpg" data-selector="img" alt=""></a></li>

				</ul>
			</div>
		</div>
	</section>
	<!-- //banner -->
<style>
.modal {
    overflow-y: auto;
}

.modal-open {
    overflow: auto;
}

.modal-open[style] {
    padding-right: 0px !important;
}</style>
<div class="modal" id="mmodal-wrap">
    <div class="modal-dialog">
				<div class="modal-wrapp" id="modal-wrapp" >
    <div class="modal-bodiess" >
      <div class="modal-bodyy modal-body-step-2 is-showing animate-in">
        <div class="title">Login</div>
        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
      <div class="alert alert-danger">
  <strong>Invalid Email Id and Password</strong> 
</div>
         <br/><br/>
       
</c:if>
        <div class="description">Please Fill in your Details</div>
        <c:url value="/j_spring_security_check" var="addlogin"/>
         <form:form action="${addlogin}" method="post">
                <input type="text" placeholder="User Name" name="j_username" />
                <input type="Password" placeholder="Password" name="j_password"/>
                        <div class="text-center">
                          <input type="submit" value="Login">
                         </div>
        </form:form>
      </div>
    </div>
  </div>
  </div>
  </div> > <!-- Register Modal -->
  <div class="modal" id="modal-wrap">
    <div class="modal-dialog">
  <div class="mmodal-wrap">
    <div class="mmodal-header"><span class="is-active"></span><span></div>
    <div class="mmodal-bodies">
      <div class="mmodal-body mmodal-body-step-1 is-showing">
        <div class="title">Step 1</div>
        <div class="description">What Standard are you in ? </div>
        <form>
<label></label>                    <label>
                        <div class="onebu"><div class="shutext1"> < 10 </div></div>
                    </label>
                      <label>
                        <div class="twobu"><div class="shutext1"> > 10 </div></div>
                      </label>

        </form>
      </div>
      <div class="mmodal-body mmodal-body-step-2">
        <div class="title">Step 2</div>
        <div class="description">Please Fill in your Details </div>
        <c:url var="add" value="/registeruser"></c:url>
        <form:form action="${add}" method="post" commandName="user">
                <form:input type="hidden" path="User_id"/>
                <form:input type="text" placeholder="First Name" path="Fname"/>
                <form:input type="text" placeholder="Last Name" path="Lname"/>
                <form:input type="email" placeholder="Email" path="email_id"/>
                <form:select id="scl" class="form-group form-control" path="school.school_id">
	            <form:option value="-1" label="--- Select School  ---"/>
	     <c:forEach items="${schools}" var="bb">
	     <form:option value="${bb.getSchool_id()} " >${bb.getSchool_name()}</form:option>
	     </c:forEach>
	    </form:select>
                <form:input type="text" placeholder="class" path="stud_class"/>
                <form:input type="text" placeholder="Section" path="section"/>
                <form:input type="text" placeholder="rol number" path="roll_no" />
                <form:input type="text" placeholder="Phone Number" path="phone_no"/>
                <input type="password" placeholder="Password"/>
                <form:input type="password" placeholder="Confirm Password" path="password"/>
                <div class="text-center">
                        <div class="text-center fade-in">
                                <input type="submit" class="button" value="Submit">
                              </div>
                  </div>
        </form:form>
      </div>
    </div>
  </div>
  </div>
  </div>
<!-- <input type="number" placeholder="Phone Number" path="number"/> -->
<!--                 <input type="number" placeholder="class" path="cla"/> -->
<section  class="w3-services">
	<div class="content" id="services">
        <c:if test="${mess != null}">
			<div class="alert alert-success">
            <strong> ${mess}</strong>
            </div>
            </c:if>
			  <c:if test="${errMsg != null}">
			<div class="alert alert-danger">
            <strong> ${errMsg}</strong>
            </div>
            </c:if>
            
        <div class="container">
             <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb40 text-center">
                  <h3 class="w3l_header">Our Services</h3>
				<style>
				.price li {
				list-style-position: inside;
				}	
				</style>
			</div>
								<div class="columns">
					  <ul class="price">
					    <li class="header">Career Assessment</li>
					    <li type ="disc" >Discover personality and interest</li>
					    <li type ="disc">Computer based assessment</li>
					    <li type ="disc">Appropriate stream recommendations </li>
					    <li type ="disc">Course and Career based on personality </li>
					  </ul>
					</div>
					
					<div class="columns">
					  <ul class="price">
					    <li class="header">Workshop for Teachers</li>
					    <li type ="disc">Future focused training programs</li>
					    <li type ="disc">Develop innovative teaching methods</li>
					    <li type ="disc">Focus on strategies, tools and lesson ideas for career focused teaching</li>
					    <li type ="disc">Facilitate process of career planning</li>
					  </ul>
					</div>
					
					<div class="columns">
					  <ul class="price">
					    <li class="header">Workshop for Parents</li>
					    <li type ="disc">Support children to follow their dreams</li>
					    <li type ="disc">Connect and engage in career planning</li>
					    <li type ="disc">Create the awareness on future world of work</li>
					    <li type ="disc">Update on futuristic career opportunities</li>
					  </ul>
					</div>
					</div>
					</div>
					</div>
</section>
<!-- //services -->
<!-- classes -->
	<section class="ser-agile">
			<div id="classes" class="container">
				<div class="wthree_head_section">
					<h3 class="w3l_header w3_agileits_header two">Our Classes</h3>
				</div>
					<div class="row w3l-info">
							<div class="col-lg-4 ser-lef-agile">
								<div class="grid1">
									<h5>Sunday - 10:00 Am</h5>
									<h4>Special Classes</h4>
									<h6>Tutor: Andrew Ross</h6>
								</div>
							</div>
							<div class="col-lg-4 ser-lef-agile">
								<div class="grid1">
									<h5>Daily - 8:00 Am</h5>
									<h4>Special Classes</h4>
									<h6>Tutor: Steve Smith</h6>
								</div>
							</div>
							<div class="col-lg-4 ser-lef-agile">
								<div class="grid1">
									<h5>Saturday - 9:00 Am</h5>
									<h4>Special Classes</h4>
									<h6>Tutor: Jessy Raider</h6>
								</div>
							</div>
						</div>
				</div>
		</section>
	<!-- //classes -->

	<!-- what we do -->
	<section class="what_you">
	<div id="whatwedo" class="container">
	<h3 class="w3l_header">What we do</h3>
	<div class="wthree_head_section"> 
	</div>		
			<div class="row about-info-grids">
				<div class="col-md-4 about-info about-info1">
					<i class="far fa-gem"></i>
					<h4>Career Assessment</h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
				<div class="col-md-4 about-info about-info2">
					<i class="fas fa-book"></i>
					<h4>Workshop for Teachers</h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
				<div class="col-md-4 about-info about-info3">
					<i class="fab fa-codepen"></i>
					<h4>Workshop for Parents</h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
			</div>
			<div class="bord"></div>
			<div class="row about-info-grids">
				<div class="col-md-4 about-info about-info1">
					<i class="fas fa-university"></i>
					<h4>Career Development with special needs </h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
				<div class="col-md-4 about-info about-info2">
					<i class="fas fa-folder"></i>
					<h4>Career Planning for academically gifted Students</h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
				<div class="col-md-4 about-info about-info3">
					<i class="fas fa-graduation-cap"></i>
					<h4>Training programs on life skills</h4>
					<div class="h4-underline"></div>
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p> -->
				</div>
			</div>
	</div>
</section>
<!-- //what we do -->
<!-- testimonials -->
	<section class="test">
		<div id="testi" class="container">
			<div class="wthree_head_section">
					<h3 class="w3l_header w3_agileits_header two">What Students Says</h3>
				</div>
			<div class=" test-gr">
				<div class=" test-gri1">
					<div id="owl-demo2" class="owl-carousel">
						<div class="row agile">
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo hrms">
									<img src="${img}/ts1.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor .</p>
									<h4>Shane Watson</h4>
									<span>Student</span>
								</div>
							</div>
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo">
									<img src="${img}/ts2.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor.</p>
									<h4>Steve Smith</h4>
									<span>Student</span>
								</div>
							</div>
						</div>
						<div class="row agile">
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo hrms">
									<img src="${img}/ts3.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor.</p>
									<h4>James Franklin</h4>
									<span>Student</span>
								</div>
							</div>
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo">
									<img src="${img}/ts1.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor .</p>
									<h4>Mitchel Starc</h4>
									<span>Student</span>
								</div>
							</div>
						</div>
						<div class="row agile">
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo hrms">
									<img src="${img}/ts2.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor .</p>
									<h4>Colling Wood</h4>
									<span>Student</span>
								</div>
							</div>
							<div class="col-md-6 test-grid">
								<div class="test-grid1-agileinfo">
									<img src="${img}/ts3.jpg" alt="" class="img-r">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis. Lorem ipsum dolor .</p>
									<h4>Mark Henry</h4>
									<span>Student</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- testimonials -->
	<!-- features -->
	<section class="features">
				<div id="aboutus" class="container">
		<div class="wthree_head_section">
		<h1 align="center">About us</h1>
                
                </div>
            </div>
            <div class="row">
                 <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <!-- team-img -->
                    <div class="team-block">
                        <div class="team-img">
                            <img src="https://easetemplate.com/free-website-templates/motion/images/team_member_1.jpg" alt="">
                            <div class="team-content">
                                <h4 class="text-white mb0">Dr. Tony Sam George</h4>
                                <p class="team-meta">- Key Academic Advisor</p>
                            </div>
                            <div class="overlay">
                                <div class="text">
                                    <h4 class="mb0 text-white">Dr. Tony Sam George</h4>
                                    <p class="mb30 team-meta">- Key Academic Advisor</p>
                                    <p>He is a senior professor and practicing psychotherapist. He has several years of experience working in the educational
sector, corporate and social initiatives. His pedagogy includes global best practices from Harvard 
and Stonehill College, US.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.team-img -->
                 <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <!-- team-img -->
                    <div class="team-block">
                        <div class="team-img">
                            <img src="https://easetemplate.com/free-website-templates/motion/images/team_member_2.jpg" alt="">
                            <div class="team-content">
                                <h4 class="text-white mb0">Mr. Juble Varghese</h4>
                                <p class="team-meta">- Academic Consultant</p>
                            </div>
                            <div class="overlay">
                                <div class="text">
                                    <h4 class="mb0 text-white">Mr. Juble Varghese</h4>
                                    <p class="mb30 team-meta">- Academic Consultant</p>
                                    <p>He is educator, writer, trainer and expert in marketing management. He has a experience of 10 years in MNCs. He co-created 
the career assessment inventory based on famous Holland’s typology. He is also a academic consultant for Lifology.com.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.team-img -->
                  <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <!-- team-img -->
                    <div class="team-block">
                        <div class="team-img">
                            <img src="https://easetemplate.com/free-website-templates/motion/images/team_member_3.jpg" alt="" class="img-fluid">
                            <div class="team-content">
                                <h4 class="text-white mb0">Mr. Sreehari Ravindranath</h4>
                                <p class="team-meta">- Career counselor</p>
                            </div>
                            <div class="overlay">
                                <div class="text">
                                    <h4 class="mb0 text-white">Mr. Sreehari Ravindranath</h4>
                                    <p class="mb30 team-meta">- Career counselor</p>
                                    <p>Career counselor with 7 years experience. Works as Assistant professor in reputed institution and also a project consultant 
in developing value based educational activites in collabration with MIT, USA. He has written a book 
Do Organizational Stress really matters in Career Satisfaction? published by by Anchor Academic Publishing, Germany.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
	</section>
	<!-- //features -->
	<%@ include file="foot.jsp" %>

<!-- 	<section class="copyright-wthree"> -->
<!-- 		<div class="container"> -->
<!-- 			<p>&copy; 2018 Preparation . All Rights Reserved | Design by -->
<!-- 				<a href="http://w3layouts.com/"> W3layouts </a> -->
<!-- 			</p> -->
<!-- 			<div class="w3l-social"> -->
<!-- 				<ul> -->
<!-- 					<li> -->
<!-- 						<a href="#" class="fab fa-facebook-f"></a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#" class="fab fa-twitter"></a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#" class="fab fa-google-plus-g"></a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="#" class="fab fa-instagram"></a> -->
<!-- 						<li> -->
<!-- 							<li> -->
<!-- 								<a href="#" class="fab fa-linkedin-in"></a> -->
<!-- 								<li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<!-- //Footer -->
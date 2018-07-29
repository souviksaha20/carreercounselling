
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html><head>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/webfonts" var="fonts" />
<spring:url value="/resources/images" var="img" />

      <title> </title>
	
	<!-- // Meta Tags -->
      <!--booststrap-->
      <link href="${css}/bootstrap.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="${css}/fontawesome-all.css" rel="stylesheet">
      <link href="${css}/b.css" rel="stylesheet">
      <link href="${css}/a.css" rel="stylesheet">
      <!-- //font-awesome icons -->
	  <link href="${css}/owl.carousel.css" rel="stylesheet">
      <!--stylesheets-->
		<link href="${css}/style.css" rel='stylesheet' type='text/css' media="all">


      <!--//stylesheets-->
     <link href="http://fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
   <script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
   </head>
<body>

<nav id="navig" class="navbar navbar-default navbar-fixed-top " >

        <div  class="container-fluid">
        <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top" style="color:white">CHRIST CARRER</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right wrapper section">
                    <li class="hidden" >
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li class="active" id="#home">
                        <a class="page-scroll" href="#Home"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li id="serv">
                        <a class="page-scroll" href="#services"><i class="fa fa-wrench" aria-hidden="true"></i> Services</a>
                    </li>
                    <li id="feat">
                        <a class="page-scroll" href="#classes"><i class="fa fa-plus-square" aria-hidden="true"></i> Features</a>
                    </li>
                    <li id="about">
                        <a class="page-scroll" href="#whatwedo"><i class="fa fa-users" aria-hidden="true"></i> About Us</a>
                    </li>
                    <li id="contact">
                        <a class="page-scroll" href="#testi"><i class="fa fa-phone-square" aria-hidden="true"></i> Contact Us</a>
                    </li>
                    <li>
                        <a  data-toggle="modal" data-target="#modal-wrap" class="page-scroll" id="abc"><i class="fa fa-user-plus" aria-hidden="true"></i> Register </a>
                    </li>
                    <li>
                         <a  data-toggle="modal" data-target="#mmodal-wrap" class="page-scroll" id="abc"><i class="fa fa-user-plus" aria-hidden="true"></i> Login </a>
                    </li>
                    
<!--                      <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--           Admin -->
<!--         </a> -->
        
<!--         <ul  class="dropdown-menu" style="background:black;" > -->
<%--         <li><a class="dropdown-item" href="<c:url value="/admin/addDimension"/>" >Add Dimension</a></li> --%>
<%--           <li><a class="dropdown-item" href="<c:url value="/admin/addQuestion"/>" >Add Question</a></li> --%>
<%--           <li><a class="dropdown-item" href="<c:url value="/admin/addStrength"/>" >Add Strength</a></li> --%>
<%--           <li><a class="dropdown-item" href="<c:url value="/admin/addSubject"/>" >Add Subject</a></li> --%>
<%--           <li><a class="dropdown-item" href="<c:url value="/admin/addJob"/>" >Add Job</a></li> --%>
        
<!--                 </ul>   -->
      
<!--       </li> -->
      </ul>
      </div>
      </div>
   </nav>
   
   
<!--             Brand and toggle get grouped for better mobile display -->
            

<!--             Collect the nav links, forms, and other content for toggling -->
            
        
          
          


<!--                 </ul> -->
<!--             </div> -->
<!--             /.navbar-collapse -->
<!--         </div> -->
<!--         /.container-fluid -->
<!--     </nav>			 -->
 <!--js working-->
      <script src="${js}/jquery.min.js"></script>
      <!--//js working-->
	  <!-- requried-jsfiles-for owl -->
	<script src="${js}/owl.carousel.js"></script>
	<script>
		$(document).ready(function () {
			$("#owl-demo2").owlCarousel({
				items: 1,
				lazyLoad: false,
				autoPlay: true,
				navigation: false,
				navigationText: false,
				pagination: true,
			});
		});
	</script>
	<!-- //requried-jsfiles-for owl -->


	  	<!-- Slider script -->
	<script src="${js}/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			$("#slider").responsiveSlides({
				auto: true,
				nav: true,
				manualControls: '#slider3-pager',
			});
		});
	</script>
<!-- stats -->
	<script src="${js}/jquery.waypoints.min.js"></script>
	<script src="${js}/jquery.countup.js"></script>
	<script>
		$('.counter-agileits-w3layouts').countUp();
	</script>
	<!-- //stats -->

	<!-- smooth scrolling -->
	<script type="text/javascript" src="${js}/move-top.js"></script>
	<script type="text/javascript" src="${js}/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
									
			});

	
	$(document).ready(function () {
     $('a[href^="#"]').on('click', function (e) {
         e.preventDefault();
         var target = this.hash,
             $target = $(target);
			
         $('html, body').stop().animate({
             'scrollTop': $target.offset().top - 120
         }, 1100, 'swing', function () {
           
         });

     });
 });

$(window).scroll(function() {

     if(($(window).scrollTop() > 600)) {
    	 
    	 if($(window).scrollTop() > 1200) {
    		 if($(window).scrollTop() > 2400) {
    			 if($(window).scrollTop() > 2900) {
                     // document.getElementById("navig").style.backgroundColor = "#45BECF";
                     document.getElementById("navig").style.backgroundColor = "#263238" ;
                     document.getElementById("navig").style.border = "transparent";
                      
                     $('li').each(function () {
                         $(this).removeClass('active');
                         $('#contact').addClass('active');
                     })
                     
                     
                   
                     
                     
               
        	 }else{
        		 // document.getElementById("navig").style.backgroundColor = "#45BECF";
                 document.getElementById("navig").style.backgroundColor = "#263238" ;
                 document.getElementById("navig").style.border = "transparent";
                  
                 $('li').each(function () {
                     $(this).removeClass('active');
                     $('#about').addClass('active');
                 })
        	 }
    		 
                
                 
                 
               
                 
                 
           
    	 }else{
             // document.getElementById("navig").style.backgroundColor = "#45BECF";
             document.getElementById("navig").style.backgroundColor = "#263238" ;
             document.getElementById("navig").style.border = "transparent";
              
             $('li').each(function () {
                 $(this).removeClass('active');
                 $('#feat').addClass('active');
             })
    	 }
             
           
             
             
       }
    	 else
    		 {
          // document.getElementById("navig").style.backgroundColor = "#45BECF";
          document.getElementById("navig").style.backgroundColor = "#263238" ;
          document.getElementById("navig").style.border = "transparent";
           
          $('li').each(function () {
              $(this).removeClass('active');
              $('#serv').addClass('active');
          })
    		 }
          
        
          
          
    }
     
    else {
    	document.getElementById("navig").style.border = "transparent"; 
    	document.getElementById("navig").style.backgroundColor = "transparent";
     }
});


var sections = $('navbar')
, nav = $('nav')
, nav_height = nav.outerHeight();

$(window).on('scroll', function () {
var cur_pos = $(this).scrollTop();

sections.each(function() {
  var top = $(this).offset().top - nav_height,
      bottom = top + $(this).outerHeight();
  
  if (cur_pos >= top && cur_pos <= bottom) {
    nav.find('a').removeClass('active');
    sections.removeClass('active');
    
    $(this).addClass('active');
    nav.find('a[href="#'+$(this).attr('id')+'"]').addClass('active');
  }
});
});

nav.find('a').on('click', function () {
var $el = $(this)
  , id = $el.attr('href');

$('html, body').animate({
  scrollTop: $(id).offset().top - nav_height
}, 500);

return false;
});


</script>
<!-- //scrolling script -->

<!--bootstrap working-->
    <script src="${js}/bootstrap.min.js"></script>
    <script src="${js}/b.js"></script>
    <script src="${js}/a.js"></script>

 <!-- //bootstrap working-->        <!-- //Navigation -->
 



</body>




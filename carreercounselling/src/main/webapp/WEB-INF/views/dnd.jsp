<!DOCTYPE html>
<html lang="en">

<head>
<!--     <meta charset="utf-8"> -->
<!--     <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" /> -->
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<!--     Favicons -->
<%--     <link rel="apple-touch-icon" href="${img}/apple-icon.png"> --%>
<%--     <link rel="icon" href="${img}/favicon.png"> --%>
 

</head>
<%@ include file="nav2.jsp" %>
<style>
#div1 {
   background: #7b4397;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #dc2430, #7b4397);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #dc2430, #7b4397); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
   color:white;
    height: 500px;
    padding: 10px;
    border: 1px solid #aaaaaa;
    overflow:auto;
}
#div2 {
 background: #136a8a;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #267871, #136a8a);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #267871, #136a8a); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 
 	  color:white;
    height: 500px;
    padding: 10px;
    border: 1px solid #aaaaaa;
    overflow:auto;
}


</style>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="#pablo"><h1>DnD</h1></a>
                    </div>
                    
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid ">
                   <div class="row">
                      
                         <div class="card col-6" id="div2" ondrop="drop(event)" ondragover="allowDrop(event)">
                          <h4 class="card-title" style="font-size:2em;color:white;">Drag from here </h4>
                          
                          <hr>
                          <div class="card-body">
		  <h3 draggable="true" ondragstart="drag(event)" id="drag1" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> hello </h3>
		 <h3 draggable="true" ondragstart="drag(event)" id="drag2" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> hi </h3>
		  <h3 draggable="true" ondragstart="drag(event)" id="drag3" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> i </h3>
		   <h3 draggable="true" ondragstart="drag(event)" id="drag4" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> am </h3>
		    <h3 draggable="true" ondragstart="drag(event)" id="drag5" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> souvik </h3>
		     <h3 draggable="true" ondragstart="drag(event)" id="drag6" style="border:1px solid white;width:100px;text-align:center;border-radius:20px 20px 20px 20px;"> bai </h3>
                                
                                </div>
                                </div>
                                

                                
                            <div class="card col-6" id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" >
                                
                                    <h4 class="card-title" style="font-size:2em;color:white;">Drop here
                                     <hr></h4>
                                    <br>
                                   
                                    
                          <div class="card-body">
                         
                          </div>
                                  
                                </div>
                                
                          
                             
                        </div>
                          <center><button type="button" class="btn btn-primary btn-lg" style="width:40%;font-size:2em;">Save</button></center>
                        <!-- <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-category text-gray">CEO / Co-Founder</h6>
                                    <h4 class="card-title">Alec Thompson</h4>
                                    <p class="card-description">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
            <footer class="footer ">
                <div class="container-fluid">
                   
                </div>
            </footer>
        </div>
    </div>
    
    <script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
	
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
</script>
</body>
<!--   Core JS Files   -->
<!-- <script src="../assets/js/core/jquery.min.js"></script>-->
<script src="${js}/popper.min.js"></script>
<script src="${js}/bootstrap-material-design.js"></script>
<script src="${js}/perfect-scrollbar.jquery.min.js"></script>
<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="${js}/plugins/chartist.min.js"></script>
<!-- Library for adding dinamically elements -->
<script src="${js}/arrive.min.js" type="text/javascript"></script>
<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="${js}/bootstrap-notify.js"></script>
<!-- Material Dashboard Core initialisations of plugins and Bootstrap Material Design Library -->
<script src="${js}/material-dashboard.js?v=2.0.0"></script>
<!-- demo init -->
<script src="${js}/demo.js"></script>

</html>
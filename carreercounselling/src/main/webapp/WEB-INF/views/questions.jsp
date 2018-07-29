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
        <div class="main-panel">
         <script>
        var i=1;


        function shiftnext()
        {
            if(i==4)
                {i=1;}
            else
            {i=i+1;}
            var image="url(grad"+i+".png)";
            
            $("#myCarousel").carousel();
            $("#myCarousel").carousel("next");
            document.getElementById("cont").style.backgroundImage = image;
   

        }
    
        
    </script>
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="#pablo"><h1>DnD</h1></a>
                    </div>
                    
                </div>
            </nav> 
            <footer class="footer ">
                <div class="container-fluid">
<div class="container-fluid"  >
                    <div id="cont" class="card" style="background-image:url(grad1.png);">
                        <div class="card-header card-header-primary">
                            <h3 class="card-title">Questions</h3>
                            <p class="card-category">Please select the options and then move to the next question
                                
                            </p>
                        </div>
                        <div class="card-body" >
                           <div id="myCarousel" class="carousel slide carousel-fade" data-interval="false" >
    <!--Indicators-->
    
    <ol class="carousel-indicators">
        <li  data-slide-to="0" class="active"></li>
        <li  data-slide-to="1"></li>
        <li  data-slide-to="2"></li>
        <li  data-slide-to="3"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
            <div class="view">
                <img id="image1" class="d-block w-100" src="${img}/grad5.png" alt="First slide" style="height:400px;">
                <div class="mask rgba-black-light"></div>
            </div>
            <div class="carousel-caption">
                <div class="animated fadeInDown">
                <h3 class="h3-responsive">Question1</h3>
                <br><br><br>
                <form>
    <div class="segmented-control" style="width: 100%; color: #5FBAAC">
  <input type="radio" name="sc-1-1" id="sc-1-1-1" checked>
  <input type="radio" name="sc-1-1" id="sc-1-1-2">

  <label for="sc-1-1-1" data-value="yes" id="yes" style="color:white;" onclick="shiftnext();">Yes</label>
  <label for="sc-1-1-2" data-value="no" id="no" style="color:white;" onclick="shiftnext();">No</label>
</div>
                </form>
                <br><br>
            </div>
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <img id="image2" class="d-block w-100" src="${img}/grad2.png" alt="Second slide" style="height:400px;">
                <div class="mask rgba-black-strong"></div>
            </div>
                        <div class="carousel-caption">
                <div class="animated fadeInDown">
                <h3 class="h3-responsive">Question2</h3>
                <br><br><br>
                <form>
    <div class="segmented-control" style="width: 100%; color: #5FBAAC">
  <input type="radio" name="sc-1-2" id="sc-1-2-1" checked>
  <input type="radio" name="sc-1-2" id="sc-1-2-2">

  <label for="sc-1-2-1" data-value="yes" style="color:white;" onclick="shiftnext();">Yes</label>
  <label for="sc-1-2-2" data-value="no" style="color:white;" onclick="shiftnext();">No</label>
</div>
                </form>
                <br><br>
            </div>
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <img id="image3" class="d-block w-100" src="${img}/grad3.png" alt="Third slide" style="height:400px;">
                <div class="mask rgba-black-strong"></div>
            </div>
                        <div class="carousel-caption">
                <div class="animated fadeInDown">
                <h3 class="h3-responsive">Question3</h3>
                <br><br><br>
                <form>
    <div class="segmented-control" style="width: 100%; color: #5FBAAC">
  <input type="radio" name="sc-1-3" id="sc-1-3-1" checked>
  <input type="radio" name="sc-1-3" id="sc-1-3-2">

  <label for="sc-1-3-1" data-value="yes" style="color:white;" onclick="shiftnext();">Yes</label>
  <label for="sc-1-3-2" data-value="no" style="color:white;" onclick="shiftnext();">No</label>
</div>
                </form>
                <br><br>
            </div>
            </div>
        </div>

        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <img id="image4" class="d-block w-100" src="${img}/grad4.png" alt="Third slide" style="height:400px;">
                <div class="mask rgba-black-strong"></div>
            </div>
                        <div class="carousel-caption">
                <div class="animated fadeInDown">
                <h3 class="h3-responsive">Question4</h3>
                <br><br><br>
                <form>
    <div class="segmented-control" style="width: 100%; color: #5FBAAC">
  <input type="radio" name="sc-1-4" id="sc-1-4-1" checked>
  <input type="radio" name="sc-1-4" id="sc-1-4-2">

  <label for="sc-1-4-1" data-value="yes" style="color:white;" onclick="shiftnext();">Yes</label>
  <label for="sc-1-4-2" data-value="no" style="color:white;" onclick="shiftnext();">No</label>
</div>
                </form>
                <br><br>
            </div>
            </div>
        </div>
    </div>
                   
                </div>
            </footer>
        </div>
  
</body>
<!--   Core JS Files   -->
<!-- <script src="../assets/js/core/jquery.min.js"></script>-->
<script src="${js}/popper.min.js"></script>
<script src="${js}/bootstrap-material-design.js"></script>
<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="${js}/chartist.min.js"></script>
<!-- Library for adding dinamically elements -->
<script src="${js}/arrive.min.js" type="text/javascript"></script>
<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="${js}/bootstrap-notify.js"></script>
<!-- Material Dashboard Core initialisations of plugins and Bootstrap Material Design Library -->
<script src="${js}/material-dashboard.js?v=2.0.0"></script>
<!-- demo init -->
<script src="${js}/demo.js"></script>

</html>
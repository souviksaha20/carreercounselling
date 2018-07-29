<%@ include file="nav2.jsp" %>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href=""><h1>${d.getDime_name()}</h1></a>
                    </div>
                    
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content" >
                <div class="container-fluid">
                   
                   <c:forEach var = "q" items="${ql}">
                  
                    <div class="card">
                        <div class="card-header card-header-primary">
                           <c:set var = "salary" value = "${salary + 1 }"/>  
                            <h4 class="card-title">Question <c:out value = "${salary}"/></h4>
                            <p class="card-category">${q.getQuestion()} ?</p>
                        </div>
                        <div class="card-body" >
                            <div id="typography">
                                <div class="row">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="col-lg-3">
                                        <h5>
                                            <span class="tim-note"><input type="radio"></input></span> Yes</h5>
                                    </div>
                                    <div class="col-lg-3">
                                        <h5>
                                            <span class="tim-note"><input type="radio"></input></span> No</h5>
                                    </div>
                            
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
<!--                     <div class="card"> -->
<!--                             <div class="card-header card-header-primary"> -->
<!--                                 <h4 class="card-title">Question 2</h4> -->
<!--                                 <p class="card-category">Question question question question question question question question</p> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                                 <div id="typography"> -->
<!--                                     <div class="row"> -->
<!--                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                         <div class="col-lg-3"> -->
<!--                                             <h5> -->
<!--                                                 <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                         </div> -->
<!--                                         <div class="col-lg-3"> -->
<!--                                             <h5> -->
<!--                                                 <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                         </div> -->
                                
                                        
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="card"> -->
<!--                                 <div class="card-header card-header-primary"> -->
<!--                                     <h4 class="card-title">Question 3</h4> -->
<!--                                     <p class="card-category">Question question question question question question question question</p> -->
<!--                                 </div> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div id="typography"> -->
<!--                                         <div class="row"> -->
<!--                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                             <div class="col-lg-3"> -->
<!--                                                 <h5> -->
<!--                                                     <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                             </div> -->
<!--                                             <div class="col-lg-3"> -->
<!--                                                 <h5> -->
<!--                                                     <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                             </div> -->
                                    
                                            
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="card"> -->
<!--                                     <div class="card-header card-header-primary"> -->
<!--                                         <h4 class="card-title">Question 4</h4> -->
<!--                                         <p class="card-category">Question question question question question question question question</p> -->
<!--                                     </div> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div id="typography"> -->
<!--                                             <div class="row"> -->
<!--                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                 <div class="col-lg-3"> -->
<!--                                                     <h5> -->
<!--                                                         <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                                 </div> -->
<!--                                                 <div class="col-lg-3"> -->
<!--                                                     <h5> -->
<!--                                                         <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                                 </div> -->
                                        
                                                
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="card"> -->
<!--                                         <div class="card-header card-header-primary"> -->
<!--                                             <h4 class="card-title">Question 5</h4> -->
<!--                                             <p class="card-category">Question question question question question question question question</p> -->
<!--                                         </div> -->
<!--                                         <div class="card-body"> -->
<!--                                             <div id="typography"> -->
<!--                                                 <div class="row"> -->
<!--                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                     <div class="col-lg-3"> -->
<!--                                                         <h5> -->
<!--                                                             <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                                     </div> -->
<!--                                                     <div class="col-lg-3"> -->
<!--                                                         <h5> -->
<!--                                                             <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                                     </div> -->
                                            
                                                    
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="card"> -->
<!--                                             <div class="card-header card-header-primary"> -->
<!--                                                 <h4 class="card-title">Question 6</h4> -->
<!--                                                 <p class="card-category">Question question question question question question question question</p> -->
<!--                                             </div> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <div id="typography"> -->
<!--                                                     <div class="row"> -->
<!--                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                         <div class="col-lg-3"> -->
<!--                                                             <h5> -->
<!--                                                                 <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                                         </div> -->
<!--                                                         <div class="col-lg-3"> -->
<!--                                                             <h5> -->
<!--                                                                 <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                                         </div> -->
                                                
                                                        
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="card"> -->
<!--                                                 <div class="card-header card-header-primary"> -->
<!--                                                     <h4 class="card-title">Question 7</h4> -->
<!--                                                     <p class="card-category">Question question question question question question question question</p> -->
<!--                                                 </div> -->
<!--                                                 <div class="card-body"> -->
<!--                                                     <div id="typography"> -->
<!--                                                         <div class="row"> -->
<!--                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                             <div class="col-lg-3"> -->
<!--                                                                 <h5> -->
<!--                                                                     <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                                             </div> -->
<!--                                                             <div class="col-lg-3"> -->
<!--                                                                 <h5> -->
<!--                                                                     <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                                             </div> -->
                                                    
                                                            
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                             <div class="card"> -->
<!--                                                     <div class="card-header card-header-primary"> -->
<!--                                                         <h4 class="card-title">Question 8</h4> -->
<!--                                                         <p class="card-category">Question question question question question question question question</p> -->
<!--                                                     </div> -->
<!--                                                     <div class="card-body"> -->
<!--                                                         <div id="typography"> -->
<!--                                                             <div class="row"> -->
<!--                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                                                                 <div class="col-lg-3"> -->
<!--                                                                     <h5> -->
<!--                                                                         <span class="tim-note"><input type="radio"></input></span> Yes</h5> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="col-lg-3"> -->
<!--                                                                     <h5> -->
<!--                                                                         <span class="tim-note"><input type="radio"></input></span> No</h5> -->
<!--                                                                 </div> -->
                                                        
                                                                
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
                                                <div><center><button type="button" class="btn btn-primary" >Next</button></center></div>

            <footer class="footer ">
                <div class="container-fluid">
                   
                </div>
            </footer>
        </div>
    </div>
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



<%@ include file="nav2.jsp" %>


  <div class="col-md-8 offset-2" >
  <br>
<div class="card-header"><strong>Add Job</strong><small></small></div>
                      <div class="card-body card-block">
                      <c:url var="add" value="/admin/addedJob"></c:url>
                        <form:form  action="${add}" method="POST" commandName="Jobs">
                        <form:input type="hidden" path="job_id" class="form-control"></form:input>
                        <div class="form-group">
                          <label for="company" class=" form-control-label">Job name</label>
                          <form:input type="text" path="job_name" class="form-control"></form:input>
                        </div>
                        
                        <div class="form-group">
                          <label for="vat" class=" form-control-label">Job Discription</label>
                          <form:input type="text" path="job_desc" class="form-control"></form:input>
                        </div>
                        
                    
                        
                            <div class="card-footer">
                        <button type="submit" class="btn btn-primary btn-sm">
                          <i class="fa fa-dot-circle-o"></i> Submit
                        </button>
                        <button type="reset" class="btn btn-danger btn-sm pull-right">
                          <i class="fa fa-ban"></i> Reset
                        </button>
                      </div>
                      </form:form>
                      <center><button type="button" class="btn" onclick="hide()">View Jobs</button></center>
                          



                        </div>

                        </div>

                        <div class="col-md-8 offset-2" id="tab">
<div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table</strong>
                        </div>
                        <div class="card-body">
                  <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>Job Name</th>
      <th>Job Description Details</th>
      <th>Edit / Delete</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${jobs}" var="cc">
      <tr>
        <td>${cc.getJob_name()}</td>
        <td>${cc.getJob_desc()}</td>
        <td><a href="<c:url value="/admin/editJob/${cc.getJob_id()}"/>" class="btn btn-primary btn-xs" id="bt">Edit</a> / <a href="<c:url value="/admin/deleteJob/${cc.getJob_id()}"/>" class="btn btn-primary btn-xs" id="bt">Delete</a> 
      </tr>
      </c:forEach>
                  </tbody>
                  </table>
                        </div>
                    </div>
                </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
</div>
  
  
      

  

    <script src="${js}/lib/data-table/datatables.min.js"></script>
    <script src="${js}/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${js}/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${js}/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${js}/lib/data-table/jszip.min.js"></script>
    <script src="${js}/lib/data-table/pdfmake.min.js"></script>
    <script src="${js}/lib/data-table/vfs_fonts.js"></script>
    <script src="${js}/lib/data-table/buttons.html5.min.js"></script>
    <script src="${js}/lib/data-table/buttons.print.min.js"></script>
    <script src="${js}/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${js}/lib/data-table/datatables-init.js"></script>
  
  
<script>
  function hide() {
    var x = document.getElementById("tab");
    if (x.style.display === "block") {
        x.style.display = "none";
    } else {
        x.style.display = "block";
    }
}
 </script>
 <style type="text/css">
  #tab{
    display: none;
  }
</style>
 
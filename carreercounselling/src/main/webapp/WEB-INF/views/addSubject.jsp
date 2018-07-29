

<%@ include file="nav2.jsp" %>


  <div class="col-md-8 offset-2" >
  <br>
<div class="card-header"><strong>Add Job</strong><small></small></div>
                      <div class="card-body card-block">
                      <c:url var="add" value="/admin/addedSubject"></c:url>
                        <form:form  action="${add}" method="POST" commandName="Subjects">
                        <form:input type="hidden" path="sub_id" class="form-control"></form:input>
                        <div class="form-group">
                          <label for="company" class=" form-control-label">Subject name</label>
                          <form:input type="text" path="sub_name" class="form-control"></form:input>
                        </div>
                        
                        <div class="form-group">
                          <label for="vat" class=" form-control-label">Subject Description</label>
                          <form:input type="text" path="sub_desc" class="form-control"></form:input>
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
                      <center><button type="button" class="btn" onclick="hide()">View Subjects</button></center>
                          



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
                         <th>Subject Name</th>
      <th>Subject Description Details</th>
      <th>Edit / Delete</th>
  
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${subs}" var="cc">
      <tr>
        <td>${cc.getSub_name()}</td>
        <td>${cc.getSub_desc()}</td>
        <td><a href="<c:url value="/admin/editSubject/${cc.getSub_id()}"/>" class="btn btn-primary btn-xs" id="bt">Edit</a> / <a href="<c:url value="/admin/deleteSubject/${cc.getSub_id()}"/>" class="btn btn-primary btn-xs" id="bt">Delete</a> 
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
 
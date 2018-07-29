

<%@ include file="nav2.jsp" %>


  <div class="col-md-8 offset-2" >
  <br>
<div class="card-header"><strong>Add Question</strong><small></small></div>
                      <div class="card-body card-block">
                      <c:url var="add" value="/admin/addQuestions"></c:url>
                        <form:form  action="${add}" method="POST" commandName="Questions">
                        <form:input type="hidden" width="100%" class="form-control" path="que_id"/>
                        <div class="form-group">
                          <label for="company" class=" form-control-label">Add Question</label>
                          <form:input type="text" path="question" class="form-control" ></form:input>
                        </div>
                        
                        <div class="form-group">
                          <label for="vat" class=" form-control-label">Dimension</label>
                          <form:select path="dimension.Dime_id" class="form-control" id="sel1">
               <form:option value="-1" label="Choose a Dimension"/>
               <c:forEach items="${dims}" var="d">
               <form:option value="${d.getDime_id()} " label="${d.getDime_name()}"/>
               </c:forEach>
          </form:select>
          <form:errors path="dimension" class="error" />
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
                      <center><button type="button" class="btn" onclick="hide()">View Dimensions</button></center>
                          



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
                        <th>Dimension Name</th>
                        <th>Dimension Details</th>
                        <th>Edit / Delete</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="type" items="${haka}">
                      <tr>
                     <td >${type.key.getDime_name()}</td>
                     <td>
                     
                     <c:forEach var="a1" items="${type.value}">
                     <table> 
                     <tr>
                     <td colspan="8">
                      ${a1.getQuestion()}</td>
                      <td></td>
                      </tr>
                     </table>
                     </c:forEach>
                     
                     </td>
                     <td colspan="8">
                     </td>
                     
                     </tr>
                     
                    </c:forEach>
    <!-- <c:forEach items="${ques}" var="cc">
      <tr>
        <td>${cc.getQue_id()}</td>
        <td>${cc.getQuestion()}</td>
        <td>${cc.getDimension().getDime_name()}</td>
        <td><a href="<c:url value="/admin/editQuestions/${cc.getQue_id()}"/>" class="btn btn-primary btn-xs">Edit</a> / <a href="<c:url value="/admin/deleteQuestions/${cc.getQue_id()}"/>" class="btn btn-primary btn-xs">Delete</a> 
      </tr>
      </c:forEach> -->
                  </tbody>
                  </table>
                        </div>
                    </div>
                </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
</div>
  
  <style type="text/css">
  #tab{
    display: none;
  }
</style>
      

  

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
 

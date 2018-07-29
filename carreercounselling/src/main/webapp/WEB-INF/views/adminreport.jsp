<%@ include file="nav2.jsp" %>
<div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table1</strong>
                        </div>
                        <div class="card-body">
                  <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Taken Test?</th>
                        <th>Report</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${userlist}" var="cc">
                    <tr>
                    <td>${cc.getStud_uniq_code()}</td>
                    <td>${cc.getFname()}</td>
                    <td>${cc.getLname()}</td>
                    <td>${cc.getPhone_no()}</td>
                    <td>${cc.getEmail_id()}</td>
                    <td>${cc.getTakentest()}</td>
                    <td><c:if test="${cc.getTakentest() == 'No'}"><a  class="btn btn-primary btn-xs" id="bt">View Report</a></c:if><c:if test="${cc.getTakentest() == 'Yes'}"><a href="<c:url value="/admin/report/${cc.getReport().getRep_id()}"/>" class="btn btn-primary btn-xs" id="bt">View Report</a></c:if></td>
                    </tr>
                    </c:forEach>
                  </tbody>

                  </table>
                        </div>
                    </div>
                </div>
                
                </div>
            </div><!-- .animated -->
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


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
        
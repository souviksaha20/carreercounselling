<%@ include file="nav2.jsp"%>
<div class="breadcrumbs">
	<div class="col-sm-4">
		<div class="page-header float-left">
			<div class="page-title">
				<h1>Profile</h1>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="page-header float-right">
			<div class="page-title">
				<ol class="breadcrumb text-right">
					<li class="active"> Profile</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<security:authorize access="hasRole('ROLE_STUDENT')">
<div class="col-sm-12 col-lg-12">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-primary " data-color="azure">
					<center>
						<p class="card-category">Fill in only required changes</p>
					</center>
				</div>

				<div class="card-body">
					
					
						<div class="row">
							<div class="col-md-6">
								<input type="hidden" class="form-control" path="User_id"
									value="${user.getUser_id()}" />
								<div class="form-group">
									<label class="bmd-label-floating">User Id</label> <input
										type="text" path="stud_uniq_code"
										value="${user.getStud_uniq_code()}" class="form-control"
										disabled="disabled">
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label class="bmd-label-floating">School Name</label>
									<input type="hidden" path="school.school_id"
										class="form-control"
										value="${user.getSchool().getSchool_id()}" disabled="disabled" />
									<input type="text" class="form-control"
										value="${user.getSchool().getSchool_name()}"
										disabled="disabled">
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="bmd-label-floating">First Name</label>
									<input type="text" path="Fname" class="form-control"
										value="${user.getFname()}" disabled="disabled" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label class="bmd-label-floating">Last Name</label>
									<input type="text" path="Lname" class="form-control"
										value="${user.getLname()}" disabled="disabled" />
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label class="bmd-label-floating">Class</label>
									<input type="text" path="stud_class" class="form-control"
										value="${user.getStud_class()}" disabled="disabled" />
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label class="bmd-label-floating">Section</label>
									<input type="disabled" class="form-control" path="section"
										value="${user.getSection()}" disabled="disabled" />
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label class="bmd-label-floating">Register number</label>
										
									<input type="number" class="form-control" 
										value="${user.getRoll_no()}" disabled="disabled" />
								</div>
							</div>
						</div>



						<div class="row">
							<div class="col-md-6">
								<div class="form-group ">
									<label class="bmd-label-floating">Phone Number</label>
									<div class="input-group">
									<input type="text" id="pho"  class="form-control"
										value="${user.getPhone_no()}" />
									<div class="input-group-append">
										<a href="<c:url value="/editphone"/>" class="btn btn-primary pull-right">Update
								Phone Number </a>
									</div>
									</div>

								</div>
							</div>
							

							<div class="col-md-6">
								<div class="form-group">
									
								
										<a href="#" class=" pull-right"><u>Change Password</u> </a>
									
									</div>
									
								</div>
							</div>

						

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="bmd-label-floating">Email address</label>
									<div class="input-group">
									<input type="text" id="em"  class="form-control"
										value="${user.getEmail_id()}" />
									<div class="input-group-append">
										<a href="<c:url value="/editEmail"/>" class="btn btn-primary pull-right">Update
								Email Id </a>
									</div>
									</div>
									
								</div>
							</div>

						</div>
						<div class="row">


					
				</div>
			</div>
		</div>
		
	</div>

</div>
</div>
</security:authorize>
<security:authorize access="hasRole('ROLE_ADMIN')">
           <div class="col-sm-12 col-lg-12">
           <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-primary " data-color="azure" >
                                    <center>
                                    <p class="card-category">Fill in only required changes </p>
                                    </center>
                                </div>

                                <div class="card-body">
                                      <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>School Name</th>
                        <th>Registered For</th>
                        <th>Valid Until</th>
                        <th>Students Registered</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sc}" var="cc">
                    <tr>
                    <td>${cc.getSchool_name()}</td>
                    <td>${cc.getNo_of_studs()}</td>
                    <td>${cc.getRegister_to()}</td>
                    <td>${cc.getCount()}</td>
                    </tr>
                    </c:forEach>
                  </tbody>
                  </table>  
                                </div>
                            </div>
                        </div>
                        </div>
                        </div>
</security:authorize>
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
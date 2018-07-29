
<%@ include file="nav2.jsp" %>
  <div class="col-md-8 offset-2" >
  <br>
<div class="card-header"><strong>School Registration</strong><small> Form</small></div>
 <c:url var="add" value="/admin/addschool"></c:url>
                     <form:form action="${add}" method="post" commandName="school">
                      <div class="card-body card-block">
                      <form:input type="hidden" path="school_id" class="form-control"/>
                        <div class="form-group">
                          <label for="company" class=" form-control-label">Name</label>
                          <form:input type="text" id="school" path="school_name" placeholder="" class="form-control"/>
                        </div>
                        <div class="row form-group">
                        <div class="form-group col col-md-6">
                          <label for="vat" class=" form-control-label">Address Line 1</label>
                          <form:input type="text" path="address1" id="address1"  placeholder="" class="form-control"/>
                        </div>
                        <div class="form-group col col-md-6">
                          <label for="street" class=" form-control-label">Address Line 2</label>
                          <form:input type="text" id="add2" path="address2" placeholder="" class="form-control"/>
                        </div>
                      </div>
                        <div class="row form-group">
                          
                            <div class="form-group col col-md-3">
                              <label for="state" class=" form-control-label">State</label>
                              <form:input type="text" path="state"  placeholder="" class="form-control"/>
                            </div>
                            <div class="form-group col col-md-3">
                              <label for="city" class=" form-control-label">City</label>
                              <form:input type="text" path="city" id="city" placeholder="" class="form-control"/>
                            </div>
                        
                            <div class="form-groupcol col-md-3">
                              <label for="postal-code" class=" form-control-label">Pin Code</label>
                              <form:input type="text" id="postal-code" path="pincode" placeholder="560047" class="form-control"/>
                            </div>
                          
                            <div class="form-group col col-md-3">
                              <label for="nos" class=" form-control-label">Number of Students</label>
                              <form:input type="text" path="no_of_studs" id="nos" placeholder="" class="form-control"/>
                            </div>
                            
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


                        </div>

                        </div>
                     
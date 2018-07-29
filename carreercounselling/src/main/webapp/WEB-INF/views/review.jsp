<%@ include file="nav2.jsp"%>
<link rel="stylesheet" href="${css}/question1.css">

<script src="${js}/jquery.min.js"></script>
<script>
/* $(".example-5 .sendd").click(function() {
	alert("Frfrw");
	
}); */
 function showMessage(msg) {
	   var a=msg;
	   //alert("this is a "+a);
	   var ans=document.getElementById("ans"+msg).innerHTML;
	   $.ajax({
	    	type: "GET",
	    	url: 'modResult/',
	    	dataType: "json",
	    	data: {qId : a },
	    	success: function(data)
	        {
	    		if(data==1)
	    			document.getElementById("ans"+msg).innerHTML = "Yes" ;
	    		else
	    			document.getElementById("ans"+msg).innerHTML = "No" ;
	    		var ans1=document.getElementById("ans"+msg).innerHTML;
	    		document.getElementById("reply"+msg).innerHTML = "Your answer has been modified from "+ans+" to "+ans1;
	    		//document.getElementById("reply"+msg).style.textAlign = "justify";
	    		//alert(data);
	    		console.log(1);
	        },
	        error: function(){
	            alert("error");
	         }
	    });
	}; 
/* function myHandler(){
    //alert(myHandler.caller.arguments[0].target.id);
    var data=myHandler.caller.arguments[0].target.id;
    
    $.ajax({
    	type: "GET",
    	url: 'modResult/',
    	dataType: "json",
    	data: {qId : data },
    	success: function(data)
        {
    		alert(data);
    		console.log(1);
        },
        error: function(){
            alert("error");
         }
    }); */

/* $(".example-5 .sendd").click(function() {
	$.ajax({
    	type: "GET",
    	url: 'saveResult/',
    	dataType: "json",
    	data: {qId : obj[j].que_id,
    		   ans :0},
    	success: function(data)
        {
    		
    		var len=data.length;
    		var a=data[0];
    		var b=data[1];
    		var c=a/b*100;
    		console.log(1);
        },
        error:function(){
            alert("error");
         }
    }); */
</script>
<div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Review</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Review</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-12 col-sm-12 col-lg-12" >
	<div class="row">
		<div class="col-md-12 col-sm-12 col-lg-12" >
		 
            <div class="animated fadeIn">
                <div class="row" >

                    <div class="col-md-12">
<div class="slide slide5" >
	<a name="visual-feedback"></a>
	<div class="example example-5" >
	<c:forEach var="cc" items="${results}">
	             <div class="row ">
				<div id="card1" class="email" >
			<div id= "id1" class="masthead col-xs-12 col-md-12 col-lg-12 col-sm-12">${cc.getQuestion().getQuestion()}</div>
			<div class="col-md-3" style="margin-top:40px;">
			 <label>Your Answer : <label id="ans${cc.getQuestion().getQue_id()}"><c:if test="${cc.getAnswer() eq 1}"> Yes </c:if><c:if test="${cc.getAnswer() eq 0}"> No </c:if></label></label>
		    </div>
		     <div class=" col-md-4 col-xs-4 col-lg-4 col-sm-4 " >
			 <label id="reply${cc.getQuestion().getQue_id()}"></label>
		    </div>
		    
			<div class="col-md-5 col-xs-5 col-lg-5 col-sm-5 ">
			<div class="sendd"><div id="${cc.getQuestion().getQue_id()}" class="shutext1" onclick="showMessage(this.id);">Change</div></div>
		
		    </div>
		</div>
		</div>
	</c:forEach>
	</div>
	
	</div>  	
</div>
</div>
</div>
<div class='col-md-12'><br><br><center>
<div >
    	<c:url var="add" value="/userSubject"></c:url>
    	<form:form  action="${add}" method="GET">
    <input id="nxtBtn" type="submit" class="btn btn-primary"  value="Conform" style="width: 75%;height:80px;  font-size: 28px; background-color: #E74C3C;color: white;"  />
    </form:form>
</div></center><br><br>
</div>
</div>
</div>
</div>
        
<%@ include file="nav2.jsp"%>
<head>
<Style>
.button4{
  background:#029EB7;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.button4:hover{
  background:#fff;
  color:#029EB7;
}
.button4:before,.button4:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #029EB7;
  transition:400ms ease all;
}
.button4:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.button4:hover:before,.button4:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>
<script src="${js}/jquery.min.js"></script>
<script src="${js}/question.js"></script>
<link rel="stylesheet" href="${css}/question.css">
<script type="text/javascript">
	var paramOne =<c:out value="${noofrs}"/>
	var paramTwo =<c:out value="${noofqs}"/>
	var obj=[];
	var b=${ajf};
	var cres=${reslit};
	for(var k in b) {
		obj.push(b[k]);
	}
	var j=cres.length;
	var limit=obj.length;
$(document).ready(function(){
	if(j>limit-1)
	{
	document.getElementById("card1").style.display = 'none';
	}
	else{
		document.getElementById("card2").style.display = 'none';
	}
	document.getElementById("id1").innerHTML = "";
	document.getElementById("id1").innerHTML = obj[j].question;
	$(".example-5 .send").click(function() {
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
        });
		if(j==limit-1)
		{
			$(this)
		      .parents(".email")
		      .addClass("fuck-off");
		   setTimeout(function() {
			   document.getElementById("card1").style.display = 'none';
				
		    }, 900);
		   setTimeout(function() {
			   document.getElementById("card2").style.display = 'block';
			    }, 1800);
		}
		else
		{
			$(this)
		      .parents(".email")
		      .addClass("is-sent");
		    setTimeout(function(){
		    	document.getElementById("id1").innerHTML = "";
			    	document.getElementById("id1").innerHTML = obj[++j].question;
		    },500);
		    setTimeout(function() {
		      $(".email").removeClass("is-sent");
		    }, 1800);
		}
	});
	$(".example-5 .sendd").click(function() {
		$.ajax({
            type: "GET",
           	url: 'saveResult/',
           	dataType: "json",
           	data: {qId : obj[j].que_id,
           		   ans :1},
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
           });
		if(j==limit-1)
		{
			$(this)
		      .parents(".email")
		      .addClass("fuck-off");
		   setTimeout(function() {
			   document.getElementById("card1").style.display = 'none';
		    }, 900);
		   setTimeout(function() {
			   document.getElementById("card2").style.display = 'block';
			    }, 1800);
		}
		else
		{
			$(this)
		      .parents(".email")
		      .addClass("is-sent");
		    setTimeout(function(){ 
		    	document.getElementById("id1").innerHTML = "";
		    		document.getElementById("id1").innerHTML = obj[++j].question;
	  		},500);
		    setTimeout(function() {
		      $(".email").removeClass("is-sent");
		    }, 1800);
		}
	});
});
</script>
</head>

<div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Take Your Test</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Take Your Test </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

<div class="col-md-12 col-sm-12 col-lg-12">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-lg-12">
		 
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
<div class="slide slide5">
	<a name="visual-feedback"></a>
	<div class="example example-5">
		<div id="card1" class="email">
			<div id= "id1" class="masthead col-xs-12 col-md-12 col-lg-12 col-sm-12"><div></div></div>
			<div class=" col-md-6">
			<div id="id2" class="sendd"><div class="shutext1">Yes</div></div>
		    </div>
		    <div class="col-md-6">
			<div id="id3" class="send"><div class="shutext1">No</div></div>
		     </div>
		    
		</div>
		<div id="card2" class="email col-xs-12 col-md-12 col-lg-12 col-sm-12 " Style="text-align:center;">
		   <div  class="col-xs-12 col-md-12 col-lg-12 col-sm-12 ">
		   <br>
	       <p style="text-align:center;color:black">You have completed the test. Click on the button below to review your answers.</p><br>
	       <c:url var="add" value="/review"></c:url>
	       <form  action="${add}" method="GET">
	        <button type = "submit" class="button4">Review My Answers</button>
	        </form>
	      </div>
	      
	   	</div>
	   	
	</div>
	</div>
	</div>
</div>
</div>
		 
		</div>
	</div>
</div>

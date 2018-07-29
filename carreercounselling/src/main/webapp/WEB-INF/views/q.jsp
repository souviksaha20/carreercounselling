<%@ include file="nav2.jsp"%>
<head>
<script src="${js}/jquery.min.js"></script>
<script src="${js}/circle-progress.js"></script>
<script src="${js}/question.js"></script>
<script>
var paramOne =<c:out value="${noofrs}"/>
var paramTwo =<c:out value="${noofqs}"/>
//alert(paramOne);
var obj=[];
var b=${ajf};
var cres=${reslit};
for(var k in b) {
	  //alert(JSON.stringify(b[k].question));
	  //var and=JSON.stringify(b[k].question);
	  //alert(JSON.stringify(and));
	   obj.push(b[k]);
	}
var fakelimit=obj.length;
//alert(obj.length);
//alert("fakelimit "+fakelimit);
var limit = fakelimit - 1;
//alert(JSON.stringify(obj[0]));
/* alert(paramOne);
alert(paramTwo); */
var yay=paramOne/paramTwo*100;
/* alert(yay); */
function myfunc(c) {
	
	var c4 = $('.forth.circle');
	var a=$('#aq').val();
	/* alert(c); */
	  c4.circleProgress({
	    startAngle: -Math.PI / 4 * 3,
	    value: c/100,
	    lineCap: 'round',
	    fill: {gradient: [['#4ac5f8', .5],['#0681c4', .4],], gradientAngle: -Math.PI / 4 * 3 },
	  }).on('circle-animation-progress', function(event, progress) {
	    $(this).find('strong').html(Math.round(c * progress) + '<i>%</i>');
	  });
}
var j=cres.length;
//alert(obj[j].question);

document.getElementById("rock").innerHTML = (obj[j].question);
alert("fdF");
$(document).ready(function(){
	alert("gFsg");
	
	//alert("limit "+limit);
	//alert(j +" and "+limit);
		/* if(j>limit)
		{
			//alert("Gergrege");
			var x = document.getElementById("card1");
			x.style.display = 'none';
			//x.style.display === "none";
			//document.getElementById("id1").innerHTML = "Test over asshole";
		}
		else
		{ */
			//alert("Gergrege");
			
			
			alert(document.getElementById("id1"));
			document.getElementById("id1").innerHTML = (obj[j].question);
		//}
	$(".example-5 .send").click(function() {
		//alert("Gergre");
		if(j<obj.length)
	    {
			
			var n=0;
			//alert("j is "+j+" and obj.length is "+limit);
			//alert(obj[j].que_id);
			//shiftnext(obj[j].que_id,n);
			//alert("Cwde");
			$.ajax({
            	type: "GET",
            	url: 'saveResult/',
            	dataType: "json",
            	data: {qId : obj[j].que_id,
            		   ans :n},
            	success: function(data)
                {
            		var len=data.length;
            		alert(len);
            		var a=data[0];
            		var b=data[1];
            		var c=a/b*100;
            		//alert(data);
            		//myfunc(c);
            		console.log(1);
                },
                error:function(){
                    alert("error");
                 }
            });
			if(j==limit)
			{
				var x = document.getElementById("card1");
				var y = document.getElementById("card2");
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
			    	document.getElementById("id1").innerHTML = (obj[++j].question);
		    },500);
		    setTimeout(function() {
		      $(".email").removeClass("is-sent");
		    }, 1800);
	    }
	    }
	    
	  });
	 $(".example-5 .sendd").click(function() {
		 if(j<obj.length)
	    	{
			 var y=1;
			 $.ajax({
	            	type: "GET",
	            	url: 'saveResult/',
	            	dataType: "json",
	            	data: {qId : obj[j].que_id,
	            		   ans :y},
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
			 if(j==limit)
				{
					var x = document.getElementById("card1");
					var y = document.getElementById("card2");
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
			    		document.getElementById("id1").innerHTML = (obj[++j].question);
		    		},500);
			    setTimeout(function() {
			      $(".email").removeClass("is-sent");
			    }, 1800);
	    	}
	    	}
	  });
	  myfunc(yay);
});
</script>
				<script>
					var i = 1;
				
				
					function shiftnext(q, a) {
						$.ajax({
							type : "GET",
							url : 'saveResult/',
							dataType : "json",
							data : {
								qId : q,
								ans : a
							},
							success : function(data) {
								var len = data.length;
								var a = data[0];
								var b = data[1];
								var c = a / b * 100;
								//alert(data);
								//myfunc(c);
								console.log(1);
							},
							error : function() {
								alert("error");
							}
						});
				
						if (i == 4) {
							i = 1;
						} else {
							i = i + 1;
						}
						var image = "url(${img}/grad" + i + ".png)";
				
						$("#myCarousel").carousel();
				
						$("#myCarousel").carousel("next");
				
						document.getElementById("cont").style.backgroundImage = image;
					}
				</script>
</head>
<link rel="stylesheet" href="${css}/question.css">
<body>
<div class="breadcrumbs">
	<div class="col-sm-4">
		<div class="page-header float-left">
			<div class="page-title">
				<h1>Take A Test</h1>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="page-header float-right">
			<div class="page-title">
				<ol class="breadcrumb text-right">
					<li class="active">Take A Test</li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="col-sm-12 col-lg-12">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div id="cont" style="background-image:url(${img}/grad1.png);">

					<div class="progress blue pull-right">
						<span class="progress-left"> <span class="progress-bar"></span>
						</span> <span class="progress-right"> <span class="progress-bar"></span>
						</span>
						<div class="progress-value">40%</div>
					</div>
				</div>

				<div class="slide slide5">
					<a name="visual-feedback"></a>
					<div class="example example-5">
						<div id="card1" class="email">

							<div id= "id1" class="masthead"><div  class="shutext"></div></div>
							<div id="id2" class="sendd"><div class="shutext1">Yes</div></div>
							<div id="id3" class="send"><div class="shutext1">No</div></div>
						</div>
						<div id="card2" class="email">
					       <p><center>Test over</center></p>
					       <div id= "id4" class="hosh"><div  class="shutext1">View Result</div></div>
				           <div id= "id5" class="hosh"><div  class="shutext1">Review</div></div>
				       </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

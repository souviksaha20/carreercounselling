<!DOCTYPE html>
<html lang="en">
<%@ include file="nav2.jsp" %>
<style>
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 14px 42px;
  font-size: 16px;
  cursor: pointer;
  float : right;
}

/* Green */
.success {
  border-color: #E74C3C;
  color: #E74C3C;
}

.success:hover {
  background-color: #E74C3C;
  color: white;
}

.panel {
	width: 300px;
	border-left=: 1px solid #999;
	overflow-y: scroll;
	padding: 20px;
	position: absolute;
	-webkit-transition: margin-right .125s ease; /* For Safari 3.1 to 6.0 */
	transition: margin-right .125s ease;
	float: right;
	height: 90%;
	background: white;
	z-index: 101;
}
.panel.hidden {
	margin-right: 0px;
}

.dragging {
	box-shadow: 0 0 12px 0px rgba(0,0,0,.8);
}

.list {
	list-style-type: none;
	padding: 10px 0;
}

.drag-item {
	display: block;
	border: 1px solid #999;
	padding: 20px;
	margin-bottom: 10px;
	width: 260px;
	background: white;
	border-radius: 3px;
}

.m0 {
	margin: 0;
}

.mt0 {
	margin-top: 0;
}

.moving {
	background: blue;
	color: white;
}

#drop-target-one {
  padding: 20px;
  background: #CCC;
  overflow-y: scroll;
  height: 90%;
  position: absolute;
  width: 57%;
  right:2px;
}

#drop-target-one.over {
  background: #999;
	overflow-y: scroll;
}
</style>
<div id="dd-elements" class="clearfix">
	<div class="panel">
    	<p class="mt0"><strong>Drag some items</strong></p>
    	<c:forEach var="cc" items="${subs}">
    		<div class="drag-item" draggable="true" id="${cc.getSub_id()}">${cc.getSub_name()}</div>
    	</c:forEach>
  	</div>
  	<div id="drop-target-one" class="panel"><p class="mt0" style="color:white;"><strong>Drop some items</strong></p>
		<c:forEach var="cc" items="${usulist}">
			<div class="drag-item" draggable="true" id="${cc.getSubject().getSub_id()}">${cc.getSubject().getSub_name()}</div>
    	</c:forEach>
    	
    	
	</div>
	
    	<div style="position:fixed;bottom:30px;right:40px; z-index:999" >
    	<c:url var="add" value="/userStrength"></c:url>
                      
    <form:form  action="${add}" method="GET">
    <input id="nxtBtn" type="submit" class="btn success" value="Next" disabled />
    </form:form>
    
    	<!-- <a href=<c:url value="/userStrength"/> id="nxtBtn" type="button" class="btn success" disabled>Next</a> -->
</div>
	
</div>

<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script>
//document.getElementById("nxtBtn").disabled = false;
var a=$('#drop-target-one').children().size()
//var mod=${usuAr}.length;

window.onload = function() {
	if (a>=6)
		document.getElementById("nxtBtn").disabled = false;
	else
		document.getElementById("nxtBtn").disabled = true;
	document.getElementById("nxtBtn").click
  var dropZoneOne = document.querySelector('#drop-target-one');
  var dropZoneTwo = document.querySelector('#dd-elements');
  var dragElements = document.querySelectorAll('.panel div');
  console.log(dragElements);
  var elementDragged = null;

  for (var i = 0; i < dragElements.length; i++) {if (window.CP.shouldStopExecution(1)){break;}
    // Event Listener for when the drag interaction starts.
    dragElements[i].addEventListener('dragstart', function(e) {
      e.dataTransfer.effectAllowed = 'move';
      e.dataTransfer.setData('text', this.id);
      elementDragged = this;
      $(elementDragged).addClass('dragging');
    });
    // Event Listener for when the drag interaction finishes.
    dragElements[i].addEventListener('dragend', function(e) {
      elementDragged = null;
    });
    
  }
window.CP.exitedLoop(1);
;

  // Event Listener for when the dragged element is over the drop zone.
  dropZoneOne.addEventListener('dragover', function(e) {
  if (e.preventDefault) {
  e.preventDefault();
  }
  $('.panel').addClass('hidden');

  e.dataTransfer.dropEffect = 'move';

  return false;
  });
  dropZoneTwo.addEventListener('dragover', function(e) {
	  if (e.preventDefault) {
	  e.preventDefault();
	  }
	  $('.panel').addClass('hidden');

	  e.dataTransfer.dropEffect = 'move';

	  return false;
	  });
  // Event Listener for when the dragged element enters the drop zone.
  dropZoneOne.addEventListener('dragenter', function(e) {
  document.querySelectorAll('.panel').className = "hidden";
  this.className = "over";
  console.log(this);
  });

  // Event Listener for when the dragged element leaves the drop zone.
  dropZoneOne.addEventListener('dragleave', function(e) {
  this.className = "";
   
  });

  // Event Listener for when the dragged element dropped in the drop zone.
  dropZoneOne.addEventListener('drop', function(e) {
    if (e.preventDefault) e.preventDefault(); 
    var data = e.dataTransfer.getData("text");
    $.ajax({
    	type: "GET",
    	url: 'addedMySubject/',
    	dataType: "json",
    	data: {sId : data },
    	success: function(data)
        {
    		console.log(1);
    		var a=$('#drop-target-one').children().size()
    		if (a>=6)
    			document.getElementById("nxtBtn").disabled = false;
    		else
    			document.getElementById("nxtBtn").disabled = true;
        },
        error:function(){
        	console.log("Did that bt");
         }
    });
    
    
    if (e.stopPropagation) e.stopPropagation();
    
    $(elementDragged).removeClass('dragging');

    $('#drop-target-one').append(elementDragged);
    $('.panel').removeClass('hidden');
    // Remove the element from the list.
    document.querySelector('.panel').removeChild(elementDragged);
    elementDragged = null;
    return false;
  });
  dropZoneTwo.addEventListener('drop', function(e) {
	  if (e.preventDefault) e.preventDefault(); 
	  var data = e.dataTransfer.getData("text");
	  $.ajax({
	    	type: "GET",
	    	url: 'deleteMySubject/',
	    	dataType: "json",
	    	data: {sId : data },
	    	success: function(data)
	        {
	    		var a=$('#drop-target-one').children().size()
	    		console.log(1);
	    		if (a>=6)
	    			document.getElementById("nxtBtn").disabled = false;
	    		else
	    			document.getElementById("nxtBtn").disabled = true;
	        },
	        error:function(){
	        	var a=$('#drop-target-one').children().size()
	    		if (a>=6)
	    			document.getElementById("nxtBtn").disabled = false;
	    		else
	    			document.getElementById("nxtBtn").disabled = true;
	        	console.log("Did that bt");
	         }
	    });
	    if (e.stopPropagation) e.stopPropagation();
	    
	    $(elementDragged).removeClass('dragging');

	    $('.panel').append(elementDragged);
	    
	    // Remove the element from the list.
	   
	    elementDragged = null;

	    return false;
	  });
};

//# sourceURL=pen.js
</script>
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
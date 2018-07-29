<%@ include file="nav2.jsp"%>
<script type="text/javascript">
    function display(el) {
    	//alert(el);
    	/* var contents = $('#id');
        alert(contents); */
        $(el)
        .parents(".container")
        .addClass("is-transitioned");
        //alert(contents);
        /* var id = $(el).attr('id');
        
        var contents = $('#id');
        //alert(contents);
        $(contents)
        .parents(".container")
        .addClass("is-transitioned");
        alert(contents); */
    }
</script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link  rel="stylesheet" href="${css}/rev.css">
<div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Review Test</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Review Test</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>


<div class="col-sm-12 col-lg-12">
	<div class="row">
		<div class="col-md-12">
	       <div class="container1">
	<div class="container">
		<div class="front side">
			<c:forEach var="cc" items="${results}">
				<div class="content">
					<h1>Q1</h1>
					<p>${cc.getQuestion().getQuestion()}</p>
					<p><input id="${cc.getQuestion().getQue_id()}" class="white-mode" type="button" value="Click to edit" OnClick="display(this);"/></p>
					<%-- <p><button class="white-mode" id="${cc.getQuestion().getQue_id()}" onclick="call(this.id)"> Click to edit</button></p>--%>
				</div>

				<div class="back side">
					<div class="content">
						<h1>Edit</h1>
						<form:form method="POST" commandName="Resultss">
							<div class="form-group">
								<label for="name">Your Answer</label> <label for="name">${cc.getAnswer()}</label>
								<label>Your New Answer</label> <input type="text" placeholder="Yes/No">
							</div>

							<div class="form-group no-margin">
								<button type="submit" class="btn btn-primary btn-block">
									<h2>Save</h2>
								</button>
							</div>
						</form:form>
						<p><button class="white-mode" id="thistwo">Submit</button></p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	    </div>
	</div>
</div>


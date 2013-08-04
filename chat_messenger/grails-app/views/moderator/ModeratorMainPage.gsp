<html lang="en">
<head>

	<meta name="layout" content="moderatorMainPage"/>
	<meta charset="utf-8">
	<title>Moderator Main Page</title>

</head>
<body>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap-modal.js"></script>

	<div align="center" class="container">
		<div id="example" class="modal hide fade in" style="display: none; ">
        	<div class="modal-header" align="left">
            	<a class="close icon-remove" data-dismiss="modal"></a>
				<h3>Please fill out the form</h3>
            </div>
            <div class="modal-body">
            	<g:form controller="moderator" action="addEmployee">
					Firstname:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="firstName" required="true"/>
					<br/>
					Lastname: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lastName" required="true"/>
					<br/>
					Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="address" required="true"/>
					<br/>
					Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="userName" required="true"/>
					<br/>
					Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="password" required="true"/>
					<br/>
					Confirm Password:<input type="text" name="confirmPassword" required="true"/>
					<br/>
					<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn btn-primary btn-large" value="Add"></center>
				</g:form>
            </div>
            <div class="modal-footer">
            	<a href="#" class="btn btn-secondary btn-large" data-dismiss="modal">Close</a>
            </div>
        </div>
	</div>
	
	<section id="info">
		<center><a data-toggle="modal" href="#example" class="btn btn-primary btn-large">Add Employee</a><br/><br/></center>
	</section>
	
</body>
</html>
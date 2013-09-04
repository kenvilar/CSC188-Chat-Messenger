<html>
    <head>
		<title>User Main Page</title>
		
		<g:javascript library="jquery"/>
		<r:layoutResources/>
		<jq:jquery>
			$(':submit').click(function() {
				$('#nameList').toggle('slow');
			});
		</jq:jquery>
		
	
	<script src="../js/jquery-1.8.3.js"></script>
	<script src="../js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="../css/usermainpage.css"/>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap-modal.js"></script>
	</head>
    <body>
		<div class="navbar">
		<br/>
			<div align="right"><font color="white">You are currently logged in as</font></div>
			
			<div class="btn-group pull-right">
					<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">${employee} <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a data-toggle="modal" href="#edit">Edit Profile</a></li>
						<li><a data-toggle="modal" href="#show">Show Profile</a></li>
						<li class="">
							<a href="${createLink(uri: '/logout')}">
								<g:message code="Logout"/>
							</a>
						</li>
					</ul>
			</div>
		</div>
		
		<div id="bodyDesign">
	
			<div id="toggle">
			<input type="submit" value="Hide/Show">
			</div>
		
			<div id="nameList">
				<g:each in="${result}" var="user">
					<div id="names">
					<table>
						<tr>
							<td id="icon"><a href="123"><img class="logo" src="../images/icon1.png"></a></td>
							<td><a id="hname" href="#profileModal" data-toggle="modal">${user.first_name} ${user.last_name}</a></td>
							
							<div id="arrow">
							<a href=""></a>
							</div>
							
						</tr>
					</table>
					</div>
					<hr>
				</g:each>
			</div>
		
			<div id="conversation">
				<div style="height:100%; width:100%; overflow:scroll;">
				
				
			
				</div>
			</div>
			
			
			<div id="message_pane">
				
				 <table>
					<tr>
						<td>
							<textarea class="field span11" id="textarea" rows="4" placeholder="Write a message...">
							</textarea>
						</td>
						<td id="send">
						<button align="left" type="button" class="btn btn-large btn-primary" data-loading-text="Loading...">SEND</button>
						</td>
					</tr>
				 </table>
				 
				
				
				
			</div>

			
			
			<div id="profileModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" area-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h1> Profile </h1>
					
				</div>
				<div class="modal-body">
					<table id="profile">
						<tr>
							<td>Name: </td>
							
						</tr>
						
						<tr>
							<td>Address: </td>					
						</tr>
						<tr>
							<td>Age:  </td>					
						</tr>
						<tr>
							<td>Civil Status: </td>					
						</tr>
						<tr>
							<td>Gender: </td>					
						</tr>
					</table>
					
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		<div>


		<div align="center" class="container">
			<div id="edit" class="modal hide fade in" style="display: none; ">
				<div class="modal-header" align="left">
					<a class="close icon-remove" data-dismiss="modal">X</a>
					<h1>Please fill out the form</h1>
				</div>
				<div class="modal-body">
					<g:form controller="moderator" action="addEmployee">
						<table id="profile" align="left"> 
							<tr >
								<td>Name</td> <td><input type="text" name="firstName" required="true"/> </td>
							</tr>
							<tr>
								<td>Address</td> <td><input type="text" name="address" required="true"/> </td>
							</tr>
							<tr>
								<td>Age</td> <td><input type="text" name="address" required="true"/> </td>
							</tr>
							<tr>	
								<td>Civil Status</td> <td><input type="text" name="civil" required="true"/> </td>
							</tr>
							<tr>	
								<td>Gender</td> <td><input type="text" name="gender" required="true"/> </td>
								
							</tr>
						
						</table>
						
						
						
					</g:form>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="Edit">
					<a href="#" class="btn btn-secondary" data-dismiss="modal">Close</a>
				</div>
			</div>
		</div>
		
		<div align="left" class="container">
			<div id="show" class="modal hide fade in" style="display: none; ">
				<div class="modal-header" align="left">
					<a class="close icon-remove" data-dismiss="modal">X</a>
					<h1>My Profile</h1>
				</div>
				<div class="modal-body">
					<g:form controller="User" action="addEmployee">
						<table id="profile">
						<tr>
							<td>Name:</td>
						</tr>
						<tr>
							<td>Address:</td> 
						</tr>
						<tr>
							<td>Age:</td>
						</tr>
						<tr>
							<td>Civil Status:</td>
						</tr>
						<tr>
							<td>Gender:</td>
						</tr>
						</table>
					</g:form>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-secondary" data-dismiss="modal">Close</a>
				</div>
			</div>
		</div>
		
		
		
		
		
	</body>
</html>
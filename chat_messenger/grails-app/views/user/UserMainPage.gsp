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
	</head>
    <body>
		<div class="navbar">
			
			
		</div>
		
		
		<div id="bodyDesign">
	
			<div id="toggle">
			<input type="submit" value="               Hide/Show              ">
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
							<textarea class="field span12" id="textarea" rows="4" placeholder="Enter a short synopsis">
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
		
		
		
		
		
		
		
		
	</body>
</html>
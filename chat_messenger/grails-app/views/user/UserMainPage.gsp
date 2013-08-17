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
		<style> 
			#nameList{
				border:2px solid #a1a1a1;
				padding:10px 20px; 
				background:white;
				width:23%;
				height:85%;
				//border-radius:25px;
				float:left;
			}
			
			#bodyDesign{
				
				
				
			
			}
			.navbar{
				margin-top:-10px;
				margin-left:-10px;
				height:7%;
				background:black;
			}
			
			#conversation{
				border:2px solid #a1a1a1;
				padding:10px 40px; 
				height: 70%;
				width: 68%;
				float:right;
				background:white;
			
			}
			
			#message_pane{
				border:2px solid #a1a1a1;
				height: 12%;
				width: 73.5%;
				float:right;
				background:white;
				margin-top: 1em;
			}
			
			#names:hover{
				background:#C0C0C0;
			}
			#names{
				width:100%;
				padding-top:.5em;
				margin-top:-.5em;
				margin-bottom:-.5em;
				height: 2em;
				font-size:2em;
			}
			body{
			
				background:#dddddd;
			
			}
			#icon{
			
			padding-right:2em;
			
			
			}
			#arrow{
			
				float:right;
				
			}
			
			#hname:hover{
			
			color:blue;
			
			}
			
			#profile tr{
				padding-top:1em;
				margin-top:1em;
			}
			#profile td{
				padding-top:2em;
				margin-top:1em;
			}
			
			#send{
				float:right;
				margin-top:-1em;
				padding-left:1em;
			}
			textarea:{
			
				width:100%;
			}
			
	</style>
	
	<script src="../js/jquery-1.8.3.js"></script>
	<script src="../js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
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
				 <table>
					<tr>
						<td>
							<textarea class="field span12" id="textarea" rows="4" placeholder="Enter a short synopsis">
							</textarea>
						</td>
						<td id="send">
						<button type="button" class="btn btn-large btn-primary" data-loading-text="Loading...">Loading state</button>
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
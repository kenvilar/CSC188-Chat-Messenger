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
				height:100%;
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
				height: 25%;
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
	</style>
	
	
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
							<td id="icon"><a><img class="logo" src="../images/icon1.png"></a></td>
							<td>${user.first_name} ${user.last_name}</td>
							
						</tr>
					</table>
					</div>
					<hr>
				</g:each>
			</div>
		
			<div id="conversation">
			
			</div>
			
			<div id="message_pane">
			
			</div>
		<div>
		
	</body>
</html>
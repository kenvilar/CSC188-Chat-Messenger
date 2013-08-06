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
				padding:10px 40px; 
				background:#dddddd;
				width:300px;
				border-radius:25px;
			}
		</style>
	</head>
    <body>
		<div id="toggle">
			<input type="submit" value="Hide/Show">
		</div>
		<div id="nameList">
			<g:each in="${result}" var="user">
				<table>
					<tr>
						<td>${user.first_name} ${user.last_name}</td>
					</tr>
				</table>
			</g:each>
		</div>
	</body>
</html>
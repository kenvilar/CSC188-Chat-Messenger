<html>
    <head>
		<title>User Main Page</title>
		<g:javascript library="jquery"/>
		<r:layoutResources/>
		<jq:jquery>
			
		</jq:jquery>
	</head>
    <body>
		
		<div id="try">
		<h1>Welcome!</h1>
		</div>
		
		<div>
			<table border="1">
				<g:each in="${result}" var="user">
					<tr>
						<td>${user.first_name} ${user.last_name}</td>
					</tr>
				</g:each>
			</table>
		</div>
	</body>
</html>
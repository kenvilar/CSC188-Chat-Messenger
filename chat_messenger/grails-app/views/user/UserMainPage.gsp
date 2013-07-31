<html>
    <head><title>User Main Page</title></head>
    <body>
		<div>
		<h1>Welcome!</h1>
		</div>
		
		<div>
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
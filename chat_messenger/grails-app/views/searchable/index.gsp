<html>
<head>
    
</head>
<body>
        <g:each var="employee" in="${searchResult?.results}">
        <div id="name">
            ${employee.firstName}  ${employee.lastName}<g:link id="${employee.id}" action="startConversation" controller="message"> Start Conversation</g:link>
            </div>
        </g:each>
</body>
</html>
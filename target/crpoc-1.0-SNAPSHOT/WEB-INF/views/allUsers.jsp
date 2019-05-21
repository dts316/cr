<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>All Users</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/main.css" rel="stylesheet">
</head>
<body>
<div class="container">
    
    <h2>Displaying All Users</h2>
    	<div>
	      <input class = "searchField" type="text" id="searchFirstName" onkeyup="searchFirstName()" placeholder="Search By First Name" style="width:200px;">
	      <input class = "searchField" type="text" id="searchLastName" onkeyup="searchLastName()" placeholder="Search By Last Name" style="width:200px;">
	      <a href="/welcome"><span class="label label-info">Home</span></a>
	      <a href="/h2" target="_blank"><span class="label label-info">Access Database Here</span></a>
	   	  <span class="label label-success">scroll to see all users</span>
	    </div>
	
    <div style="overflow-y:auto; height: 400px;">
                    	
        <table id="userTable" class="table table-hover">
				<tr>
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
				</tr>
			<c:forEach items="${users}" var="user" varStatus="loop">
				<tr>
					<td>${user.id}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.emailId}</td>
				</tr>
			</c:forEach>
		</table>
			
	</div>
	
    <a class="btn btn-primary btn-block" href="/registration" role="button">Register More Users</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script>
function searchFirstName() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchFirstName");
  filter = input.value.toUpperCase();
  table = document.getElementById("userTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
function searchLastName() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchLastName");
  filter = input.value.toUpperCase();
  table = document.getElementById("userTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>
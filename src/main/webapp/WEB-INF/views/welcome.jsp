<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Welcome</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/main.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
            <div style="text-align:center">
            	<h2>Consumer Reports - Evaluation Project</h2>
            	<c:if test="${userFormRedirected != null}">
            	<div class="alert alert-success" role="alert">
					<div>Registration Successful! ${userFormRedirected.firstName} was added!</div>
				</div>
				</c:if>
            </div>
     
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <h3>Welcome</h3>
                    <div class="card">
						<div class="card border-primary mb-3">
						  <h5 class="card-header">Notes</h5>
						  <div class="card-body" style="border:1px;">
						    <p class="card-text">Added Rest Service for querying user data. Also
						    	populated table to have something to work with. 10 users have been added and new user's id will begin at 11.
						    	For access to in memory database click link below. 
						    </p>
						    <a href="/h2" target="_blank"><span class="label label-info">Access In-Memory (H2) Database</span></a>
						  </div>
						</div>
					</div>
                    
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                	<h3>Add User</h3>
                		<p>Click below to register more users</p>
                		<a class="btn btn-primary btn-block" href="/registration" role="button">Register User</a>
                	<h3>View Users</h3>
            			<p>Click below to view all users in tabular form</p>
            			<a class="btn btn-primary btn-block" href="/allUsers" role="button">View All Users</a>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <h3>Registered Users</h3>
                    
                    <div style="overflow-y:auto; height: 190px;">
                    	
                    	<table class="table">
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
							</tr>
						<c:forEach items="${users}" var="user" varStatus="loop">
							<c:if test="${loop.last}">
								 
									<span class="label label-success">
										Last Entry: ${user.firstName} ${user.lastName} ${user.emailId}
									</span>
								
							</c:if>
							<tr>
								<td>${user.firstName}</td>
								<td>${user.lastName}</td>
								<td>${user.emailId}</td>
							</tr>
						</c:forEach>
						</table>	
					</div>
					
                </div>        
</div>
<div class="placeHolder" style="margin:100px;"></div>

<div style="width:500px;margin:auto;">
<h3 style="text-align:center">REST Service</h3>
	<table class="table table-sm">
	  <thead>
	    <tr>
	      <th scope="col">Method</th>
	      <th scope="col">Function</th>
	      <th scope="col">URI</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">GET</th>
	      <td>Get all users</td>
	      <td>http://localhost:8080/users</td>
	    </tr>
	    <tr>
	      <th scope="row">GET</th>
	      <td>Get user by ID</td>
	      <td>http://localhost:8080/users/{id}</td>
	    </tr>
	    <tr>
	      <th scope="row">POST</th>
	      <td>Add user</td>
	      <td>http://localhost:8080/users</td>
	    </tr>
	    <tr>
	      <th scope="row">DELETE</th>
	      <td>Delete user by ID</td>
	      <td>http://localhost:8080/users/{id}</td>
	    </tr>
	  </tbody>
	</table>
</div>
<!-- <div class="card" style="width:500px;margin:auto;">
	<ul class="list-group list-group-flush" style="font-size:12px;">
	  <li class="list-group-item"><span class="label label-info" style="width:40px;">GET all users</span>  http://localhost:8080/users</li>
	  <li class="list-group-item"><span class="label label-info" style="width:40px;">GET user by id</span>  http://localhost:8080/users/{id}</li>
	  <li class="list-group-item"><span class="label label-info" style="width:40px;">POST add user</span>  http://localhost:8080/users</li>
	  <li class="list-group-item"><span class="label label-info" style="width:40px;">DELETE user by id</span>  http://localhost:8080/users/{id}</li>
	</ul>
</div>

 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
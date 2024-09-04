<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
	<jsp:include page="components/header.jsp"></jsp:include>
	<div class="container">
		<div class="login-container">
			<h1>Login</h1>
			<form action="<%=request.getContextPath()%>/Login/ingresar"
				method="post">
				<input type="email" name="email" placeholder="Ingresa tu correo"
					required
					value="<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>">
				<input type="password" name="password" placeholder="Contraseña"
					required>
				<button type="submit">Ingresar</button>
				<c:if test="${not empty errorMessage}">
					<p class="error">${errorMessage}</p>
				</c:if>
			</form>
		</div>
	</div>
	<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>
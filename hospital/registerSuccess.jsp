<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<title>注册成功界面</title>
<html>
	<script type="text/javascript"> 
		var t = 5; 
		function countDown(){ 
		var time = document.getElementById("time"); 
		t--; 
		time.value=t; 
		if (t<=0) { 
		location.href="http://localhost:8080/hospital/login.jsp"; 
		clearInterval(inter); 
		}; 
		} 
		var inter = setInterval("countDown()",1000); 
		//window.onload=countDown; 
	</script> 
	
	<body background="image/back.jpg" onload="countDown()">
	<div align="center">
			<p>注册反馈：
			<jsp:getProperty name="userBean" property="backNews"/>
			<table border="3">
					<tr>
						<td>用户名：</td>
						<td width="100px"><jsp:getProperty name="userBean" property="logname"/></td>
					</tr>
					<tr>
						<td>姓名：</td>
						<td><jsp:getProperty name="userBean" property="realname"/></td>
					</tr>
					<tr>
						<td>地址：</td>
						<td><jsp:getProperty name="userBean" property="address"/></td>
					</tr>
					<tr>
						<td>电话：</td>
						<td><jsp:getProperty name="userBean" property="phone"/></td>
					</tr>
			</table>
		<!-- <a href=login.jsp>返回以登录</a> -->
	</div>	
	<input type="text" readonly="true" value="5" id="time" style="border:none" size="2"/>秒后跳转到登录界面
	</body>
</html>

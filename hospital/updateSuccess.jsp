<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<title>药品信息修改成功界面</title>
<html>
	<script type="text/javascript"> 
		var t = 5; 
		function countDown(){ 
		var time = document.getElementById("time"); 
		t--; 
		time.value=t; 
		if (t<=0) { 
		location.href="http://localhost:8080/hospital/index.jsp"; 
		clearInterval(inter); 
		}; 
		} 
		var inter = setInterval("countDown()",1000); 
		//window.onload=countDown; 
	</script> 
	
	<body background="image/back.jpg" onload="countDown()"><center>
	<font color="green" size="6">恭喜您，药品信息修改成功！！！</font><br>
	<font size="5">
	<input type="text" readonly="true" value="5" id="time" style="border:none" size="2"/>秒后跳转到主界面</font></center>
	</body>
</html>

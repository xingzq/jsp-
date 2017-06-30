<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>上传成功界面</title>
  </head>
  
  <body>
    <% 
      out.println(request.getAttribute("message"));
    %>
    <br>
    返回：<a href=searchMedicine.jsp>查询界面</a>
  </body>
</html>
		

	
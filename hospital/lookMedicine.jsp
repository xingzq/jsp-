<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<head><%@ include file="head.txt"%></head>
	<title>浏览药品界面</title>
	<body background="image/zhuce.jpg"><font size="2">
	<div align="center">
		 <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }catch(Exception e){}
            String uri="jdbc:mysql://localhost:3306/hospital?"+"user=root&password=1234&characterEncoding=utf-8";
         	Connection con; // connection类是指向同一个数据库的连接。
        	Statement sql; // Statement对象用于将SQL语句发送到数据库中。
       		ResultSet rs;  // 装载查询结果，并可以通过它的不同方法提取出查询结果。
            try{
                  con=DriverManager.getConnection(uri); // 连接数据库
                  sql=con.createStatement();
                  // 读取classify表，获取分类：
                   rs=sql.executeQuery("select * from classify"); // executeQuery()：用于产生单个结果集的语句，如：select语句 
                  // executeUpdate()：用于执行insert、update或delete、语句等，返回值是一个整数，指示受影响的行数(即更新计数)
                  out.print("<form action='queryServlet' method='post'>");
                  out.print("<select name='fenlei'>");
                  while(rs.next()){
                      	  int id=rs.getInt(1); // 获取第一个字段id的值
                      	  String name=rs.getString(2);
                          out.print("<option value="+id+">"+name+"</option>");
                  }
                  out.print("</select>");
                  out.print("<input type='submit' value='提交'>");
                  out.print("</form>");
                  con.close();

            }catch(SQLException e){
              out.print(e);
            }
        %>

	</div></font>
	</body>
</html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<title>显示细节界面</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="detail.css">
	</head>
	<body>
	<div class="header_top">
		<div class="header_t">
			<div class="header_l">
				欢迎来到医院管理系统!
			</div>
			<div class="header_r">
				<span>登录状态：在线</span>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="left">
			<img src="img/logo.png" width="140px">
		</div>
		<div class="right">
			<div class="right_top">
				<form id="searchForm">
					<div class="header_search">
						<input type="text" name="text" class="stxt" placeholder="请输入您要搜索的内容" style="font-size: 20px;">
						<input type="submit" name="搜索" class="sbtn">
					</div>
				</form>
			</div>
			<div class="right_bottom">
				<p>为您推荐：</p>
				<a href="#">中药养生</a>
				<a href="#">发烧</a>
				<a href="#">季节性感冒</a>
			</div>
		</div>
	</div>
	
	<div class="nav">
		<div class="nav_top">
			<ul class="navlist">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="lookMedicine.jsp">药品浏览</a></li>
				<li><a href="searchMedicine.jsp">查询药品</a></li>
				<li><a href="addMedicine.jsp">药品添加</a></li>
				<li><a href="medicineCollect.jsp">药品收藏</a></li>
				<li><a href="exitServlet">退出登录</a></li>
			</ul>
		</div>
	<div class="table">
	<p class="p_top"><span>查看细节>></span></p>
	<%
		String numberID=request.getParameter("xijie");
		//out.print("<th>版本号:"+numberID);
		if(numberID==null){
			out.print("没有版本号,无法查看细节");
			return;
		}
		Connection con;
		Statement sql;
		ResultSet rs;
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
		String uri="jdbc:mysql://localhost:3306/hospital?"+"user=root&password=1234&characterEncoding=UTF-8";
		try{
			con=DriverManager.getConnection(uri);
			sql=con.createStatement();
			String cdn="select *from medicine where medicine_number='"+numberID+"'";
			rs=sql.executeQuery(cdn);
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>药品版本号<th>");
			out.print("<th>药品名<th>");
			out.print("<th>药品制造商<th>");
			out.print("<th>药品价格(单位：元)<th>");
			out.print("<th>收藏操作</th>");
			out.print("</tr>");
			String picture="zhuce.jpg";
			String detailMess="";
			while(rs.next()){
				String number=rs.getString(1);
				String name=rs.getString(2);
				String maker=rs.getString(3);
				String price=rs.getString(4);
				detailMess=rs.getString(5);
			    picture=rs.getString(6);
			 	String goods="("+number+","+name+","+maker+","+price+")#"+price;
			 	goods=goods.replaceAll("\\p{Blank}","");  
			 	String button="<form action='collectServlet' method='post'>"+
			 				"<div class='td-id'>"+
			 				"<img src='img/heart.png' style='width:20px;'>"+
							"<input type='hidden' name='java' value="+goods+">"+
							"<input type='submit' value='收藏' name='button'></div></form>";
				out.print("<tr>");
					out.print("<td>"+number+"</td>");
					out.print("<td>"+name+"</td>");
					out.print("<td>"+maker+"</td>");
					out.print("<td>"+price+"</td>");
					//out.print("<td>"+goods+"</td>");
					out.print("<td>"+button+"</td>");
				out.print("</tr>");
			}
		out.print("</table>");
		out.print("<div class='detail-txt' align='center'>");
		out.print("<p>药品详情浏览：</p>");
		out.println(detailMess);
		out.print("<div class='image'>");
		String pic="<img src='image/"+picture+"'width=260 height=200></img>";
		out.print("</div>");
		out.print("</div>");
		out.print(pic);
		con.close();

		}catch(SQLException exp){}
		
	%>
	</div>
	<div class="footer_list">
			<p>&copy;医药管理系统</p>
	</div>
	<div class="fixed_search" id="fixed_search">
			<div class="fixed_img">
				<a href="#">
					<img src="img/logo.png" height="45px" width="120px">
				</a>
			</div>
			<form id="searchForm2">
					<div class="search">
						<input type="text" name="text" class="stxt" style="font-size: 20px;">
						<input type="submit" name="搜索" class="sbtn">
					</div>
			</form>
	</div>
	<script type="text/javascript">
			window.onscroll=function(){//滚轮事件
    		var top=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop;//滚轮滚动的距离
    		var node=document.getElementById('fixed_search');//变化的菜单模块
    		var searchNode=document.getElementById('searchForm2');
    		if(top>591){//就是滚动条滚动到591px位置，显示菜单，并且可以修改它的样式。
	      	    node.style.position='fixed';
	        	node.style.background='#fff';
	        	node.style.zIndex="999";
	        	node.style.height="50px";
	        	node.style.width="100%";
	        	node.style.top="0px";	
	        	node.style.display="block";
	        	
   	 		}else{
		        node.style.display="none";
	    	}
		} 
		</script>
	</div>
	<div class="layout">
		<div class="fixed_navigation">
			<div class="kefu">
				<ul>
					<li>
						<img src="img/zixun.png" width="40px" height="40px">
						<a href="#">售前咨询</a>
					</li>
					<li>
						<img src="img/zixun.png" width="40px" height="40px">
						<a href="#">售后咨询</a>
					</li>
				</ul>
			</div>
			<div class="right">
				<div class="gouwuche">
					<img src="img/gouwuche.png" width="30px" height="30px" >
					<p>购<br>物<br>车</p>
				</div>
				<div class="mine">
					<img src="img/mine.png" width="30px" height="30px" >
					<img src="img/kuang.png" class="kuang">
					<script type="text/javascript">
						
					</script>
				</div>
				<div class="shoucang">
					<img src="img/shoucang.png" width="30px" height="30px">
					<script type="text/javascript">
						
					</script>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>
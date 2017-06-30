<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.DataByPage"%>
<%@ page import="com.sun.rowset.*"%>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<title>药品浏览</title>
		<meta charset="utf-8">
		<script type="text/javascript" src="banner.js"></script>
		<script type="text/javascript" src="jQuery.js"></script>
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="medicine.css">
	</head>
	<body>
	<div class="header_top">
		<div class="header_t">
			<div class="header_l">
				欢迎来到医院管理系统!
			</div>
			<div class="header_r">
				<span>登录状态：<jsp:getProperty name="loginBean" property="backNews"/></span>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="left">
			<img src="img/logo.png" width="150px" height="60px">
		</div>
		<div class="right">
			<div class="right_top">
				<form id="searchForm">
					<div class="header_search">
						<input type="text" name="text" class="stxt" style="font-size: 20px;">
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
	<div class="table" style="width:100%; height: 800px; overflow-y:auto;">
	
			 <p class="p_top"><span>药品浏览>></span></p>
			 <br><br>
			 <div class="p_top2">
			 	<form action="" method="post">
			     <div class="top">
			    	<span>当前显示的内容是：
			    		<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
						<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
					
			    	每页显示<input type="text" name="pageSize" class="text" style="font-size: 16px;" value="1">&nbsp;&nbsp;
			    	</span>
			    	<span>条记录</span>&nbsp;&nbsp;
			    	<input type="submit" name="g" value="确定" class="submit">
			    </div>
		   	   </form>
		    </div>
		    <table>
				<tr>
					<td>药品版本号</td>
					<td>药品名</td>
					<td>药品制造商</td>
					<td>药品价格（单位：元）</td>
					<td>查看详情</td>
					<td>收藏药品</td>
					<td>药品信息修改</td>
				</tr>
		
				<%
					 // 为了防止数据库连接被关闭时，ResultSet中的数据无法读取的问题
   					 // 在这里将ResultSet转换成CachedRowSet，它存在于内存中，不依赖于数据库。
					CachedRowSetImpl rowSet=dataBean.getRowSet();
					if(rowSet==null){
						out.println("没有任何查询信息，无法浏览");
						return;
					}
					rowSet.last();
					int totalRecord=rowSet.getRow();
				%>
				<div class="jilu" >
				<%
					out.println("全部记录数："+totalRecord);
				%>
				</div>
				<br>
				<% 
					int pageSize=dataBean.getPageSize();
					int totalPages=dataBean.getTotalPages();
					if(totalRecord%pageSize==0)
						totalPages=totalRecord/pageSize;
					else
						totalPages=totalRecord/pageSize+1;
					dataBean.setPageSize(pageSize);
					dataBean.setTotalPages(totalPages);
					if(totalPages>=1){
						if(dataBean.getCurrentPage()<1)
							dataBean.setCurrentPage(dataBean.getTotalPages());
						if(dataBean.getCurrentPage()>dataBean.getTotalPages())
							dataBean.setCurrentPage(1);
						int index=(dataBean.getCurrentPage()-1)*pageSize+1;
						rowSet.absolute(index);
						boolean boo=true;
						for(int i=1;i<=pageSize&&boo;i++){
							String number=rowSet.getString(1);
							String name=rowSet.getString(2);
							String maker=rowSet.getString(3);
							String price=rowSet.getString(4);
							String mess=rowSet.getString(5);
							String pic=rowSet.getString(6);
							String idNumber=rowSet.getString(7);
							String goods="("+number+","+name+","+maker+","+price+")#"+price;
							goods=goods.replaceAll("\\p{Blank}","");
							String detail="<form action='showDetail.jsp' method='post'>"+
										  "<input type='hidden' name='xijie' value="+number+">"+
										  "<input type='submit' value='查看细节'></form>";
							String button="<form action='collectServlet' method='post'>"+
										  "<input type='hidden' name='java' value="+goods+">"+
										  "<input type='submit' value='收藏'></form>";
										  //request.setCharacterEncoding("UTF-8");
							String xiugai="<form action='medicineUpdate.jsp' method='post'>"+
										  "<input type='hidden' name='xiugai' value="+number+">"+
										  "<input type='hidden' name='name' value="+name+">"+
										  "<input type='hidden' name='maker' value="+maker+">"+
										  "<input type='hidden' name='price' value="+price+">"+
										  "<input type='hidden' name='mess' value="+mess+">"+
										  "<input type='hidden' name='pic' value="+pic+">"+
										  "<input type='hidden' name='idNumber' value="+idNumber+">"+
										  "<input type='submit' value='药品信息修改'></form>";
										  
							out.print("<tr>");
							out.print("<td>"+number+"</td>");
							out.print("<td>"+name+"</td>");
							out.print("<td>"+maker+"</td>");
							out.print("<td>"+price+"</td>");
							out.print("<td>"+detail+"</td>");
							out.print("<td>"+button+"</td>");
							out.print("<td>"+xiugai+"</td>");
							out.print("</tr>");
							boo=rowSet.next();
						}
					}
				%>
					</table>
		
		
			<div class="bottom">
					<p class="p_bottom">当前显示第
						<font color="blue">
							<jsp:getProperty name="dataBean" property="currentPage"/>
						</font>页，共有
						<font color="blue">
							<jsp:getProperty name="dataBean" property="totalPages"/>
						</font>页.
					</p><br>
					
					
						<div class="bottom_button">
							
								<form action="" method="post" class="prev">
									<input type='hidden' name='currentPage' value="<%=dataBean.getCurrentPage()-1%>">
									<input type="submit" name="g" value="上一页" class="button">
								</form>
								<form action="" method="post" class="tiaozhuan">
									<span>跳转到第&nbsp;&nbsp;<input type="text" name="currentPage" class="text" style="font-size: 16px;">&nbsp;&nbsp;页</span>		
									<input type='submit' value='提交' class="button tijiao" name="g">
								</form>
								<form action="" method="post" class="next">
									<input type='hidden' name='currentPage' value="<%=dataBean.getCurrentPage()+1%>"><input type="submit" name="g" value="下一页" class="button">
								</form>
							
						</div>
					
			</div>
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
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<title>收藏界面</title>
<!DOCTYPE html>
<html><head>
		
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="collect-style.css">
		<script>
			function firm()
			{
  				//利用对话框返回的值 （true 或者 false）
  				if(confirm("你确信要删除你的收藏吗？"))
                {
                	 var forms = document.forms[0];
               		 forms.method="post";
               		 forms.submit();
                }
   
			}
		</script>
	</head>
	<body>
	<!--  <div class="header_top">
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
			<div class="right_bottom">
				<p>为您推荐：</p>
				<a href="#">中药养生</a>
				<a href="#">发烧</a>
				<a href="#">季节性感冒</a>
			</div>
		</div>
	</div> --> 
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
				 <div id="searchForm">
					<div class="header_search">
						<input type="text" name="text" class="stxt" placeholder="请输入您要搜索的内容" style="font-size: 20px;">
						<input type="submit" name="搜索" class="sbtn">
					</div>
				</div> 
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
		    <p class="p_top"><span>药品收藏</span></p>
		    <p class="txt-notice">您收藏的药品参考表格</p>	    
	<%
		LinkedList car=loginBean.getCar();
		if(car==null){
			out.print("<h2>您当前没有收藏的药品</h2>");
		}else{
			Iterator<String> iterator=car.iterator();
			String collectGoods=new String();
			int n=0;
			double priceSum=0;
			out.print("<table border=2>");
			while(iterator.hasNext()){
				String goods=iterator.next();
				String showGoods="";
				n++;
				int index=goods.lastIndexOf("#");
				if(index!=-1){
					priceSum+=Double.parseDouble(goods.substring(index+1));
					showGoods=goods.substring(0,index);

				}
				// "<form action='deleteServlet' method='post'>"+
				collectGoods = n+":" +showGoods;
				String del="<form action='deleteServlet' method='post'>"+
						   "<input type='hidden' name='delete' value="+goods+">"+
						   "<div class='td-id'>"+
						   "<img src='img/delete.png' style='width:20px;'>"+
						   "<input type='button' value='删除收藏' name='button' onclick='firm()'></div></form>";
				out.print("<tr><td>"+showGoods+"</td>");
				out.print("<td>"+del+"</td></tr>");
			}
			out.print("</table>");
		}
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
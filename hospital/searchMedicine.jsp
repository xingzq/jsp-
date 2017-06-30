<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>查询药品界面</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="search-style.css">
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
			<p class="p_top"><span>查询药品>></span></p>
		    <div class="top">
		    	<div class="pic"><img src="img/gantan.png" style="width:30px;"></div>
		    	<span class="top-text">查询时可以输入药品的版本号、药品名称或价格进行查询<br>
		    		药品名称支持模糊查询 <br>
		    		价格查询时格式为:价格1-价格2</span>
		    </div>
			<div class="top_banner">
			
				<form action="searchByConditionServlet" method="post">
					<div class="tb-1">
			    		输入查询信息:&nbsp;&nbsp;&nbsp;<input type="text" class="search-input" name="searchMess">
			    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	</div><br>
					<div class="tb-2">
						选择查询方式:&nbsp;&nbsp;<br>
						 <input type="radio" name="radio" value="medicine_number">药品版本号
						<input type="radio" name="radio" value="medicine_name" checked="ok">药品名称
						<input type="radio" name="radio" value="medicine_price">药品价格
						
		    			<!-- <select name="search-type"> 
							<option name="radio" value="medicine_number">药品版本号</option> 
							<option name="radio" value="medicine_name" checked="ok">药品名称</option> 
							<option name="radio" value="medicine_price">药品价格</option>
						</select> -->
					</div>
					<br><input type="submit" name="g" class="search-btn" value="提交查询">
				</form>
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
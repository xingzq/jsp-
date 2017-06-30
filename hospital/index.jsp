<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta charset="utf-8">
	<script type="text/javascript" src="banner.js"></script>
	<script type="text/javascript" src="jQuery.js"></script>
	<link rel="stylesheet" type="text/css" href="index.css">
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
			<img src="img/logo.png" height="60px">
		</div>
		<div class="right">
			<div class="right_top">
				<form id="searchForm">
					<div class="header_search">
						<input type="text" name="text" class="stxt" placeholder="请输入您要搜索的内容" style="font-size: 17px;">
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
				<li class="add"><a href="lookMedicine.jsp">药品浏览</a>
					<div class="second-div">
						<div id="top1">
								<input id="neibu" type="submit" value="常见非处方药">
						</div>
						<div id="bottom2">
								<input id="neibu" type="submit" value="我也忘了是啥">
						</div>
					</div>
				</li>
				
				<li><a href="searchMedicine.jsp">查询药品</a></li>
				<li><a href="addMedicine.jsp">药品添加</a></li>
				<li><a href="medicineCollect.jsp">药品收藏</a></li>
				<li><a href="exitServlet">退出登录</a></li>
			</ul>
		</div>
		<div class="nav_left">
			<ul class="kinds_list">
				<li><a href="#">专科用药</a></li>
				<li><a href="#">美肤用品</a></li>
				<li><a href="#">母婴乐园</a></li>
				<li><a href="#">锻炼器械</a></li>
				<li><a href="#">幸福生活</a></li>
				<li><a href="#">滋补保健</a></li>
				<li><a href="#">隐形眼镜</a></li>
				<li><a href="#">中药养生</a></li>
			</ul>
		</div><!--轮播--><div id="banner" class="banner">
			<div class="banner_img" id="banner_img" style="left: -840px;">
				<img src="img/banner_3.jpg" alt="1" width="840px" height="416px">
				<img src="img/banner_1.jpg" alt="1" width="840px" height="416px">
				<img src="img/banner_2.jpg" alt="2" width="840px" height="416px">
				<img src="img/banner_3.jpg" alt="3" width="840px" height="416px">
				<img src="img/banner_1.jpg" alt="3" width="840px" height="416px">
			</div>
			<div class="buttons" id="buttons">
				<span index="1" class="on"></span>
				<span index="2"></span>
				<span index="3"></span>
				<span index="4"></span>
			</div>
			<a href="javascript:;" id="prev" class="arrow"><img src="img/prev.png"></a>
			<a href="javascript:;" id="next" class="arrow"><img src="img/next.png"></a>
		</div><div class="nav_right">
			<img class="img_top1" src="img/right_top.jpg" width="210px" height="200px">
			<img class="img_top2" src="img/right_top2.jpg" width="210px" height="216px">
		</div>
		<div class="nav_mainbody">
			
			<div class="health">
				<p>营养保健</p>
				<div class="img">
					<ul>
						<li><a href="#"><img src="img/health1.jpeg"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
						<li><a href="#"><img src="img/health2.png"></a><p>修正 辅酶Q10软胶囊60/盒</p></li>
						<li><a href="#"><img src="img/health3.jpeg"></a><p>修正 辅酶Q10维生素E软胶囊 400mg/片</p></li>
						<li><a href="#"><img src="img/health1.jpeg"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
					</ul>
					<ul>
						<li><a href="#"><img src="img/health5.png"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
						<li><a href="#"><img src="img/health2.png"></a><p>修正 辅酶Q10软胶囊60/盒</p></li>
						<li><a href="#"><img src="img/health3.jpeg"></a><p>修正 辅酶Q10维生素E软胶囊 400mg/片</p></li>
						<li><a href="#"><img src="img/health6.png"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
					</ul>
				</div>
			</div>
			<img src="img/mainbody_img1.jpeg" width="1200px" height="180px">
			<div class="health">
				<p>锻炼器械</p>
				<div class="img">
					<ul>
						<li><a href="#"><img src="img/health1.jpeg"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
						<li><a href="#"><img src="img/health2.png"></a><p>修正 辅酶Q10软胶囊60/盒</p></li>
						<li><a href="#"><img src="img/health3.jpeg"></a><p>修正 辅酶Q10维生素E软胶囊 400mg/片</p></li>
						<li><a href="#"><img src="img/health1.jpeg"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
					</ul>
					<ul>
						<li><a href="#"><img src="img/health5.png"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
						<li><a href="#"><img src="img/health2.png"></a><p>修正 辅酶Q10软胶囊60/盒</p></li>
						<li><a href="#"><img src="img/health3.jpeg"></a><p>修正 辅酶Q10维生素E软胶囊 400mg/片</p></li>
						<li><a href="#"><img src="img/health6.png"></a><p>修正 破壁灵芝孢子粉2盒装</p></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="footer_list">
			<p>&copy;医药管理系统</p>
		</div>
		<div class="fixed_search" id="fixed_search">
			<div class="fixed_img">
				<a href="#">
					<img src="img/icon.png" height="50px" width="170px">
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

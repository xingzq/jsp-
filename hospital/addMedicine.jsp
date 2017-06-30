<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>添加药品界面</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="addmedi.css">
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
		<div class="table">
			 <p class="p_top"><span>添加药品</span></p>
			 <div class="infor">
					<form action="addMedicineServlet" method="post" enctype="multipart/form-data">
						 <p>输入添加药品的具体信息：</p>
						<!-- 药品版本号:<input type="text" name="medicine_number" size="20" placeholder="填药品缩写"><br><br>
						药品名称:<input type="text" name="medicine_name" placeholder="填药品学名"><br><br>
						药品制造商:<input type="text" name="medicine_maker" placeholder="填厂商"><br><br>
						药品价格:<input type="text" name="medicine_price" placeholder="单位：元"><br><br>
					 	药品类别:<input type="text" name="xxxx" placeholder="填1或2"><br><br>
					 	药品详述:<textarea name="medicine_mess" rows="5" cols="50"></textarea><br><br>
					 	
						药品图片:<input type="file" name="medicine_pic"><br><br>
						<input type="submit" name="g" value="提交">&nbsp;|&nbsp;<input type="reset"> -->
						<table>
								<tr>
					    			<td>药品版本号：</td>
					    			<td><input type="text" name="medicine_number" placeholder="填入药品缩写" size="22" ></td>
					    		</tr>
					    		<tr>
					    			<td>药品名称：</td>
					    			<td><input type="text" name="medicine_name" placeholder="填入药品学名" size="22" ></td>
					    		</tr>
					    		<tr>
					    			<td>制造厂商：</td>
					    			<td><input type="text" name="medicine_maker" placeholder="填入厂商" size="22" ></td>
					    		</tr>
					    		<tr>
					    			<td>药品价格：</td>
					    			<td><input type="text" name="medicine_price" placeholder="单位：元" size="22" ></td>
					    		</tr>
					    		<tr>
					    			<td>药品类别：</td>
					    			<td><input type="text" name="xxxx" placeholder="填1或2" size="22" ></td>
					    		</tr>
					    		<tr>
					    			<td>药品详述：</td>
					    			<td><textarea rows="10" cols="50" name="medicine_mess"></textarea></td>
					    		</tr>
					    		<tr>
					    			 <td>药品图片：</td>
					    			<!-- <td><label class="file_button" for="xFile">选择文件</label>&nbsp;&nbsp;&nbsp;未选择任何文件
									<form><input type="file" id="xFile" style="position:absolute;clip:rect(0 0 0 0);"></form></td>   -->
									<td><input type="file" name="medicine_pic"></td>
					    		</tr>
		    			</table>
		    			<input type="submit" name="g" value="提交" class="tijiao button">
		    			<input type="reset" name="reset" value="重置" class="chongzhi button">
					</form>
			</div>
		</div>
		<div class="footer_list">
				<p>&copy;医药管理系统</p>
		</div>
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
				</div>
				<div class="shoucang">
					<img src="img/shoucang.png" width="30px" height="30px">
				</div>
			</div>
		</div>
	</div>	
	</body>
</html>
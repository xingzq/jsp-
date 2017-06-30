<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<!DOCTYPE HTML>
<html>
	<head>
    	 <title>登录界面</title>
    	 <meta charset="utf-8">
		 <link href="zhuce-style2.css" rel="stylesheet" type="text/css" />
		 <link href="denglu-style.css" rel="stylesheet" type="text/css" />
    </head>
	<body>
	<div class="top">
			<div class="logo"><a href=""><img src="img/logo.png" width="140px"></a></div>
			<div class="line1"></div>
			<p class="welcome">欢迎登录</p>
	</div>
	<div class="main">
			<img class="bigpic" src="img/pic.png" width="700px">
			<div class="main-right">
				<p class="welcomeregist">欢迎登录</p>
				<form action="loginServlet" method="post">
						<div class="user2" id="main-information">
							<div id="main-icon" class="user-icon">
								<img src="img/user.png" width="25px">
							</div>
							<input type="text" class="username" id="form2" placeholder="请输入用户名" name="logname">
						</div>
		
						<div class="password2" id="main-information">
							<div id="main-icon" class="pwd-icon">
								<img src="img/lock.png" width="25px">
							</div>
							<input type="password" class="password" id="form2" placeholder="请输入密码" name="password">
						</div>
		
						<div class="notice">
							<div class="checkbox">
								<div>
									<input type="checkbox" style="width:12px;"><p class="remepwd">记住密码</p>
								</div>
							</div>
							
						</div>
		
						<input class="regist-btn" type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" name="g">
				</form>
				
				<p class="free" id="sigezi"><a href="inputRegisterMess.jsp">免费注册></a></p>
				<p class="forget" id="sigezi"><a href="http://www.baidu.com">忘记密码?</a></p>
			</div>

			<div class="cutline2">
					<div class="line-left2" id="cut-line2"></div>
					<nbor class="line-message2">使用合作网站账号登录</nbor>
					<div class="line-right2" id="cut-line2"></div>
			</div>

			<div class="icon2">
				<ul>
					<li class="weibo2"><a href=""><img src="img/weibo2.png" width="30px"></a></li>
					<li class="qq2"><a href=""><img src="img/qq2.png" width="30px"></a></li>
					<li class="taobao2"><a href=""><img src="img/taobao2.png" width="30px"></a></li>
					<li class="weixin2"><a href=""><img src="img/weixin2.png" width="30px"></a></li>
				</ul>
			</div>

		</div>	
	
		<div class="footer2">
			<div class="first"> 批发招商 | 关于我们 | 掌上药店 | 实体药店 | 加入我们 | 联系我们 | 商务合作	| 经营认证 | 友情链接 | TAG列表 | 网站地图 | CPS联盟 </div>
			<div class="second">互联网药品交易服务资格证书 | 互联网药品信息服务资格证书 | 执业药师证 | 药品经营许可证 | 食品流通许可证 | 公司营业执照 | GSP认证证书 | 增值电信业务经营许可证 </div>
			<div class="third">©2017-06-06</div>
		</div>
	</body>
</html>
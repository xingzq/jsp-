<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<html>
	<head>
		<style type="text/css">
				table{
					/* border:white 1px solid; */
					width: 600px;
					/* border-collapse:collapse;/*框线单框线*/ */
					position: relative;
					margin:0 auto;
				}
				/* table td,table th{
					border:white 1px solid;
					padding: 10px;
				} */
				/* table td{
					background-color: #c5edf3;
				}
				table th{
					background-color: #00c9ff;
				} */
		
			 	.focus{
					 border:#09f 2px solid;/*框线*/ 
				}
				.norm{
					border: #999 1px solid;/*框线*/
				}
				.error{
					/* border: #f00 2px solid;/*框线*/ */
				}
				.errorinfo{
					/* color: red; */
					display: none;
				}
	    </style>
		<title>注册界面</title>
		<meta charset="utf-8">
		<link href="zhuce-style.css" rel="stylesheet" type="text/css" />
		<script>
				window.onload=function(){
					var checknode = document.getElementById('check');
					if(checknode.checked == true)
					{
						checknode.checked = false;
					}
		
				}
				function judge(){
					var oCheck=document.getElementById('check');
					var oBtn=document.getElementById('btn');
		
					if(oCheck.checked){
						oBtn.setAttribute("style","background-color:#036dde;") ;
					}
					else{
						oBtn.setAttribute("style","background-color:#c9c9c9;") ;
					}
				}
		</script>
		<script type="text/javascript">
		function check(inputNode,regex,divId)//test是RegExp的方法，参数是字符串，返回值是boolean类型。
		//match是String的方法，参数是正则表达式，返回值是数组。
		{
			var b = false;
			var divNode = document.getElementById(divId);

			if(regex.test(inputNode.value))
			{
				inputNode.className = "norm";
				divNode.style.display = "none";
				b = true;
			}
			else
			{
				inputNode.className = "error";
				divNode.style.display = "block";
			}
			return b;
		}

		function checkUser(userNode)
		{
			var regex = /^([a-zA-Z][a-zA-Z0-9_]{0,17})|[\u4e00-\u9fa5]{1,18}$/;//不对
			return check(userNode,regex,"userdiv");
		}

		function checkPsw(pswNode)///^([A-Za-z0-9]*((?=[\x21-\x7e]+)[^A-Za-z0-9])+){6,18}$/
		{
			var regex = /^(?=.*\d+)(?=.*[a-z]+)(?=.*[A-Z]+)(?=.*[^A-Za-z0-9]+).{6,18}$/g;
			return check(pswNode,regex,'pswdiv');
		}

		function checkRepsw(repswNode)
		{
			var b = false;
			var value1 = repswNode.value;
			var value2 = document.getElementsByName("again_password")[0].value;
			var divNode = document.getElementById("repswdiv");
			if(value1 == value2)
			{
				repswNode.className = "norm";
				divNode.style.display = "none";
				b = true;
			}
			else
			{
				repswNode.className = "error";
				divNode.style.display = "block";
			}
			return b;
		}

		function checkPh(phNode)
		{
			var regex = /^1[3|5|7|8][0-9]{9}$/;
			return check(phNode,regex,'phonediv');
		}
		function checkHome(homeNode)
		{
			var regex = /^\S{11,}$/;
			return check(homeNode,regex,'homediv');
		}
		function checkName(nameNode)
		{
			var regex = /^[\u4e00-\u9fa5]{2,18}$/;//不对
			return check(nameNode,regex,'namediv');
		}
		// //校验表单
		 function checkForm(formNode) 
		 {
		 	with(formNode)
		 	{
		 		if(checkUser(user) && checkPsw(psw) && checkRepw(repsw)&&checkPh(phone) && checkName(realname) && checkHome(home))
	 		{
	 			event.returnValue = true;
		 		}
		 		else
		 		{
		 			event.returnValue = false;
		 		}
		 	}
		 }
		</script>
	</head>
	
	<body>
		<form action="registerServlet" method="post" name="form" onsubmit="return checkForm(this)">
			<div class="top">
				<div class="logo"><img src="img/logo.png" width="140px"></div>
				<div class="line1"></div>
				<p class="welcome">欢迎注册</p>
				<p class="qiehuan">已有账号，<nobr id="phone"><a href="login.jsp">立即登录></a></nobr></p>
			</div>
		  	<div class="line"></div>
			<div bottom>
				<p class="title">欢迎注册您的个人账号</p>
				<div class="border">
					<div class="user" id="textinformation">
						<nobr class="notice-text">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</nobr>
						<input type="text" class="form" id="username" placeholder="不大于18位，可以是汉字,不能用数字开头" name="logname" onblur="checkUser(this)">
						<p class="user-notice" id="bottom-notice">
						<div class="errorinfo" id="userdiv"><img src="img/gantan.png" width="10px">用户名格式错误，请重填</div>
						<!-- <img src="img/gantan.png" width="10px">用户名不能为空</p> -->
					</div>
	
					<div class="password" id="textinformation">
						<nobr class="notice-text">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</nobr>
						<input type="password" class="form" id="password" placeholder="6-18位,必须数字，特殊字符，大小写字母组合" name="password" onblur="checkPsw(this)">
						<p class="pwd-notice" id="bottom-notice">
						<div class="errorinfo" id="pswdiv"><img src="img/gantan.png" width="10px">密码格式错误，请重新输入</div>
						<!-- <img src="img/gantan.png" width="10px">密码不能为空</p> -->
					</div>
	
					<div class="message" id="textinformation">
						<nobr class="notice-text-1">确认密码:</nobr>
						<input type="password" class="form" id="password2" placeholder="请再次输入密码" name="again_password" onblur="checkRepsw(this)">
						<p class="pwd2-notice" id="bottom-notice">
						<div class="errorinfo" id="repswdiv"><img src="img/gantan.png" width="10px">密码不一致，请重新输入</div>
						<!-- <img src="img/gantan.png" width="10px">两次密码不一致</p> -->
					</div>
	
					<div class="phone" id="textinformation">
						<nobr class="notice-text-1">手机号码:</nobr>
						<input type="text" class="form" id="phone" placeholder="请输入11位手机号码" name="phone" onblur="checkPh(this)">
						<p class="phone-notice" id="bottom-notice">
						<div class="errorinfo" id="phonediv"><img src="img/gantan.png" width="10px">格式不正确，请重新输入
					</div>
						<!-- <img src="img/gantan.png" width="10px">联系电话不能为空</p> -->
					</div>
	
					<div class="address" id="textinformation">
						<nobr class="notice-text-1">家庭地址:</nobr>
						<input type="text" class="form" id="address" placeholder="请输入10位以上的家庭地址" name="address" onblur="checkHome(this)">
						<div class="errorinfo" id="homediv"><img src="img/gantan.png" width="10px">格式不正确
					</div>
					</div>
	
					<div class="name" id="textinformation">
						<nobr class="notice-text-1">真实姓名:</nobr>
						<input type="text" class="form" id="name" placeholder="请输入姓名" name="realname" onblur="checkName(this)">
						<div class="errorinfo" id="namediv"><img src="img/gantan.png" width="10px">格式不正确
					</div>
	
					<div class="notice">
	
						 <div class="checkbox">
							<div>
					 			<input type="checkbox" id="check" name="value" checked="disabled" onclick="judge()">
								<p class="notice-text2">我已阅读并同意<nobr id="falv"><a href="">健康上网协议</a></nobr>及<nobr id="falv"><a href="">隐私声明</a></nobr></p> 
							</div>
						</div>
					</div>
					<input class="regist-btn2" id="btn" type="submit" name="g" value="注&nbsp;&nbsp;&nbsp;&nbsp;册">
					<!-- <button onclick="">立即注册</button> -->
	
					<div class="cutline">
						<div class="line-left" id="cut-line"></div>
						<nbor class="line-message">使用合作网站账号登录</nbor>
						<div class="line-right" id="cut-line"></div>
					</div>
	
					<div class="icon">
						<ul>
							<li class="weibo"><a href=""><img src="img/weibo.png" width="40px"></a></li>
							<li class="qq"><a href=""><img src="img/qq.png" width="40px"></a></li>
							<li class="taobao"><a href=""><img src="img/taobao.png" width="40px"></a></li>
							<li class="weixin"><a href=""><img src="img/weixin.png" width="40px"></a></li>
						</ul>
					</div>
				</div>
			</div>

		<div class="bottom-line"></div>

		<div class="footer">
			<div class="first"> 批发招商 | 关于我们 | 掌上药店 | 实体药店 | 加入我们 | 联系我们 | 商务合作	| 经营认证 | 友情链接 | TAG列表 | 网站地图 | CPS联盟 </div>
			<div class="second">互联网药品交易服务资格证书 | 互联网药品信息服务资格证书 | 执业药师证 | 药品经营许可证 | 食品流通许可证 | 公司营业执照 | GSP认证证书 | 增值电信业务经营许可证 </div>
			<div class="third">©2017-06-06</div>
		</div>
		</form>			
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
		<style>
			body{
				background: gainsboro;
			}
			h1{
				font-family:italic;
				color: #333333;
			}	
			input[type="text"]{	
				height:30px; 
				width: 100%;
				border-color: white;
			}
			#userNameI{
				 placeholder="用户名";
			}
			input[type="text"]:focus{
				outline: none;
				border-color:lightskyblue;
			}
				
			input[type="password"]{
				height:30px; 
				width: 100%;
				border-color: white;
			}
				
			input[type="password"]:focus{
				outline: none;
				border-color:lightskyblue;
			}
				
			input[type="submit"]{
				background-color: #FF6666;
				color: white;
				font-weight: bold;
				width: 100%;
				height: 45px;
				border-radius: 8px;
				-moz-border-radius: 8px;
			}
				
			.bnt{
				display:inline-block;
				float:right;
				height: 35px;
				font-size: 14px;
				font-family:"新宋体";
				font-weight: bold;
			}
			
			.lefttips{
				font-weight: bold;
				color: gray;
				visibility: hidden;
			}
			
			span#reader{
				text-decoration: none;
				font-size: 12px;
				visibility: visible;
			}
			div{
				margin: 2px 4px;
				padding: 8px 4px;
				text-align: center;
				font-size: 12px;
				font-weight: bold;
				color: gray;
				background-color: #E6E6E6;
				visibility: hidden;
			} 
			li{
				list-style: none;
			}
		</style>
	
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
	<script src="${pageContext.request.contextPath }/js/VerifiCutDown.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#identifyCodebt").click(function(){
				var telNum = $("#telNum").val();
				telNum = $.trim(telNum);
				console.log("前台输入手机号码 : "+telNum);
				
				
				$.ajax({
					url:"${pageContext.request.contextPath }/code",
					data:{"tel":telNum},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data == 1){
							console.log("手机验证码已经发送, data:" + data);
						}else{
							console.log("手机验证码发送失败 ,data: " + data);
						}
					}
				});
				
				$("#identifyCode").change(function(){
					var identifyCode = $("#identifyCode").val();
					identifyCode = $.trim(identifyCode);
					console.log("前台输入验证码 : "+identifyCode);
					
					$.ajax({
						url:"${pageContext.request.contextPath }/identifyCode",
						data:{"identifyCode":identifyCode},
						type:"post",
						dataType:"json",
						success:function(data){
							
							if(data == 1){
								alert("验证码输入正确 ");
								console.log("data: " + data);
							}else{
								alert("验证码输入错误 ");
								console.log("data: " + data);
							}
						}
					});
				})
			})
		})
	</script>
	</head>
	<body>
		<form action="" method="post" id="_form">
		</form>
		<h1 align="center">用户注册</h1>
		<hr />
		<form action="${pageContext.request.contextPath }/add" method="post">
			<table align="center"  height="300px" width="600px">
				<tr>
					<td width="24%"><span id="userNameO" class="lefttips">用户名*</span></td>
					<td width="52%">
						<input type="text" name="username" id="userNameI" placeholder="用户名" 
							onfocus="UserNameDisplay('userNameI','userNameO','div1');" 
							onblur="placeholderDisplay('userNameO','div1','userNameI','用户名');"/>
					</td>
					<td><div id="div1">用户名不能为空</div></td>
				</tr>
				
				<tr>
					<td><span id="passwordtip"  class="lefttips">密码*</span></td>
					<td>
						<input type="password" name="password" id="password" placeholder="密码"
							onclick="UserNameDisplay('password','passwordtip','div2');" 
							onblur="placeholderDisplay('passwordtip','div2','password','密码');"/>
					</td>
					<td><div id="div2">密码不能为空</div></td>
				</tr>
				<tr>
					<td><span id="password1tip"  class="lefttips">确定密码*</span></td>
					<td><input name="passwordconfirm" type="password" id="password1" 
						placeholder="确定密码" onclick="UserNameDisplay('password1','password1tip','div3');" 
						onblur="placeholderDisplay('password1tip','div3','password1','确定密码');"/></td>
					<td><div id="div3">请确定密码一致性</div></td>
				</tr>
				
				<tr>
					<td><span id="Agetip"  class="lefttips">年龄</span></td>
					<td>
						<input type="text" name="age" id="Age" placeholder="年龄" 
							onclick="UserNameDisplay('Age','Agetip','div4');" 
							onblur="placeholderDisplay('Agetip','div4','Age','年龄');"/>
					</td>
					<td><div id="div4">年龄为0到200之间</div></td>
				</tr>
				
				<tr style="height:12px"></tr>
				<tr>
					<td></td>
					<td>性别:<label><input type="radio" checked="checked" name="sex" value="boy" />男</label>
    						<label><input type="radio" name="sex"  value="girl" />女</label></td>
					<td></td>
				</tr>
				
				<tr style="height:12px"></tr>
				<tr>
					<td></td>
					<td>爱好:<label><input type="checkbox" checked="checked" name="hobby" value="basketball"/>篮球</label>
    						<label><input type="checkbox" name="hobby" value="sking"/>轮滑</label>
    						<label><input type="checkbox" name="hobby" value="bicycle"/>自行车</label></td>
					<td></td>
				</tr>
				<tr style="height:12px"></tr>
				
				<tr>
					<td></td>
					<td>
						<label style="width: 24%">验证码</label>
						<input style="width:45%" type="text" name="codeImage" />
						<input style="width:25%; position:relative;top:10px" type="image" id = "codeId" onclick="javascript:changeCode();" src="${pageContext.request.contextPath }/CodeImageServlet"/>
					</td>
					<td></td>
				</tr>
			
				<tr>
					<td><span id="telNumtip" class="lefttips">手机号码*</span></td>
					<td>
						<input type="text" name="tel" id="telNum" required placeholder="手机号码"
							onclick="UserNameDisplay('telNum','telNumtip','div5');" onblur="placeholderDisplay('telNumtip','div5','telNum','手机号码');">
					</td>
					<td><div id="div5">输入11位的数字</div></td>
				</tr>
				
				<tr>	
					<td><span id="identifyCodetip" class="lefttips">手机验证码*</span></td>
					<td>
						<input type="text" name="identifyCode" id="identifyCode" style="width: 26%;" placeholder="手机验证码"
							
							onclick="UserNameDisplay('identifyCode','identifyCodetip','div6');" onblur="placeholderDisplay('identifyCodetip','div6','identifyCode','手机验证码');"/>
						<input type="button" name="identifyCodeButton" id="identifyCodebt" class="bnt" value="获取验证码"/>
					</td>
					<td><div id="div6">输入6位的验证码</div></td>
				</tr>
				
				<tr>
					<td><span id="emailtip"  class="lefttips">邮箱</span></td>
					<td><input type="text" name="email" id="email" placeholder="邮箱"
						onclick="UserNameDisplay('email','emailtip','div7');" 
						onblur="placeholderDisplay('emailtip','div7','email','邮箱');"/></td>
					<td><div id="div7">输入有效邮箱地址</div></td>
				</tr>
				
				<tr>
					<td></td>
					<td>
						<input type="checkbox" checked="true"/><span id="reader">我已认真阅读并同意<a href="http://www.ciac.sh.cn/newsdata/news10981.htm" target="_blank"> &lt;&lt;用户注册协议&gt;&gt; </a></span>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td >
						<input type="submit" id="Register" value="同意协议并提交"/>
					</td>
					<td></td>
				</tr>
			</table>
		</form>
		<script>
		//隐去placeholder,弹出两边提示信息
			function UserNameDisplay(attribute,attribute1,tips){
				var userNameI=document.getElementById(attribute);
				//修改placeholder的内容
				userNameI.setAttribute("placeholder","");
				var userNameO=document.getElementById(attribute1);
				userNameO.style.visibility="visible";	
				
				var tipsRight=document.getElementById(tips);
				tipsRight.style.visibility="visible";
			}
			
			//隐去两边提示信息，弹出placeholder
			function placeholderDisplay(attribute,div,attribute1,placeholder){
				var userNameI=document.getElementById(attribute1);
				//修改placeholder的内容
				userNameI.setAttribute("placeholder",placeholder);
				
				var userNameO=document.getElementById(attribute);
				userNameO.style.visibility="hidden";
				
				var tipsRight=document.getElementById(div);
				tipsRight.style.visibility="hidden";
			
			}
				
			function changeCode(){
				var codeImage = document.getElementById("codeId");
				//用参数去改变路径，路径不对后重新执行正确路径
				var foreCodeImageSrc = codeImage.src;
				codeImage.src = foreCodeImageSrc+"?"+Math.random();
			}
		</script>
	</body>
</html>
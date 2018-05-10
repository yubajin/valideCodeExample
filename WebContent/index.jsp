<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String code= request.getParameter("code");//用request得到 
String url = request.getRequestURI();
String state= request.getParameter("code");
%> 
<html>
  <head>
    <title></title>
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		$(function(){
			$("a").click(function(){
				alert(<%=basePath%><%=url%>+"?code="+<%=code%>+"&state="+<%=state%>);
			});
		});
	</script>
  </head>
  <body>
  <a href="/PEE_assistant/userOper">获取用户信息</a>
  <!--  
	path:<%=path%>
	basePath:<%=basePath%>
  	uri:<%=url%>
	code:<%=code%>
	state:<%=state%>
	-->
  </body>
</html>
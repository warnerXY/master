<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台登陆</title>
	 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <!-- Bootstrap Styles-->
    <link href="${ctx}/style/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${ctx}/style/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="${ctx}/style/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${ctx}/style/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href=${ctx}/style/style.css?family=Open+Sans' rel='stylesheet' type='text/css' /> 
     
    <link rel="stylesheet" type="text/css" href="${ctx}/style/home_login/main.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/style/home_login/style.css" />
	<script src="${ctx}/style/assets/js/jquery-1.10.2.js"></script>
	<script src="${ctx}/scripts/main.js"></script>
     
<script type="text/javascript">
	window.onload=function(){
		$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js', function(_result) {
            if (remote_ip_info.ret == '1') {
            var mess=remote_ip_info.province+"省"+remote_ip_info.city+"市";
            document.getElementById("cusAddress").value=mess;
                //alert(remote_ip_info.country + '<BR>省：' + remote_ip_info.province + '<BR>市：' + remote_ip_info.city + '<BR>区：' + remote_ip_info.district + '<BR>ISP：' + remote_ip_info.isp + '<BR>类型：' + remote_ip_info.type + '<BR>其他：' + remote_ip_info.desc);
            } else {
                alert('没有找到匹配的IP地址信息！');
                //没有网络手动输入
                document.getElementById("cusAddress").readOnly=false;
            }
        });
	
	}
   
	function check_cusPhone()
		{
		var cusPhone=$("#cusPhone").val();
		if(cusPhone==""||cusPhone.length==0)
		{
			document.getElementById("show_cusPhone").innerHTML="<span style='color:red;'>手机号码不能为空</span>";
			setTimeout(function(){document.getElementById("show_cusPhone").style.display="none";},2000);
		}
		else if(isCusPhone(cusPhone)){
			//身份证验证正确
			$.ajax({
 					type:'POST',
 					data:{cusPhone:cusPhone},
 					dataType:'json',
 					url:'${ctx}/customer/checkCusPhone.do',
 					error:function(date)
 					{
 						alert(date.status);
 					},
 					success:function (data)
 					{
 						if(data=="0")
 							{
 							alert("手机号码不可用");
 							//window.location.href='${ctx}/views/customer/add_customer.jsp';
 							}
 						else 
 						{
 							//document.getElementById("show_email").innerHTML="<span style='color:red;'>手机号码可用</span>";
 						}
 					}
 				});
		}
		else
		{
			//手机号码格式不正确
			document.getElementById("show_cusPhone").innerHTML="<span style='color:red;'>手机号码不正确</span>";
			setTimeout(function(){document.getElementById("show_cusPhone").style.display="none";},2000);
		}
	}
	function check_cusIdCard()
	{
		var cusIdCard=$("#cusIdCard").val();
		if(cusIdCard==""||cusIdCard.length==0)
		{
			document.getElementById("show_cusIdCard").innerHTML="<span style='color:red;'>身份证不能为空</span>";
			setTimeout(function(){document.getElementById("show_cusIdCard").style.display="none";},2000);
		}
		else if(isCusIdCard(cusIdCard)){
			//身份证验证正确
			$.ajax({
 					type:'POST',
 					data:{cusIdCard:cusIdCard},
 					dataType:'json',
 					url:'${ctx}/customer/checkCusIdCard.do',
 					error:function(date)
 					{
 						alert(date.status);
 					},
 					success:function (data)
 					{
 						if(data=="0")
 							{
 							alert("身份证不可用");
 							//window.location.href='${ctx}/views/customer/add_customer.jsp';
 							}
 						else 
 						{
 							//document.getElementById("show_email").innerHTML="<span style='color:red;'>身份证可用</span>";
 						}
 					}
 				});
		}
		else
		{
			//身份证格式不正确
			document.getElementById("show_cusIdCard").innerHTML="<span style='color:red;'>身份证不正确</span>";
			setTimeout(function(){document.getElementById("show_cusIdCard").style.display="none";},2000);
		}
	}

	function check_email()
	{
		var email=$("#email").val();
		if(email==""||email.length==0)
		{
			document.getElementById("show_email").innerHTML="<span style='color:red;'>邮箱不能为空</span>";
			setTimeout(function(){document.getElementById("show_email").style.display="none";},2000);
			//alter("邮箱不能为空");
		}
		else if(isEmail(email)){
			//邮箱验证正确
			$.ajax({
 					type:'POST',
 					data:{cusEmail:email},
 					dataType:'json',
 					url:'${ctx}/customer/checkEmail.do',
 					error:function(date)
 					{
 						alert(date.status);
 					},
 					success:function (data)
 					{
 						if(data=="0")
 							{
 							alert("邮箱不可用");
 							//window.location.href='${ctx}/views/customer/add_customer.jsp';
 							}
 						else 
 						{
 							//document.getElementById("show_email").innerHTML="<span style='color:red;'>邮箱可用</span>";
 						}
 					}
 				});
		}
		else
		{
			//邮箱格式格式不正确
			document.getElementById("show_email").innerHTML="<span style='color:red;'>邮箱格式不正确</span>";
			setTimeout(function(){document.getElementById("show_email").style.display="none";},2000);
		}
	}
	function check_password()
	{
		var cusPassword=$("#cusPassword").val();
		if(cusPassword==""||cusPassword.length==0)
		{
			document.getElementById("show_cusPassword").innerHTML="<span style='color:red;'>密码不能为空</span>";
			//alter("密码不能为空");
			setTimeout(function(){document.getElementById("show_cusPassword").style.display="none";},2000);
		}else
		{
			//密码正确
			//alert("密码可用！");
		}
	}
	function check_passwordTest()
	{	
		var cusPassword=$("#cusPassword").val();
		var cusPassword_1=$("#cusPassword_1").val();
		if(cusPassword_1==""||cusPassword_1.length==0)
		{
			document.getElementById("show_againpassword").innerHTML="<span style='color:red;'>密码不能为空!</span>";
			window.location.href='${ctx}/views/customer/update_customer.jsp';
			//alter("密码不能为空");
		}else if(cusPassword!=cusPassword_1)
		{
			//密码格式格式不正确
			//alter("密码不正确");
			document.getElementById("show_againpassword").innerHTML="<span style='color:red;'>用户输入两次密码不一致!</span>";
			setTimeout(function(){document.getElementById("show_againpassword").style.display="none";},2000);
			//window.location.href='${ctx}/views/customer/update_customer.jsp';
		}
	}


	//验证邮箱类型
		function isEmail(strEmail) {
			if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
			return true;
			else
				return false;
			}
	//验证身份证类型	
		function isCusIdCard(value) {
			var isCusIdCard= /^([0-9]{18})+$/;
			if (isCusIdCard.test(value)){
				return true;
				}
			else
				return false;
			}
			
		//校验手机号码
		    function isCusPhone(value){
		    	var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
		        var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
		        if(isMob.test(value)||isPhone.test(value)){
		            return true;
		        }
		        else{
		            return false;
		        }
		    }
   </script>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                
                <strong><img alt="logo" src="${ctx}/images/logo_head.png" style="width:30px;height:30px;"/>VIVEBEST</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                 <!--用jctl进行判断当前处理的客户的状态  -->
                 <c:if test="${customer==NULL}" >
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                             当前无客户业务<i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user" id="main_nav">
                        <li><a class="cd-signin"  href="javascript:void(0);"><i class="fa fa-user fa-fw"></i> Login</a>
                        </li>
                </ul>
                </c:if>
               
               
                <c:if test="${customer!=NULL}">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                      当前进行业务客户
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      ${customer.cusName}	<i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="${ctx}/customer/showCustomer.do" ><i class="fa fa-user fa-fw"></i>客户信息</a>
                        </li>
                        <!-- <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li> -->
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="loginOut();"><i class="fa fa-sign-out fa-fw"></i>客户退出</a>
                        </li>
                    </ul>
                    </c:if>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a  href="${ctx}/teller/loginHome.do"><i class="fa fa-dashboard"></i>柜员信息中心</a>
                    </li>
					<li>
                        <a class="active-menu" href="chart.html"><i class="fa fa-bar-chart-o"></i>客户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                        <c:if test="${customer!=null}">
                            <li>
                                <a href="${ctx}/customer/showCustomer.do"> <i class="fa fa-user"></i>客户信息</a>
                            </li>
							<li>
                                <a href="${ctx}/account/forwardAccounts.do"><i class="fa fa-link"></i>当前客户账号详情</a>
                            </li>
                            <li>
                                <a href="${ctx}/views/customer/update_customer.jsp"><i class="fa fa-edit "></i>修改客户</a>
                            </li>
                        </c:if>
                        <c:if test="${customer==null}">
                            <li>
                                	<a href="${ctx}/customer/returnTakenSumbit.do"><i class="fa fa-fw fa-file"></i>新增客户</a>
                            </li>
                        </c:if>
                        </ul>
                        
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-shopping-cart"></i>客户业务<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <c:if test="${customer!=null}">
							<li>
                                <a href="${ctx}/account/forwardaddAccount.do"><i class="fa fa-money"></i>开账户业务</a>
                            </li>
                            </c:if>
                        </ul>
                    </li>
					

					<c:if test="${teller!=null}">
                    <li>
                        <a href="#"><i class="fa fa-gear fa-fw"></i>设置<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                             	<c:if test="${customer==null}">
							 <li>
                                <a href="${ctx}/views/teller/pt_update_teller_password.jsp" ><i class="fa fa-qrcode"></i>修改密码</a>
                             </li>
                              <li>
                   			 <a href="${ctx}/teller/loginOut.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    			</li>
                    			</c:if>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            客户信息修改 <small>Registered Member</small>
                    <a>${message }</a>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
              <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            基本信息
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                    <form action="${ctx}/customer/updateCustomer.do" role="from" onsubmit="return check();"  method="post">
                                <div class="col-lg-6">
                                      <!--   <div class="form-group">
                                            <label>Text Input</label>
                                            <input class="form-control">
                                        </div> -->
                                        <div class="form-group">
                                            <label>用户名称/Name</label>
                                            <input class="form-control" id="cas_Name" value="${sessionScope.customer.cusName }" name="cusName">
                                        </div>

										<div class="form-group">
                                            <label>身份证号/Identification</label>
                                            <input class="form-control" value="${sessionScope.customer.cusIdCard }" id="cusIdCard"
											name="cusIdCard"  readonly="readonly">
											<div  id="show_cusIdCard"></div>
                                        </div>

										<div class="form-group">
                                            <label>住址/Address</label>
                                            <input class="form-control" value="${sessionScope.customer.cusAddress }" id="cusAddress"
											name="cusAddress">
                                        </div>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    
                                    <h4>登陆信息</h4>
                                    
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">手机号/Phone</label>
                                            <input type="text" class="form-control" id="cusPhone" value="${sessionScope.customer.cusPhone }" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11"
											name="cusPhone"  readonly="readonly">
											<div  id="show_cusPhone"></div>
                                        </div>
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">邮箱/Email</label>
                                            <input type="text" class="form-control" id="email" value="${sessionScope.customer.cusEmail }"
											name="cusEmail"  readonly="readonly">
											<div  id="show_email"></div>
                                        </div>
                                        
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">登陆密码/Password</label>
                                            <input type="password" class="form-control" id="cusPassword" value="${sessionScope.customer.cusPassword }" maxlength="18"
											name="cusPassword"   onblur="check_password()">
											<div  id="show_cusPassword"></div>
                                        </div>
                                        
										  <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">再次输入密码/Password</label>
                                            <input type="password" class="form-control" id="cusPassword_1" value="${sessionScope.customer.cusPassword }" maxlength="18"
											name="cusPassword_1"  onblur="check_passwordTest()">
											<div  id="show_againpassword"></div>
                                        </div>
                                   
										<button type="submit" class="btn btn-primary" >提交</button>
                                        <button type="reset" class="btn btn-primary">重置 </button>
                                </div>
                                    </form>
                                <!-- /.col-lg-6 (nested) -->
                            </div>

                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
		
			</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
   <script src="${ctx}/style/assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="${ctx}/style/assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="${ctx}/style/assets/js/jquery.metisMenu.js"></script>
      <!-- Custom Js -->
    <script src="${ctx}/style/assets/js/custom-scripts.js"></script>
    
    <script type="text/javascript">
 	
 	/* $('#loginCou').on('click', function(event){
		var userName=$("#signin-username").val();
		var password=$("#signin-password").val();
		if(userName.length==0||password.length==0)

			{
			alert("输入框不能为空！");
			return null;
			}
		else
			{
		//ajax登陆
		$.ajax({
			 type:'POST',
			 data:{"cusName":userName,"cusPassword":password},
			 dataType:'html',
			 cache:false,
			 url:'${ctx}/customer/customerLogin.do',
			 error:function (responseText, textStatus, XMLHttpRequest)
            {
            },
            success: function(data){
            	if(data=="0")
          		 {
          		 alert("密码错误或用户不存在！");
          		window.location.href='${ctx}/teller/loginHome.do';
          		 }
          	 else if(data=="1")
          		 { alert("存在！");
          		 window.location.href='${ctx}/teller/loginHome.do';
          		 }
            }
		  });
			}
 	}); */
 	
 	function show_login()
	{
		var userName=$("#signin-username").val();
	var password=$("#signin-password").val();
	if(userName.length==0||password.length==0)

		{
		alert("输入框不能为空！");
		return null;
		}
	else
		{
	//ajax登陆
	$.ajax({
		 type:'POST',
		 data:{"cusName":userName,"cusPassword":password},
		 dataType:'html',
		 cache:false,
		 url:'${ctx}/customer/customerLogin.do',
		 error:function (responseText, textStatus, XMLHttpRequest)
        {
        },
        success: function(data){
        	if(data==0)
      		 {
      		 alert("密码错误或用户不存在！");
      		window.location.href='${ctx}/teller/loginHome.do';
      		//window.location.reload();
      		 }
      	 else if(data==1)
      		 { 
      		 window.location.href='${ctx}/teller/loginHome.do';
      		 }
        }
	  });
		}
	}
 	
 	function loginOut()
 	{
 			$.ajax({
 				 type:'POST',
 				 dataType:'json',
 				 url:'${ctx}/customer/customerLoginOut.do',
 				 error:function (date)
 	            {
 	           	 alert(date.status);
 	            },
 	            success: function(data){
 	            	if(data=="1")
 	            		{
 	            		window.location.href='${ctx}/views/teller/login.jsp';
 	            		}
 	            	else if(data=="0")
 	            		{
 	            		window.location.href='${ctx}/teller/loginHome.do';
 	            		//window.location.reload();
 	            		}
 	            }
 			  });
 			
 	}
 	</script>
 	
 	<script type="text/javascript">
 		function check()
 		{
 			var name=$("#cas_Name").val();
 	    	var passowrd=$("#cusPassword").val();
 	    	var passowrd_1=$("#cusPassword_1").val();
 	    	var address=$("#cusAddress").val();
 	    	
 	    	if(passowrd!=passowrd_1)
 	    		{
 	    		alert("密码不一样");
 	    		return false;
 	    		}
 	    	
 	    	else if(name.length==0||address.length==0||password.length==0||password_1.length==0)
 	    		{
 	    		alert("请输入完整");
 	    		return false;
 	    		}
 	    	else 
 	    		{
 	    		return true;
 	    		}
 		}
 	
 	</script>
   
</body>
</html>

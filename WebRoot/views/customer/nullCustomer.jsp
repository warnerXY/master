<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
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
<link href="${ctx}/style/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="${ctx}/style/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.useso.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

<link rel="stylesheet" type="text/css"
	href="${ctx}/style/home_login/main.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/style/home_login/style.css" />
<script src="${ctx}/style/assets/js/jquery-1.10.2.js"></script>
<script src="${ctx}/scripts/js/main.js"></script>

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
                
                <strong><img alt="" src="${ctx}/images/logo_head.png" style="width:30px;height:30px;"/>VIVEBEST</strong></a>
            </div>

            <!-- <ul class="nav navbar-top-links navbar-right">
                /.dropdown
                <li class="dropdown">
                 用jctl进行判断当前处理的客户的状态 
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                             当前无客户业务<i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user" id="main_nav">
                        <li><a class="cd-signin" href="#0"><i class="fa fa-user fa-fw"></i> Login</a>
                        </li>
                </ul>
                
               <nav class="main_nav">
					<ul >
						<li><a class="cd-signin" href="#0"><i class="fa fa-user fa-fw"></i> Losgin</a></li>
					</ul>
				</nav>
               
               
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                      当前进行业务客户	<i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    /.dropdown-user
                </li>
                /.dropdown
            </ul> -->
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
             <ul class="nav" id="main-menu">
                  <c:if test="${teller.autId==2}">
                  	 <li>
                        <a  href="ui-elements.html"><i class="fa fa-desktop"></i>主管业务<span class="fa arrow"></span></a>
                         	<ul class="nav nav-second-level">
                         	<li>
                            <a  href="${ctx}/teller/loginHome.do"><i class="fa fa-user"></i>个人信息</a>
                            </li>  
                            <li>
                            <a  href="ui-elements.html"><i class="fa fa-desktop"></i>柜员管理<span class="fa arrow"></span></a>
                            	<ul class="nav nav-third-level" style="font-size: 14px">
                                	 <li> <a href="${ctx}/teller/to_register.do"><i class="fa fa-desktop"></i>新增柜员</a></li>

                               	</ul>
                                <ul class="nav nav-third-level" style="font-size: 14px">
                                	<li><a href="chart.html"><i class="fa fa-edit "></i>柜员信息修改</a></li>
                                </ul>
                            </li>
                            </ul>
                            </li>
                            
                            <li>
                        <a  href="ui-elements.html"><i class="fa fa-user"></i>客户管理<span class="fa arrow"></span></a>
                         	<ul class="nav nav-second-level" style="font-size: 14px">  
                            <li>
                                <a class="chart.html" href="${ctx}/customer/customerlist.do"><i class="fa fa-users"></i>客户信息维护和管理</a>
                    			 </li>
                            </ul>
                            </li>
                            
                            <li>
                        <a  href="ui-elements.html"><i class="fa fa-money"></i>账户管理<span class="fa arrow"></span></a>
                         	<ul class="nav nav-second-level" style="font-size: 14px">  
                            <li>
                               <a class="chart.html" href="${ctx}/account/list.do"><i class="fa fa-money"></i>查看账户信息</a>
                    			 </li>
                            </ul>
                            </li>
                            
                            <li>
                        		<a href="#"><i class="fa fa-sitemap"></i>查询业务<span class="fa arrow"></span></a>
                        		<ul class="nav nav-second-level">
							 	<li>
                                	<a href="${ctx}/transactions/list.do"><i class="fa fa-eye"></i>查看交易记录</a>
                             	</li>
                              	<li>
                                 <a href="${ctx}/transferInfo/list.do"><i class="fa fa-link"></i>查看转账情况</a>
                              	</li>
                        		</ul>
                    		</li>
                            
						</c:if>
						<!-- 柜员权限管理 -->
						<c:if test="${teller.autId==3}">
						<li>
                        <a  href="ui-elements.html"><i class="fa fa-desktop"></i>经理业务<span class="fa arrow"></span></a>
                        	<ul class="nav nav-second-level">
                        	<li>
                        		<a href="chart.html"><i class="fa fa-desktop"></i>柜员管理<span class="fa arrow"></span></a>
                        		<ul  class="nav nav-third-level" style="font-size: 14px">
                               		<li><a href="${ctx}/teller/showTeller.do"><i class="fa fa-bar-chart-o"></i>柜员权限管理</a></li>
                               </ul>
                    		</li>
                            <li>
                               <a href="chart.html"><i class="fa fa-bar-chart-o"></i>增加权限等级</a>
                            </li>
                       </ul>
                     </li>
                     </c:if>
					<c:if test="${teller!=null}">
                    <li>
                        <a href="#"><i class="fa fa-gear fa-fw"></i>设置<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
							 <li>
                                <a href="#" ><i class="fa fa-qrcode"></i>修改密码</a>
                             </li>
                              <li>
                   			 <a href="${ctx}/teller/loginOut.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    			</li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
        </nav>


		<!-- 用户登录窗口 -->
		<!--  <div class="cd-user-modal"> 
					<div class="cd-user-modal-container">
						<ul class="cd-switcher">
				<li><a href="#0">用户登录</a></li>
			</ul>

			<div id="cd-login"> 登录表单
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signin-username">用户名</label>
						<input class="full-width has-padding has-border" id="signin-username" type="text" placeholder="输入用户名">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="输入密码">
					</p>


					<p class="fieldset">
						<input class="full-width2" type="submit" value="登 录">
					</p>
				</form>
			</div>


			<a href="#0" class="cd-close-form">关闭</a>
		</div>
	</div> -->

		<div class="cd-user-modal">
			<div class="cd-user-modal-container">
				<ul class="cd-switcher">
					<li><a href="#0">更改柜员信息</a></li>
				</ul>

				<div id="cd-login">
					<form class="cd-form">
						<p class="fieldset">
							<label>工号</label> <input
								class="full-width has-padding has-border" id="teller_no"
								type="text" rea>
						</p>

						<p class="fieldset">
							<label>姓名</label> <input
								class="full-width has-padding has-border" id="teller_name"
								type="text">
						</p>

						<p class="fieldset">
							<label>角色</label> <select
								class="full-width has-padding has-border">
								<option value="1">普通</option>
								<option value="2">高管</option>
								<option value="3">主管</option>
								<option value="4">财务</option>
							</select>
						</p>
						<input class="full-width has-padding has-border" type="submit"
							value="更改">
					</form>
				</div>


				<a href="#0" class="cd-close-form">关闭</a>
			</div>
		</div>









		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">


				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header" align="center">
							<small>工号:${teller.tNumber}</small>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>姓名:${teller.tName}</small> <br>
							<br>
							<div align="center">
								<font size="10px">客户信息 </font>
							</div>
						
						</h1>
					</div>
				</div>
					<div class="row">
						<div class="col-md-6" style="width: 100%;text-align: center;">
							<!--    Striped Rows Table  -->
							<div class="panel panel-default">
								<div class="panel-heading"></div>
								<div class="panel-body" style="text-align: center;">
									<div class="table-responsive">
										<div align="center">
											${message }
										</div>
								
									</div>
								</div>
							</div>
							<!--  End  Striped Rows Table  -->
						</div>
					</div>
				<!-- /. PAGE INNER  -->
			</div>
			<!-- /. PAGE WRAPPER  -->
		</div>
		<!-- /. WRAPPER  -->
		<!-- JS Scripts-->
		<!-- jQuery Js -->

		<!-- Bootstrap Js -->
		<script src="${ctx}/style/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${ctx}/style/assets/js/jquery.metisMenu.js"></script>
		<!-- Morris Chart Js -->
		<script src="${ctx}/style/assets/js/morris/raphael-2.1.0.min.js"></script>
		<script src="${ctx}/style/assets/js/morris/morris.js"></script>


		<script src="${ctx}/style/assets/js/easypiechart.js"></script>
		<script src="${ctx}/style/assets/js/easypiechart-data.js"></script>

		<script src="${ctx}/style/assets/js/Lightweight-Chart/jquery.chart.js"></script>

		<!-- Custom Js -->
		<script src="${ctx}/style/assets/js/custom-scripts.js"></script>

		<script src="${ctx}/scripts/main.js"></script>

		<script type="text/javascript">
			function show() {

				//
			}
		</script>
</body>
</html>



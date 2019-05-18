<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>我的钱包</title>
	<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
	<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
	<link rel="stylesheet" href="<%=basePath%>css/user.css" />

	<!-- bootstrap -->
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
<div class="pre-2" id="big_img">
	<img
			src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
			class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
	<div id="user_area">
		<div id="home_header">
			<a href="<%=basePath%>goods/homeGoods">
				<h1 class="logo"></h1>
			</a>
			<a href="<%=basePath%>goods/homeGoods">
				<img src="<%=basePath%>img/home_header.png"  style="margin-left: 20px;" >
			</a>
			<a href="<%=basePath%>user/home">
				<div class="home"></div>
			</a>
		</div>
		<!--

		描述：左侧个人中心栏
	-->
		<div id="user_nav">
			<div class="user_info">
				<div class="head_img">
					<img src="<%=basePath%>img/photo.jpg">
				</div>
				<div class="big_headimg">
					<img src="">
				</div>
				<span class="name">${cur_user.username}</span>
				<hr>
				<!--   <span class="school">莆田学院</span> -->
				<a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">我的钱包：￥${myPurse.balance}</a>
				<input type="hidden" value="${myPurse.recharge}" id="recharge"/>
				<input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>

			</div>
			<div class="home_nav">
				<ul>
					<a href="<%=basePath%>orders/myOrders">
						<li class="notice">
							<div></div> <span>订单中心</span> <strong></strong>
						</li>
					</a>
					<a href="<%=basePath%>user/allFocus">
						<li class="fri">
							<div></div> <span>关注列表</span> <strong></strong>
						</li>
					</a>
					<a href="<%=basePath%>goods/publishGoods">
						<li class="store">
							<div></div> <span>发布物品</span> <strong></strong>
						</li>
					</a>
					<a href="<%=basePath%>user/allGoods">
						<li class="second">
							<div></div> <span>我的闲置</span> <strong></strong>
						</li>
					</a>
					<a href="<%=basePath%>user/basic">
						<li class="set">
							<div></div> <span>个人设置</span> <strong></strong>
						</li>
					</a>
				</ul>
			</div>
		</div>
		<!--

		描述：右侧内容区域
	-->
		<div id="user_content">

			<div class="share">

				<!--

				描述：关注商品展示
			-->
				<h1 style="text-align: center">我的钱包</h1>
				<hr />
				<div class="share_content">
					<div class="story">
						<div class="container">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist" style="width: 46%">
								<!-- <li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home">全部订单</a></li> -->
								<li class="nav-item"><a class="nav-link active" data-toggle="tab"
								                        href="#alipay_recharge" >充值</a></li>
								<li class="nav-item" ><a class="nav-link" data-toggle="tab"
								                         href="#alipay_withdraw" >提现</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content" style="width: 46%">
								<!-- 充值Tab -->
								<div id="alipay_recharge" class="container tab-pane active"
								     style="width: 100%">
									<br>
									<form id="myRecharge" class="form-horizontal" role="form"
									      action="<%=basePath%>user/recharge" method="post" >
										<div class="form-group">
											<label  class="col-sm-2 control-label">余额：</label>
											<div class="col-sm-10">
												<input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
											</div>
											<label  class="col-sm-2 control-label" >充值：</label>
											<div class="col-sm-10">
												<input name="recharge" type="number" class="form-control recharge" style="border:0px;background:rgba(0, 0, 0, 0); "  data-toggle="tooltip"  title="请输入整数金额！"/>
												<%-- value="${myPurse.recharge}"  value="${myPurse.withdrawals}"--%>
											</div>
										</div>
										<hr />
										<div class="form-group">
											<div class="col-sm-8">
												<c:if test="${errMsg != null}">
													${errMsg}
												</c:if>
											</div>
											<div class="col-sm-4">
												<a  onclick="upAnddown(1)" class="btn btn-danger">立即充值</a>
											</div>
										</div>
									</form>
								</div>
								<!-- 提现Tab -->
								<div id="alipay_withdraw" class="container tab-pane fade"
								     style="width: 100%">
									<br>
									<form id="myWithdraw" class="form-horizontal" role="form"
									      action="<%=basePath%>user/withdraw" method="post" >
										<div class="form-group">
											<label  class="col-sm-3 control-label">余额：</label>
											<div class="col-sm-9">
												<input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
											</div>
											<label  class="col-sm-3 control-label" >支付宝账号：</label>
											<div class="col-sm-9">
												<input name="payee_account" type="text" class="form-control payee_account" style="border:0px;background:rgba(0, 0, 0, 0); "  data-toggle="tooltip" />
											</div>
											<label  class="col-sm-3 control-label" >提现金额：</label>
											<div class="col-sm-9">
												<input name="amount" type="number" class="form-control amount" style="border:0px;background:rgba(0, 0, 0, 0); "  data-toggle="tooltip"  />
											</div>
										</div>
										<hr />
										<div class="form-group">
											<div class="col-sm-offset-8 col-sm-4">
												<a  onclick="upAnddown(2)" class="btn btn-danger">立即提现</a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

</body>
<script type="text/javascript">
    $(".btn_mypurse").on('click',function(){

        if(1${myPurse.state}!=1){
            var state=1${myPurse.state}
            /* 	var recharge=${myPurse.recharge};
				var withdrawals=${myPurse.withdrawals}; */
            if(state==10){
                alert("您的申请,还【未审核】！")
            }
            if(state==11){
                alert("您的申请，已审核【不通过】，请联系管理员！")
            }
            if(state==12){
                alert("您的申请，已审核【通过】~")
            }
            if(state==11||state==12){
                /*ajax 修改数据库state==null */
                var id=${myPurse.id};
                $.ajax({
                    url:'<%=basePath%>admin/updatePurseState',
                    type:'GET',
                    data:{id:id},
                    dataType:'json'
                });
                location.reload();
            }
        }
    });
</script>
<script type="text/javascript">

    function upAnddown(num){
        var reg=/^[1-9]\d*$|^0$/;
        if(num==1){
            var Recharge=$(" input[ name='recharge' ] ").val();
            if(Recharge==null || Recharge==""){
                alert("请输入您要充值的金额！")
            }else if(reg.test(Recharge)!=true){
                alert("您输入的金额格式有误，请重新输入！")
            }else{
                $(".withdrawals").val("");

                //提交表单
                $("#myRecharge").submit();
            }

        }
        if(num==2){
            var withdrawals=$(" input[ name='amount' ] ").val();
            var payee_account=$(" input[ name='payee_account' ] ").val();
            console.log(withdrawals)
	        console.log(payee_account)
            if(withdrawals==null || withdrawals==""){
                alert("请输入您要提现的金额！")
            }else if(reg.test(withdrawals)!=true){
                alert("您输入的金额格式有误，请重新输入！")
            }else if(withdrawals>${myPurse.balance}){
                alert("您输入的金额太大，请重新输入！")
            }else{
                //提交表单
                $("#myWithdraw").submit();

                $(".amount").val("");
                $(".payee_account").val("");
            }
        }

    }
</script>
</html>
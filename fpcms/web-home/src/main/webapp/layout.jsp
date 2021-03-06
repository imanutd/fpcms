<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<c:if test="${requestHost != 'www.fpzhangsha.com' }">
	<meta name="robots" content="noarchive">
	</c:if>
	
	<duowan:block name="head">
	</duowan:block>
	
	<link href="${ctx}/styles/kaipiao.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
		#kefuDialog {
			padding: 10px 20px 30px 20px;
			font-size: 14px;
			color: #598418;
			background: rgb(233,242,250);
		}
	</style>
</head>

<body>
	<div id="top" class="width">
		<div>
		<div id="top_logo">
			<div style="width: 600px">
				<div style="height: 100px;">
					<div style="float: left;width: 90px;" ><img src="${ctx}/images/logo_left.jpg" ></img></div>
					<div>
						<div style="height:15px;"></div>
						<div style="float: left;width: 510px;">
							<div><span style="font-size: 30pt;font-weight: 900;">${city}${company}</span></div>
						</div>
						<div  id="template_layout_top_contact" style="float: left;display: block; width: 400px;">
							<font style="font-size: 15pt;font-weight: 900; margin-left: 5px;"><font color=red>QQ</font>:{%= o.qq %} <font color=red>电话</font>:{%= o.mobile %}</font>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="top_other">
			<b><a href="javascript:addFavorite('${company}-发票','${keyword}');">加入收藏夹</a> | <a href="${ctx}/rss.xml">RSS</a></b>
		</div>
		</div>
	</div>
	<div id="menu_bg">
		<div id="menu">
			<ul class="menu">
				<li class="l"></li>
				
				<li>
					<a href="${ctx}/"><span>网站首页</span></a>
				</li>
				<li class="m"></li>
				
				<c:forEach	items="${nav}" var="item">
				<li>
					<a href="${ctx}/${item.channelCode}.do"><span>${item.channelName}</span></a>
				</li>
				<li class="m"></li>
				</c:forEach>
				
				<li class="r"></li>
			</ul>
		</div>
	</div>
	
	<div id="banner">
		<img src="${ctx}/images/banner_03.jpg"   />
	</div>

	<div class="width mt10">
		<div id="page_left" style="float: left;">
			<duowan:block name="page_left">
				<div class="border mt10" style="font-size: 15pt">
					<div class="subject_bg">
						<div class="subject_title"><font color="red" style="font-size: 15pt">联系我们</font></div>
					</div>
					<div class="m10 " id="template_contact_layout">
						<div align="left" >
						<b>联系人:</b> {%= o.contactName %} <br/>
						<b>电话:</b>&nbsp;&nbsp;&nbsp;{%= o.mobile %} <br/>
						<b>QQ:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{%= o.qq %}<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=${requestHost}&amp;menu=yes"><img src="http://wpa.qq.com/pa?p=2:${qq}:41" border="0" /></a>
						</div>
					</div>
				</div>
			</duowan:block>
		</div>

		<!--Left Over-->
		<div id="page_right" style="float: right;">
			<duowan:block name="pageRight">
			<div class="border">
				<div class="subject_bg">
					<div class="subject_title"><duowan:block name="subTitle"></duowan:block></div>
				</div>
				<div >
					<div class="neirong">
						<duowan:block name="content"></duowan:block>
					</div>
				</div>
			</div>
			</duowan:block>
			<duowan:block name="subPageRight"/>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/js/application.js"></script>
	<script type="text/javascript" src="${ctx}/js/misc.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/js/tmpl.js"></script>

	<div class="width" id="foot">
		<duowan:block name="foot">
		</duowan:block>
		<div class="foot_menu">
			<a href="/">网站首页</a> | 
		</div>
		<strong>${company}</strong> <br /> Copyright &copy; 2005-2012｜&nbsp;&nbsp;保留所有权利 | 时间:<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
		<div>
			${links}
		</div>
	</div>
	
	<div id="kefuDialog" style="display: none;">
		<div style="width:400px;height:157px; display:block; background-color: rgb(204,242,255);">
			<img src="${ctx}/images/kefu.jpg" style="float: left;"/>
			
			<div style="float: right; margin-top: 70px; margin-right: 30px">
			<b>咨询购买<font color="red">发票</font>相关业务</b>
			<br/>
			<br/>
			<br/>
			<button id="btn-custom1" onclick="openQQChat()">QQ客服沟通</button>
			<button id="btn-custom2" onclick="closeKefuDialog()">关闭</button>
			</div>
		</div>
	</div>
	
	<div id="kefuContainer"></div>
	<script  type="text/javascript">
		var chatLink = "<a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=${requestHost}&amp;menu=yes'><img src='${ctx}/images/online_chat.gif'/><br/><img src='${ctx}/images/qq.png'/></a><br/>";
		var chatLink2 = "客服1<a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=${requestHost}&amp;menu=yes'><a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=网站&amp;menu=yes'><img src='http://wpa.qq.com/pa?p=2:${qq}:41' border='0'/></a><br/>客服2<a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=网站&amp;menu=yes'><a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=网站&amp;menu=yes'><img src='http://wpa.qq.com/pa?p=2:${qq}:41' border='0'/></a><br/>客服3<a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=网站&amp;menu=yes'><a href='http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=网站&amp;menu=yes'><img src='http://wpa.qq.com/pa?p=2:${qq}:41' border='0'/></a><br/>";
		generateLeftRightAD(chatLink,chatLink2);
		
		function closeKefuDialog() {
			$("#_kefuDialogDiv").hide();
			$.cookie('closedKefuDialog', 'true', { expires: 700000000, path: '/' });
		}
		function openQQChat() {
			closeKefuDialog();
			window.open("http://wpa.qq.com/msgrd?v=3&amp;uin=${qq}&amp;site=${requestHost}&amp;menu=yes");
		}
		function openKefuDialog() {
			var closedKefuDialog = $.cookie('closedKefuDialog');
			if('true' == closedKefuDialog) {
				return;
			}
			
			var content = generateKefuDialog($('#kefuDialog').html());
			$("#kefuContainer").append(content);
		}

		setTimeout(openKefuDialog,3000);
	</script>
	<script type="text/javascript">
		tmplWithSiteProperty("template_contact_layout","${ctx}","${requestHost}");
		tmplWithSiteProperty("template_layout_top_contact","${ctx}","${requestHost}");
	</script>
	
	${websiteStatCode}
	
</body>
</html>

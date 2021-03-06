<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$('#inputForm').ajaxForm({
		beforeSubmit : function(){},
		dataType : 'json',
		success : function(data){
			$.parseJsonResult(data,function(data){
				$.info("操作成功");
				$("#mainDiv").renderUrl("${ctx}/dao/main");
			},function(msg,data){
				$.messager.alert("提示信息",msg,"error");
			});
			$("#saveBtn").removeAttr("status");
		},
		error : function(data){
			$.info("操作出错，请联系管理员");
			$("#saveBtn").removeAttr("status");
		}
	});
	$("#typeId").loadSelect({
		data : null, //select中需要填充的数据，如果提供了该数据，则直接将这个数据填充到色了传统中，若未提供，则根据url去取
		params : {},//用于获得select中数据的地址
		url : "${ctx}/dict/daoType",//用于获得select中数据的地址
		value : 'key', //取json数据data中，用于表示option的value属性的标示
		text : 'value',//取json数据data中，用于表示option的text属性的标示
		defaultValue : '${dao.type}',//默认被选中的值
		changeFn : null,//change事件
		fn : null//装载完以后调用的回调函数
	});
	validatorGroup_setting = [];
	$.formValidator.initConfig({
		submitButtonID:"saveBtn",
		debug:false,
		onSuccess:function(){
			if($("#saveBtn").attr("status")){
				return false;
		    }
		    $("#saveBtn").attr("status","1");
		    return true;
		},
		onError:function(msg,obj,errorlist){
			$.info(msg);
		},
		ajaxPrompt : '数据提交中...'
	});
	$("#typeId").formValidator({
		empty :false,autoModify:true,onShow:"请选择类型",onFocus:"请选择类型",onCorrect:"恭喜您,操作正确"
	});	
});
</script>
<form  class="form" id="inputForm" method="post" action="${ctx }/dao/save" >
	<input type="hidden" name="id" id="idId" value="${dao.id}" />
	<table class="form-table" cellpadding="0" cellspacing="0">
		<tr> 
	      <td class="righttd">类型:</td>
	      <td class="lefttd"  style="width:300px" >
			<select  style="width:280px;height:20px;" name="type" id="typeId" >
			</select>
	      </td>
	      <td class="lefttd"><div id="typeIdTip" style="width:250px"></div></td>
	    </tr>
		<tr> 
	      <td class="righttd"></td>
	      <td colspan="2" class="lefttd">
	      <input type="button" id="saveBtn" value="保存" onclick="if($.formValidator.pageIsValid()) $('#inputForm').submit()" />
	      <input type="reset" id="resetBtn" value="重置" />
	      <input type="button" id="backToListBtn" onclick='javascript:$("#mainDiv").renderUrl("${ctx}/dao/main");' value="返回列表" />
	      </td>
	    </tr>
	</table>
</form>
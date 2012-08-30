<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#controllerTable table tbody tr :checkbox").click(function(e){//执行默认checkbox行为后会再次出发tr的click时间，因此这里将默认行为反向
		e.stopPropagation();
		return true;
	});
	$("#controllerTable table tbody tr").unbind().bind("mouseover",function(){
    	$(this).addClass("hover-tr");
    }).bind("mouseout",function(){
    	$(this).removeClass("hover-tr");
    }).bind("click",function(){
    	$(this).find(":checkbox").click();
    }).bind("dblclick",function(){
    	
    	view($(this).find(":checkbox").val());
    });
	var spanAsc = $('<span class="icon-ascsort">&nbsp;</span>');
	var spanDesc = $('<span class="icon-descsort">&nbsp;</span>');
	$("#controllerTable table th[sort]").mouseover(function(){
		$(this).addClass("hover-sort");
	}).mouseout(function(){
		$(this).removeClass("hover-sort");
	});
	$("#controllerTable table th[sort]").click(function(){
		var $this =  $(this);
		var sort = $this.attr("sort");
		var order = $this.attr("order");
		if(!sort){
			return false;
		}
		if(!order){
			order = "desc";
		}else {
			order = (order == "desc"?"asc":"desc");
		}
		$("#controllerSearcher #sortPropertyId").val(sort);
		$("#controllerSearcher #sortOrderId").val(order);
		$("#controllerTable table th span").remove();
		if(order == "desc"){
			$this.append(spanDesc);
		}else{
			$this.append(spanAsc);
		}
		search();
	});
});
</script>
<div id="controllerTable">
	<table class="list-table" cellpadding="0" cellspacing="1">
		<thead>
			<tr title="点击表头进行排序">
				<th id="selectAll" onclick="checkAllBox(this);">全选</th>
				<th sort="name"  order="${sort.sortOrder}" >方法名<c:if test="${sort != null && sort.sortProperty == 'name'}"><span class="icon-${sort.sortOrder}sort">&nbsp;</span></c:if></th>
				<th>类型</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ controllers}" var="controller">
			<tr idVar="${controller.id}">
				<td><input type="checkbox" value="${controller.id}" /></td>
				<td>
				${controller.name}
				</td>
				<td>
				${g:var("com.wanmei.domain.ControllerHelper","typeMap")[controller.type]}
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="background-color: #d3eaef;text-align:right;padding-right:10px;" >
<c:if test="${!empty commonList && commonList.pageNum>1 }">
	<g:page commonList="${commonList}"  uri="${ctx}/controller/list" target="#controllerTable" pageNum="5" model="3" op="replace" />  
</c:if>
	</div>
</div>
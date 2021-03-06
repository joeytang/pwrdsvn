package com.wanmei.tool.paging;


/**
 * Created by IntelliJ IDEA.
 * User: joeytang
 * Date: 2012-03-23 14:32
 * 
 * 共[1/8]页 第一页 上一页  1 2 3 4 5 下一页  最末页 
 */
public class PagesModel3 implements PagesModel {

     /**
	 * 根据 commonlist和pagenum生成分页html代码
	 * @param cl 包含分页需要的信息
	 * @param pageNum 限制每屏显示的页码个数 ，如：上一页  1 2 3 4 5 下一页该值表示中间显示多少个页码
	 * @return
	 */
	@Override
	public String genPageHtml(CommonList cl, int pageNum,String op) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("共[" + cl.pageNo + "/" + cl.pageNum + "]页" + "&nbsp;");
        if (cl.pageNo == 1) {
            buffer.append("第一页" + "&nbsp;");
            buffer.append("上一页" + "&nbsp;");
        } else if (cl.pageNo > 1) {
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + 1 + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\" >第一页</a>");
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + (cl.pageNo - 1) + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\" >上一页</a>");
        }
        int currentNum = (cl.pageNo % pageNum == 0 ? (cl.pageNo / pageNum) - 1 : (int) (cl.pageNo / pageNum)) * pageNum;
        if (currentNum < 0) currentNum = 0;
        if (cl.pageNo > pageNum) {
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + (currentNum - pageNum + 1) + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\">...</a>");
        }

        //---------------------------------
        // 显示中间可用的翻页码
        //---------------------------------
        for (int i = 0; i < pageNum; i++) {
            if ((currentNum + i + 1) > cl.pageNum || cl.pageNum < 2) break;
            if(currentNum + i + 1 == cl.pageNo){
           	 buffer.append((currentNum + i + 1) + "");
            }else{
           	 buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + (currentNum + i + 1) + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\" >");
           	 buffer.append((currentNum + i + 1) + "");
           	 buffer.append("</a>");
            }
        }
        
        if (cl.pageNum > (currentNum + pageNum)) {
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + (currentNum + 1 + pageNum) + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\">...</a>");
        }
        
        if (cl.pageNo == cl.pageNum) {
            buffer.append("下一页" + "&nbsp;");
            buffer.append("最末页" + "&nbsp;");
        } else if (cl.pageNo < cl.pageNum) {
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + (cl.pageNo + 1) + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\" >下一页</a>");
            buffer.append(" <a href=\"javascript:;\" onclick=\"_tunePage(" + cl.pageNum + ",'','"+ cl.uri+"','"+ cl.target +"','"+op+"','" + cl.searchStr + "')\" >最末页</a>");
        }
		return buffer.toString();
	}
    
}

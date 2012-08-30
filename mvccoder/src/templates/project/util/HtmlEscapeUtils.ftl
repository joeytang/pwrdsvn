package ${project.org}.util;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.web.util.HtmlUtils;

/**
 * 
 * html文本防入侵转义
 * 
 * User: joeytang
 * Date: ${project.currentTime}
 *
 */
public class HtmlEscapeUtils {

	
	public static String escape(String content){
		
		/**
		 * 转义 <, >, &
		 */
		content = HtmlUtils.htmlEscape(content);
		/**
		 * sql 注入转义
		 */
		content = StringEscapeUtils.escapeSql(content);
		
		return content;
	}
	
	/**
	 * 
	 * @Description sql特殊字符转义
	 * @param query
	 * @return
	 */
	public static String escapeSql(String query) {
		if (query == null) {
			return query;
		}

		return query.replace("%", "\\%").replace("_", "\\_");
	}
	
	public static void main(String[] args){
		System.out.println(escapeSql(escape("%<script >alert(1);</script>")));
	}
}
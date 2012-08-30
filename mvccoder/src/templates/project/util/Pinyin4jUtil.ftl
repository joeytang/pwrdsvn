package ${project.org}.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 * User:joeytang
 * Date: ${project.currentTime}
 * 中文拼音转换工具
 */
public class Pinyin4jUtil {
	/**
	 * 将汉字转换为全拼
	 * 
	 * @param src
	 * @return String
	 */
	public static String getPinYin(String src) {
		char[] t1 = null;
		t1 = src.toCharArray();
		String[] t2 = new String[t1.length];
		// 设置汉字拼音输出的格式
		HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
		t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		t3.setVCharType(HanyuPinyinVCharType.WITH_V);
		String t4 = "";
		int t0 = t1.length;
		try {
			for (int i = 0; i < t0; i++) {
				// 判断能否为汉字字符
				// System.out.println(t1[i]);
				if (Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
					t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);// 将汉字的几种全拼都存到t2数组中
					t4 += t2[0];// 取出该汉字全拼的第一种读音并连接到字符串t4后
				} else {
					// 如果不是汉字字符，间接取出字符并连接到字符串t4后
					t4 += Character.toString(t1[i]);
				}
			}
		} catch (BadHanyuPinyinOutputFormatCombination e) {
			e.printStackTrace();
		}
		return t4;
	}

	/**
	 * 提取每个汉字的首字母
	 * 
	 * @param str
	 * @return String
	 */
	public static String getPinYinHeadChar(String str) {
		String convert = "";
		for (int j = 0; j < str.length(); j++) {
			char word = str.charAt(j);
			// 提取汉字的首字母
			String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
			if (pinyinArray != null) {
				convert += pinyinArray[0].charAt(0);
			} else {
				convert += word;
			}
		}
		return convert;
	}

	/**
	 * 将字符串转换成ASCII码
	 * 
	 * @param cnStr
	 * @return String
	 */
	public static String getCnASCII(String cnStr) {
		StringBuffer strBuf = new StringBuffer();
		// 将字符串转换成字节序列
		byte[] bGBK = cnStr.getBytes();
		for (int i = 0; i < bGBK.length; i++) {
			// System.out.println(Integer.toHexString(bGBK[i] & 0xff));
			// 将每个字符转换成ASCII码
			strBuf.append(Integer.toHexString(bGBK[i] & 0xff));
		}
		return strBuf.toString();
	}

	public static Connection getConn(){

		
		try{
			String url = "jdbc:mysql://localhost/wmtc?characterEncoding=utf-8";
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			Connection conn = DriverManager.getConnection(url, "root", "123");
			
			return conn;
		}catch(Exception ex){
			
			System.out.println("database connect error.");
			return null;
		}
	}

	public static void main(String[] args) throws SQLException {
		String cnStr = "赵翔";
		System.out.println(getPinYin(cnStr));
		System.out.println(getPinYinHeadChar(cnStr));
		System.out.println(getCnASCII(cnStr));
		
		/*
		Connection conn = getConn();
		
		Statement stmt = null;
		ResultSet rs = null;
		Statement stmt2 = null;
		try{
			String sql = "select * from user";
			//System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()){
				stmt2 = conn.createStatement();
				int userId = rs.getInt("user_id");
				String userName = rs.getString("user_name");
				System.out.println(userId + " " + userName);
				String pinYin = getPinYin(userName);
				String pinYinHeadChar = getPinYinHeadChar(userName);
				
				sql = "update user set user_name_full_pinyin = '" + pinYin + "'" 
				+ ", user_name_short_pinyin='" + pinYinHeadChar + "' where user_id="+ userId;
				
				stmt2.executeUpdate(sql);
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (stmt2 != null)
				stmt2.close();
			if (conn != null)
				conn.close();
		}
		*/
	}
}

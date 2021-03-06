<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE taglib PUBLIC "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.2//EN" "http://java.sun.com/dtd/web-jsptaglibrary_1_2.dtd">
<taglib>
	<tlib-version>2.2.3</tlib-version>
	<jsp-version>1.2</jsp-version>
  	<short-name>g</short-name>
  	<uri>/general-tags</uri>
  	<display-name>"general Tags"</display-name>
  	<function>
	  	<name>var</name>
	  	<function-class>${project.org}.tool.elfunc.CustomFunctions</function-class>
	  	<function-signature>java.lang.Object getVar(java.lang.String,java.lang.String)</function-signature>
  	</function>
    <tag>
        <name>page</name>
        <tag-class>${project.org}.tool.paging.Pages</tag-class>
   		<body-content>empty</body-content>
	    <attribute>
	      <name>commonList</name>
	      <required>true</required>
	      <rtexprvalue>true</rtexprvalue>
	    </attribute>
	    <attribute>
            <name>value</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>pageNum</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>model</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>uri</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>target</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>op</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
    </tag>
    <tag>
        <name>msg</name>
        <tag-class>${project.org}.tool.tag.ActionMessageTag</tag-class>
   		<body-content>empty</body-content>
        <attribute>
            <name>key</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
    </tag>
    <tag>
        <name>maxlength</name>
        <tag-class>${project.org}.tool.tag.MaxLengthString</tag-class>
   		<body-content>empty</body-content>
        <attribute>
            <name>value</name>
            <required>true</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
        <attribute>
            <name>length</name>
            <required>true</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
    </tag>
</taglib>
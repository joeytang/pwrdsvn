<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>${project.name}</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
		<buildCommand>
			<name>org.eclipse.jdt.core.javabuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
	</buildSpec>
	<natures>
		<nature>org.eclipse.jem.workbench.JavaEMFNature</nature>
		<nature>org.eclipse.wst.common.modulecore.ModuleCoreNature</nature>
		<nature>org.eclipse.wst.common.project.facet.core.nature</nature>
		<nature>org.eclipse.jdt.core.javanature</nature>
		<nature>org.eclipse.wst.jsdt.core.jsNature</nature>
		<#if project.needTomcatPlug  >
		<nature>com.sysdeo.eclipse.tomcat.tomcatnature</nature>
		</#if>
	</natures>
</projectDescription>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u��Ʒs�W - addEmp.jsp</title>
<s:head theme="xhtml" /><!-- �w�] -->
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
</head>
<body bgcolor='white' onLoad="setValue()">

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>���u��Ʒs�W - addEmp.jsp</h3></td>
			<td><a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/tomcat.gif"	width="100" height="100" border="1"> �^���� </a></td></tr></table>

	<%-- ���~��C --%>
	<%-- <s:fielderror cssStyle="color: blue" /> --%>

	<h3>���u���:</h3>
	<s:form action="addEmp" namespace="/emp">
		<s:textfield name="empVO.ename" label="���u�m�W" />
		<s:textfield name="empVO.job"   label="���u¾��" />
		<sx:datetimepicker name="empVO.hiredate" label="���Τ��"	type="date" displayFormat="yyyy-MM-dd " id="picker1" language="zh-tw" cssStyle="background:cyan ; font-size:13.5px" /><%-- �˱��Ӫ� value="%{'today'}" , ���javascript��setValue()--%>
		<s:textfield name="empVO.sal"  label="���u�~��" />
		<s:textfield name="empVO.comm" label="���u����" />
		<s:bean name="com.dept.model.DeptService" id="deptSvc" />
		<s:select name="empVO.deptVO.deptno" label="���u����" labelposition="center" list="#deptSvc.all" listKey="deptno" listValue="dname" />
	    <s:submit value="�e�X�s�W" method="add" />
	</s:form>

	<script type="text/javascript">
		function setValue() {
			var picker1 = dojo.widget.byId("picker1");
			if (picker1.getValue() == "")
				picker1.setValue(new Date()); //Date value  //picker.setValue('2007-01-01');  //string value
		}
	</script>

</body>
</html>


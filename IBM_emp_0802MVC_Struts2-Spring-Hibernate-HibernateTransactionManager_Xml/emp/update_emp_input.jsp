<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u��ƭק� - update_emp_input.jsp</title>
<s:head theme="xhtml"  /><!-- �w�] -->
<sx:head debug="false" cache="false"  parseContent="false" compressed="false"  extraLocales="zh-tw,en-us,ja,ko"/>
</head>
<body bgcolor='white' >

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>���u��ƭק� - update_emp_input.jsp</h3>
			          <a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif"  width="100" height="32" border="0">�^���� </a></td></tr></table>
	
	<h3>���u���:</h3>
	<s:form action="updateEmp" namespace="/emp" >
	    <s:textfield name="empVO.empno" label="���u�s��" value="%{#request.empVO.empno}"  readonly="true" cssStyle="background:gray" />
		<s:textfield name="empVO.ename" label="���u�m�W" value="%{#request.empVO.ename}"/> 
		<s:textfield name="empVO.job"   label="���u¾��" value="%{#request.empVO.job}"/>
		<sx:datetimepicker name="empVO.hiredate"  label="���Τ��"  type="date" displayFormat="yyyy-MM-dd"  id="picker1" language="zh-tw" cssStyle="background:cyan ; font-size:13.5px" value="%{#request.empVO.hiredate}"/>
		<s:textfield name="empVO.sal"  label="���u�~��" value="%{#request.empVO.sal}"/>
		<s:textfield name="empVO.comm" label="���u����" value="%{#request.empVO.comm}"/>
		<s:bean   name="com.dept.model.DeptService" id="deptSvc" />
		<s:select name="empVO.deptVO.deptno" label="���u����" labelposition="center" list="#deptSvc.all" listKey="deptno" listValue="dname" value="%{#request.empVO.deptVO.deptno}"/>
		<s:submit value="�e�X" method="update"/>
		<s:reset  value="���s��J" />
		<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--��e�X�ק諸�ӷ��������|,�qrequest���X��,�A�e��Controller�ǳ���椧��-->
        <input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
	</s:form>

<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>
</body>
</html>


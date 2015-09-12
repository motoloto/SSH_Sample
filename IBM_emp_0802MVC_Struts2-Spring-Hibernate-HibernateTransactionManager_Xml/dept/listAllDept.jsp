<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%-- �����]�����ݭn�����~����, �ҥH(��N)���ϥ�Struts2�����UI����, ���ϥζǲΪ�Html����  --%>

<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Ҧ����� - listAllDept.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����]�����ݭn�����~����, �ҥH(��N)���ϥ�Struts2�����UI����, ���ϥζǲΪ�Html����</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='orange' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ����� - ListAllDept.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�����s��</th>
		<th>�����W��</th>
		<th>������a</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�߳������u</th>
	</tr>
	
	<c:forEach var="deptVO" items="${deptSvc.all}">
		<tr align='center' valign='middle'>
			<td>${deptVO.deptno}</td>
			<td>${deptVO.dname}</td>
			<td>${deptVO.loc}</td>
			<td>
			  <FORM METHOD="post" ACTION="updateDept.action">
			    <input type="submit" value="�ק�" disabled> 
			    <input type="hidden" name="deptno" value="${deptVO.deptno}">
			    <input type="hidden" name="action" value="getOne_For_Update_Dept">
			</td></FORM>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/deleteDept.action">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="deptno" value="${deptVO.deptno}">
			    <input type="hidden" name="action" value="delete_Dept">
			</td></FORM>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/listEmpsByDeptno.action">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="deptno" value="${deptVO.deptno}">
			    <input type="hidden" name="action" value="listEmps_ByDeptno_B">
			</td></FORM>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listEmps_ByDeptno")!=null){%>
       <jsp:include page="listEmps_ByDeptno.jsp" />
<%} %>

</body>
</html>

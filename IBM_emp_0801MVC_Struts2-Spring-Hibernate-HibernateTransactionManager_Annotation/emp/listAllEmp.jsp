<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%-- �����ĥ� JSTL �P EL ���� --%>

<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Ҧ����u��� - listAllEmp.jsp</title>
<s:head theme="xhtml"  /><!-- �w�] -->
</head>
<body bgcolor='white'>
<b><font color=red>�����ĥέ�Ӫ� JSTL �P EL ����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>�Ҧ����u��� - ListAllEmp.jsp</h3>
		          <a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>¾��</th>
		<th>���Τ��</th>
		<th>�~��</th>
		<th>����</th>
		<th>����</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(empVO.empno==param["empVO.empno"]) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${empVO.empno}</td>
			<td>${empVO.ename}</td>
			<td>${empVO.job}</td>
			<td>${empVO.hiredate}</td>
			<td>${empVO.sal}</td>
			<td>${empVO.comm}</td>			
			<td>
	          ${empVO.deptVO.deptno}�i<font color=orange>${empVO.deptVO.dname}</font> - ${empVO.deptVO.loc}�j               
			</td>
			<td>
			  <s:form action="getOne_For_UpdateEmp" namespace="/emp"  method="getOne_For_Update">
			     <s:submit value="�ק�" />
			        <input type="hidden" name="empno" value="${empVO.empno}">
			        <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			        <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     </s:form>
			</td>
			<td>
			  <s:form action="deleteEmp" namespace="/emp"  method="delete">
			     <s:submit value="�R��" />
			        <input type="hidden" name="empno" value="${empVO.empno}">
			        <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			        <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     </s:form>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>

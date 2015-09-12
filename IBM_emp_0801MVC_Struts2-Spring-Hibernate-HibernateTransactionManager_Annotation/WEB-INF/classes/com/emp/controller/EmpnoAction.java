package com.emp.controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.dept.model.DeptService;
import com.emp.model.EmpService;
import com.emp.model.EmpVO;

public class EmpnoAction extends ActionSupport {
	private Integer empno;

	public Integer getEmpno() {
		return empno;
	}

	public void setEmpno(Integer empno) {
		this.empno = empno;
	}

	public String getOne_For_Display() {
		if (getOne()) {
			System.out.println("��Ʈw getOne_For_Display ���\");
			return "success";
		} else {
			super.addFieldError("empno", "�d�L���");
			return "input";
		}
	}

	public String getOne_For_Update() {
		if (getOne()) {
			System.out.println("��Ʈw getOne_For_Update ���\");
			return "success";
		} else {
			super.addFieldError("empno", "�d�L���");  //�ƹ�W, getOne_For_Update��, �ä��|�o�ͬd�L��ƪ����p
			return "input";
		}
	}

	public boolean getOne() {
		EmpService empSvc = new EmpService();
		EmpVO empVO = empSvc.getOneEmp(empno);
		if (empVO != null) {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("empVO", empVO);
			return true;
		} else
			return false;
	}

	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestURL = request.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
		System.out.println("requestURL="+requestURL);
		
		// Perform business logic
		EmpService empSvc = new EmpService();
		EmpVO empVO = empSvc.getOneEmp(empno);
		empSvc.deleteEmp(empno);
		System.out.println("��Ʈw delete ���\");
		
		// Send the Success view
		if(requestURL.equals("/emp/listAllEmp.jsp"))
			return "success1";
		else if(requestURL.equals("/dept/listEmps_ByDeptno.jsp")){
			DeptService deptSvc = new DeptService();
			request.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptVO().getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
			return "success2";
		}else if(requestURL.equals("/dept/listAllDept.jsp")){
			DeptService deptSvc = new DeptService();
			request.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptVO().getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
			return "success3";
		}else return null;
	}

}

package com.emp.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dept.model.DeptVO;

public class EmpService {

	private EmpDAO_interface dao;

	public EmpService() {
		//dao = new EmpHibernateDAO();
		//��1: ���Mmodel-config1-DriverManagerDataSource.xml�]�i�H��
		//��2: �����F�ϥ�Apache DBCP�s�u��,�H�����į�,�ҥH���U��model-config2-JndiObjectFactoryBean.xml����dataSource�]�w�O�ĥ�org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(EmpDAO_interface) context.getBean("empDAO");
	}

	// ���ϥ�
	public EmpVO addEmp(String ename, String job, java.sql.Date hiredate,
			Double sal, Double comm, Integer deptno) {

		EmpVO empVO = new EmpVO();

		empVO.setEname(ename);
		empVO.setJob(job);
		empVO.setHiredate(hiredate);
		empVO.setSal(sal);
		empVO.setComm(comm);
		DeptVO deptVO = new DeptVO();
		deptVO.setDeptno(deptno);
		empVO.setDeptVO(deptVO);
		dao.insert(empVO);

		return empVO;
	}

	// �w�d�� Struts 2 �Ϊ�
	public void addEmp(EmpVO empVO) {
		dao.insert(empVO);
	}

	public EmpVO updateEmp(Integer empno, String ename, String job,
			java.sql.Date hiredate, Double sal, Double comm, Integer deptno) {

		EmpVO empVO = new EmpVO();

		empVO.setEmpno(empno);
		empVO.setEname(ename);
		empVO.setJob(job);
		empVO.setHiredate(hiredate);
		empVO.setSal(sal);
		empVO.setComm(comm);
		DeptVO deptVO = new DeptVO();
		deptVO.setDeptno(deptno);
		empVO.setDeptVO(deptVO);
		dao.update(empVO);

		return dao.findByPrimaryKey(empno);
	}

	// ���ϥ�
	public EmpVO updateEmp(EmpVO empVO) {
		dao.update(empVO);
		return dao.findByPrimaryKey(empVO.getEmpno());
	}

	public void deleteEmp(Integer empno) {
		dao.delete(empno);
	}

	public EmpVO getOneEmp(Integer empno) {
		return dao.findByPrimaryKey(empno);
	}

	public List<EmpVO> getAll() {
		return dao.getAll();
	}
}

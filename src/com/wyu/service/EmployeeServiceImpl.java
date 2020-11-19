package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.EmployeeCustomMapper;
import com.wyu.mapper.EmployeeMapper;
import com.wyu.pojo.Employee;
import com.wyu.pojo.EmployeeExample;


@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper mapper;

	@Autowired
	private EmployeeCustomMapper employeeCustomMapper;
	
	@Override
	public int addEmployee(Employee employee) {
		return mapper.insert(employee);
	}

	@Override
	public List<Employee> findEmployees() {
//		EmployeeExample example = new EmployeeExample();
//		return mapper.selectByExample(example);
		
		return employeeCustomMapper.findEmployeeAndDeptAndJobName();
	}

	@Override
	public List<Employee> findEmployeesLike(Employee employee) {
		return employeeCustomMapper.selectByExample(employee);
	}

	@Override
	public int deleteEmployee(int number) {
		return mapper.deleteByPrimaryKey(number);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return mapper.updateByPrimaryKeySelective(employee);
	}

}

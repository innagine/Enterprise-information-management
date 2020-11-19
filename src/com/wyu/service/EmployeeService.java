package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Employee;

public interface EmployeeService {

	int addEmployee(Employee employee);

	List<Employee> findEmployees();

	List<Employee> findEmployeesLike(Employee employee);

	int deleteEmployee(int number);

	int updateEmployee(Employee employee);

}

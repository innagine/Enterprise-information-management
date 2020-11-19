package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Dept;

public interface DeptService {

	int addDept(Dept dept);

	List<Dept> findDpets();

	List<Dept> findDeptsLike(Dept dept);

	int deleteDept(int number);

	int updateDept(Dept dept);

}

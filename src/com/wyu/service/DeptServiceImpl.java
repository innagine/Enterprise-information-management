package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.DeptMapper;
import com.wyu.pojo.Dept;
import com.wyu.pojo.DeptExample;
import com.wyu.pojo.DeptExample.Criteria;


@Service
public class DeptServiceImpl implements DeptService {
	
	
	
	@Autowired
	private DeptMapper mapper;
	

	@Override
	public int addDept(Dept dept) {
		
		return mapper.insert(dept);
	}


	@Override
	public List<Dept> findDpets() {
		DeptExample example = new DeptExample();
		
		return mapper.selectByExample(example);
	}


	@Override
	public List<Dept> findDeptsLike(Dept dept) {
		DeptExample example = new DeptExample();
		Criteria criteria = example.createCriteria();
		criteria.andDnameLike("%"+dept.getDname()+"%");
		if(dept.getDid()!=null) {
			criteria.andDidEqualTo(dept.getDid());
		}
		if(dept.getDremark()!=null) {
			criteria.andDremarkLike("%"+dept.getDremark()+"%");
		}
		example.or();
		return mapper.selectByExample(example);
	}


	@Override
	public int deleteDept(int number) {
		return mapper.deleteByPrimaryKey(number);
	}


	@Override
	public int updateDept(Dept dept) {
		return mapper.updateByPrimaryKeySelective(dept);
	}

}

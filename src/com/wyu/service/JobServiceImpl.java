package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.JobMapper;
import com.wyu.pojo.Job;
import com.wyu.pojo.JobExample;
import com.wyu.pojo.JobExample.Criteria;


@Service
public class JobServiceImpl implements JobService {
	
	@Autowired
	private JobMapper mapper;

	@Override
	public List<Job> findJobs() {
		JobExample example = new JobExample();
		return mapper.selectByExample(example);
	}

	@Override
	public int addJob(Job job) {
		return mapper.insert(job);
	}

	@Override
	public List<Job> findJobsLike(Job job) {
		JobExample example = new JobExample();
		Criteria criteria = example.createCriteria();
		criteria.andJnameLike("%"+job.getJname()+"%");
		if(job.getJid()!=null) {
			criteria.andJidEqualTo(job.getJid());
		}
		if(job.getJremark()!=null) {
			criteria.andJremarkLike("%"+job.getJremark()+"%");
		}
		example.or();
		return mapper.selectByExample(example);
	}

	@Override
	public int deleteJob(int number) {
		return mapper.deleteByPrimaryKey(number);
	}

	@Override
	public int updateJob(Job job) {
		return mapper.updateByPrimaryKeySelective(job);
	}

}

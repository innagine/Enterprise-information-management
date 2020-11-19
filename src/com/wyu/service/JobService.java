package com.wyu.service;

import java.util.List;

import com.wyu.pojo.Job;

public interface JobService {

	List<Job> findJobs();

	int addJob(Job job);

	List<Job> findJobsLike(Job job);

	int deleteJob(int number);

	int updateJob(Job job);

}

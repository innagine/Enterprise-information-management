package com.wyu.test;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.wyu.mapper.EmployeeMapper;
import com.wyu.mapper.UserMapper;
import com.wyu.pojo.Employee;
import com.wyu.pojo.User;

public class Test1 {
	public static void main(String[] args) {
		SqlSession session = getSession();
		EmployeeMapper employeeMapper = session.getMapper(EmployeeMapper.class);
		UserMapper userMapper = session.getMapper(UserMapper.class);
		
		User user = userMapper.selectByPrimaryKey("1");
		System.out.println(user);
		
		Employee employee = employeeMapper.selectByPrimaryKey(1);
		System.out.println(employee);
	}

	public static void deleteOne(EmployeeMapper employeeMapper, int id) {
		int re = employeeMapper.deleteByPrimaryKey(id);
		if(re!=0) {
			System.out.println("删除成功");
		}else {
			System.out.println("删除失败");
		}
	}

	public static void updataOne(EmployeeMapper employeeMapper) {
		Employee employee = new Employee();
		employee.setId(5);
		employee.setDeptId(1);
		employee.setJobId(2);
		employee.setName("小明");
		int in = employeeMapper.updateByPrimaryKey(employee);
		if(in!=0) {
			System.out.println("修改成功");
			System.out.println(employee);
		}else {
			System.out.println("修改失败");

		}
	}

	public static void insertOne(EmployeeMapper employeeMapper) {
		Employee employee = new Employee();
		employee.setId(5);
		employee.setDeptId(1);
		employee.setJobId(1);
		employee.setName("小明");
		
		int in = employeeMapper.insertSelective(employee);
		if(in!=0) {
			System.out.println("添加成功");
			System.out.println(employee);
		}else {
			System.out.println("添加失败");

		}
	}

	public static void selectOne(EmployeeMapper employeeMapper) {
		Employee employee = employeeMapper.selectByPrimaryKey(1);
		System.out.println(employee);
	}

	public static SqlSession getSession(){
		try {
		// 读取mybatis的核心配置文件
		String configXml = "mybatis-config.xml";

		InputStream inputStream = Resources.getResourceAsStream(configXml);

		// 创建sqlSessionFactory
		SqlSessionFactory sqlSession = new SqlSessionFactoryBuilder().build(inputStream);

		// 使用sqlSessionFactory 创建sqlSession
		SqlSession session = sqlSession.openSession(true);
		return session;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}

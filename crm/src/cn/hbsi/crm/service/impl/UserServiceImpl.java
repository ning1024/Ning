package cn.hbsi.crm.service.impl;

import org.springframework.transaction.annotation.Transactional;

import cn.hbsi.crm.dao.UserDao;
import cn.hbsi.crm.domain.User;
import cn.hbsi.crm.service.UserService;
import cn.hbsi.crm.utils.MD5Utils;

@Transactional
public class UserServiceImpl implements UserService {

	//注入userDao
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void register(User user) {
		
		String new_pass = MD5Utils.getPwd(user.getUser_pass());
		//System.out.println(new_pass);
		
		user.setUser_pass(new_pass);
		
		//UserDao实现数据的持久化
		userDao.register(user);		
	}

	@Override
	public User login(User user) {
		
		//将用户输入的密码MD5加密后，再和数据库的密码进行比较
		user.setUser_pass(MD5Utils.getPwd(user.getUser_pass()));
		return userDao.login(user);
	}

}

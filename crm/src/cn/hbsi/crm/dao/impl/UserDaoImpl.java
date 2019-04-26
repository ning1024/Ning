package cn.hbsi.crm.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.hbsi.crm.dao.UserDao;
import cn.hbsi.crm.domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public void register(User user) {
		
		//HibernateDaoSupport封装了hibernateTemplate的使用
		this.getHibernateTemplate().save(user);
	}

	@Override
	@SuppressWarnings("unchecked")
	public User login(User user) {
		String hql = "from User where user_account = ? and user_pass = ?";
		
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, 
				user.getUser_account(),
				user.getUser_pass()
		);
		
		if(list.size() > 0){
			return list.get(0);
		}
		//没有查询用户
		return null;
	}
	
	
}

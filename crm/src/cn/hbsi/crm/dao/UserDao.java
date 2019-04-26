package cn.hbsi.crm.dao;

import cn.hbsi.crm.domain.User;

public interface UserDao {

	void register(User user);

	User login(User user);

}

package cn.hbsi.crm.service;

import cn.hbsi.crm.domain.User;

public interface UserService {

	void register(User user);

	User login(User user);

}

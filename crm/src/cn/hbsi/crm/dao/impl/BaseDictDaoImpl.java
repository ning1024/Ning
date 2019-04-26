package cn.hbsi.crm.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.hbsi.crm.dao.BaseDictDao;
import cn.hbsi.crm.domain.BaseDict;

public class BaseDictDaoImpl extends HibernateDaoSupport implements BaseDictDao {

	@Override
	public List<BaseDict> findByTypeCode(String dict_type_code) {
		
		String hql = "from BaseDict where dict_type_code = ?";
		return (List<BaseDict>) this.getHibernateTemplate().find(hql, dict_type_code);
		
		
	}

	
}

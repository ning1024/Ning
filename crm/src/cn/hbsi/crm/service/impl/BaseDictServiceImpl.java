package cn.hbsi.crm.service.impl;

import java.util.List;

import cn.hbsi.crm.dao.BaseDictDao;
import cn.hbsi.crm.domain.BaseDict;
import cn.hbsi.crm.service.BaseDictService;

public class BaseDictServiceImpl implements BaseDictService{

	//注入baseDictDao
	private BaseDictDao baseDictDao;
	
	
	public void setBaseDictDao(BaseDictDao baseDictDao) {
		this.baseDictDao = baseDictDao;
	}

	@Override
	public List<BaseDict> findByTypeCode(String dict_type_code) {
		return baseDictDao.findByTypeCode(dict_type_code);
	}
}

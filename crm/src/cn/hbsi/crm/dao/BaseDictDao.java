package cn.hbsi.crm.dao;

import java.util.List;

import cn.hbsi.crm.domain.BaseDict;

public interface BaseDictDao {

	List<BaseDict> findByTypeCode(String dict_type_code);

}

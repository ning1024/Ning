package cn.hbsi.crm.service;

import java.util.List;

import cn.hbsi.crm.domain.BaseDict;

public interface BaseDictService {

	List<BaseDict> findByTypeCode(String dict_type_code);

}

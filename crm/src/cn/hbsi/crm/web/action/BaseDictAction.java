package cn.hbsi.crm.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.hbsi.crm.domain.BaseDict;
import cn.hbsi.crm.service.BaseDictService;
import net.sf.json.JSONArray;


public class BaseDictAction extends ActionSupport implements ModelDriven<BaseDict>{

	//封装数据
	private BaseDict baseDict = new BaseDict();
	
	@Override
	public BaseDict getModel() {
		
		return baseDict;
	}
	
	//注入baseDictService
	private BaseDictService baseDictService;

	public void setBaseDictService(BaseDictService baseDictService) {
		this.baseDictService = baseDictService;
	}


	//根据type_code查询数据字典信息
	public String findByTypeCode() throws IOException{
		
		//调用业务层查询
		List<BaseDict> list = baseDictService.findByTypeCode(baseDict.getDict_type_code());
		
		//需要将集合转黄成json格式的字符串，返回给ajax
		//JSONArray将list、数组转换成JSON格式
		//JSONObject将map集合、对象转换成JSON对象
		JSONArray jsonArray = JSONArray.fromObject(list);

		//将JSON格式的字符串响应给客户端
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
		
		return NONE;
		
	}
	
}

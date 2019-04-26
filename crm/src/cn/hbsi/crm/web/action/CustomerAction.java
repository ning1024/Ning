package cn.hbsi.crm.web.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.hbsi.crm.domain.Customer;
import cn.hbsi.crm.domain.PageBean;
import cn.hbsi.crm.service.CustomerService;
import cn.hbsi.crm.utils.UploadUtils;
import net.sf.json.JSONObject;

public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{

	//封装数据
	private Customer customer = new Customer();
	
	@Override
	public Customer getModel() {
		
		return customer;
	}
	
	//注入CustomerService
	private CustomerService customerService;

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	//必须告诉我们当前是第几页
	private Integer page = 1;
	
	//必须告诉我们每页显示多少记录
	private Integer rows = 3;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	//使用struts2内置的文件上传，必须提供如下三个属性
	private String uploadFileName;
	private File upload;
	private String uploadContentType;
	
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	//添加客户的方法
	public String save() throws IOException {
		
		if(upload != null) {
			//将上传的文件上传到临时的目录，如果需要的话，可以将其拷贝到目标地址
			//如果不需要，程序执行完毕临时文件就会被释放
			String path = "e:/uploads/";
			
			File file = new File(path);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			//给上传的文件取一个随机的名称，不能重复
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			
			File destFile = new File(path + uuidFileName);
			FileUtils.copyFile(upload, destFile);
			
			//将目标文件名保存到数据库
			customer.setCust_image(uuidFileName);
		}
		
		//接收ajax方式表单提交过来的数据
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			customerService.save(customer);
			map.put("msg", "添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "添加失败");
		}
		
		//将map集合响应给客户端
		JSONObject jsonObject = JSONObject.fromObject(map);
		
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().println(jsonObject.toString());
		
		return NONE;
	}
	
	//分页查询客户列表的方法
	public String findByPage() throws IOException {
		
		//命令service层进行分页查询
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
		PageBean<Customer> pageBean = customerService.findByPage(detachedCriteria,page,rows);
		
		//给客户端相应json格式的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageBean.getTotalCount());
		map.put("rows", pageBean.getList());
		
		JSONObject jsonObject = JSONObject.fromObject(map);
		
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().println(jsonObject.toString());
		
		System.out.println(jsonObject.toString());
		
		return NONE;
	}
	
	//删除用户
	public String delete() throws IOException {
		
		//先根据客户id查询客户的信息
		Customer customer1 = customerService.findById(customer.getCust_id());
		
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			
			//删除客户的图像
			File file = new File("e:/uploads/" + customer1.getCust_image());
			if(file.exists()) {
				file.delete();
			}
			
			//在删除数据表中的记录
			customerService.delete(customer1);
			map.put("msg", "删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "删除失败");
		}
		
		//将map集合转为json字符串后响应给客户端
		JSONObject jsonObject = JSONObject.fromObject(map);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(jsonObject);
		
		return NONE;
	}
	
	//根据id查询客户信息
	public String findById() throws IOException {
		
		Customer customer1 = customerService.findById(customer.getCust_id());
		
		//根据客户信息响应给客户端
		JSONObject jesonObject = JSONObject.fromObject(customer1);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().println(jesonObject.toString());
		
		return NONE;
	}
	
	//更新操作
	public String update() throws IOException {
		
		//先判断是否上传新的图像，如果上传了，则需要删除旧的图像
		if(upload != null) {
			//说明上传文件了，就应该删除旧的文件
			Customer customer1 = customerService.findById(customer.getCust_id());
			File file = new File("e:/uploads/" + customer1.getCust_image());
			if(file.exists()) {
				file.delete();
			}
			//再上传新的图像
			String path = "c:/uploads/";
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			File destFile = new File(path + uuidFileName);
			FileUtils.copyFile(upload, destFile);
			
			customer.setCust_image(uuidFileName); //把新上传的图像更新到customer这个bean中
		}
		
		//将新的图像地址，和其他表单项的值一同更新到数据库
		Map<String, String> map = new HashMap<String, String>();
		try {
			customerService.update(customer);
			map.put("msg", "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "更新失败");
		}
		
		JSONObject jsonObject = JSONObject.fromObject(map);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf8");
		ServletActionContext.getResponse().getWriter().println(jsonObject.toString());
		
		return NONE;
	}
}

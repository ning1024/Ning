package cn.hbsi.crm.domain;

public class Customer {
	private Long cust_id;
	private String cust_name;
	/**
	private String cust_source;
	private String cust_industry;
	private String cust_level;
	*/
	private String cust_phone;
	private String cust_mobile;
	//客户资质的图像文件
	private String cust_image;
	
	//多对一的关系，需要在多的一方创建外键，指向一的一方
	private BaseDict baseDictSource;  //表示多个客户属于一个来源
	private BaseDict baseDictIndustry;//表示多个客户可以属于一个行业
	private BaseDict baseDictLevel;	  //表示多个客户可以属于一个级别
	
	public Long getCust_id() {
		return cust_id;
	}
	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	public String getCust_image() {
		return cust_image;
	}
	public void setCust_image(String cust_image) {
		this.cust_image = cust_image;
	}
	public BaseDict getBaseDictSource() {
		return baseDictSource;
	}
	public void setBaseDictSource(BaseDict baseDictSource) {
		this.baseDictSource = baseDictSource;
	}
	public BaseDict getBaseDictIndustry() {
		return baseDictIndustry;
	}
	public void setBaseDictIndustry(BaseDict baseDictIndustry) {
		this.baseDictIndustry = baseDictIndustry;
	}
	public BaseDict getBaseDictLevel() {
		return baseDictLevel;
	}
	public void setBaseDictLevel(BaseDict baseDictLevel) {
		this.baseDictLevel = baseDictLevel;
	}
	
}

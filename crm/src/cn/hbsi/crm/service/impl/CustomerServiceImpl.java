package cn.hbsi.crm.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.hbsi.crm.dao.CustomerDao;
import cn.hbsi.crm.domain.Customer;
import cn.hbsi.crm.domain.PageBean;
import cn.hbsi.crm.service.CustomerService;

@Transactional
public class CustomerServiceImpl implements CustomerService {

	//注入CustomerDao
	private CustomerDao customerDao;
	
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	@Override
	public void save(Customer customer) {

		customerDao.save(customer);
	}

	@Override
	public PageBean<Customer> findByPage(DetachedCriteria detachedCriteria, Integer page, Integer rows) {
		
		//创建pageBean
		PageBean<Customer> pageBean = new PageBean<Customer>();
		
		//设置当前页数
		pageBean.setCurrentPage(page);
		
		//设置每页显示的记录数
		pageBean.setPageSize(rows);
		
		//设置总的记录数
		Integer totalCount = customerDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		
		//设置总的页数
		Double totalPages = Math.ceil(totalCount / rows);
		pageBean.setTotalPages(totalPages.intValue());
		
		//设置客户列表集合
		Integer offset = (page -1) * rows;
		List<Customer> list = customerDao.findByPage(detachedCriteria,offset,rows);
		pageBean.setList(list);
		
		return pageBean;
	}

	//删除客户
	//先查询要删除的客户id
	@Override
	public Customer findById(Long cust_id) {
		
		return customerDao.findById(cust_id);
	}

	@Override
	public void delete(Customer customer1) {
		
		customerDao.delete(customer1);
		
	}

	@Override
	public void update(Customer customer) {
		
		customerDao.update(customer);
		
	}



}

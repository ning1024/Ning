package cn.hbsi.crm.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.hbsi.crm.domain.Customer;
import cn.hbsi.crm.domain.PageBean;

public interface CustomerService {

	void save(Customer customer);

	PageBean<Customer> findByPage(DetachedCriteria detachedCriteria, Integer page, Integer rows);

	Customer findById(Long cust_id);

	void delete(Customer customer1);

	void update(Customer customer);

}

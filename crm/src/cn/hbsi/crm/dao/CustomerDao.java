package cn.hbsi.crm.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.hbsi.crm.domain.Customer;

public interface CustomerDao {

	void save(Customer customer);

	Integer findCount(DetachedCriteria detachedCriteria);

	List<Customer> findByPage(DetachedCriteria detachedCriteria, Integer offset, Integer rows);

	Customer findById(Long cust_id);

	void delete(Customer customer1);

	void update(Customer customer);

}

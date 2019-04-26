package cn.hbsi.crm.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.hbsi.crm.dao.CustomerDao;
import cn.hbsi.crm.domain.Customer;

public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {

	@Override
	public void save(Customer customer) {
		
		this.getHibernateTemplate().save(customer);
	}

	//设置总的记录数
	@Override
	public Integer findCount(DetachedCriteria detachedCriteria) {
		
		//设置查询条件
		detachedCriteria.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
		
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//分页查询客户列表
	@Override
	public List<Customer> findByPage(DetachedCriteria detachedCriteria, Integer offset, Integer rows) {
		detachedCriteria.setProjection(null);
		return (List<Customer>) this.getHibernateTemplate().findByCriteria(detachedCriteria,offset,rows);
	}

	//删除客户
	//根据id查询客户信息
	@Override
	public Customer findById(Long cust_id) {
		
		return this.getHibernateTemplate().get(Customer.class,cust_id );
		
	}

	//删除客户对象
	@Override
	public void delete(Customer customer1) {
		
		this.getHibernateTemplate().delete(customer1);
		
	}

	@Override
	public void update(Customer customer) {
		
		this.getHibernateTemplate().update(customer);
		
	}

}

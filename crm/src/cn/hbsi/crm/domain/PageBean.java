package cn.hbsi.crm.domain;

import java.util.List;

public class PageBean<T> {

	private Integer currentPage;    //当前的页数
	private Integer pageSize;       //每页显示的记录数
	private Integer totalCount;     //总的记录数
	private Integer totalPages;     //总的页数
	private List<T> list;           //分页查询的数据列表
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
}

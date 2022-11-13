package com.bean.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页助手
 * @author SZU
 *
 */
public class PageAssistant<T> implements Serializable {
	
	/** 总记录数   */
	//符合要求的数据总条数
	private int count;
	/** 总页数   */
	//通过总记录数 和 页面大小计算得到
	private int totalPage;
	/** 页面大小  */
	//每页显示的数据条数
	private int pageSize = 5;
	/** 当前页 */
	//当前显示的是第几页
	private int currPage = 1;
	/** 起始记录序号  */
	//sql中从第几条数据开始查询. 通过当前页和页面大小计算得到
	private int startCode = 0;
	/** 页面内容 */
	//一个集合, 用于存放页面需要显示的内容
	private List<T> items;
	
	@Override
	public String toString() {
		return "PageAssistant [count=" + count + ", totalPage=" + totalPage + ", pageSize=" + pageSize + ", currPage="
				+ currPage + ", startCode=" + startCode + ", items=" + items + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		setTotalPage();
	}

	public int getTotalPage() {
		return totalPage;
	}

	private void setTotalPage() {
		
		this.totalPage = count / pageSize;
		
		//判断, 是否整除
		if(count % pageSize != 0) {
			totalPage++;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setTotalPage();
		setStartCode();
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
		setStartCode();
	}

	public int getStartCode() {
		return startCode;
	}

	private void setStartCode() {
		this.startCode = (currPage - 1) * pageSize;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}
	
}

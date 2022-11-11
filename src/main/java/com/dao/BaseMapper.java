package com.dao;

import java.util.List;
import java.util.Map;

/**
 * 基础数据接口
 * @author SZU
 *
 */
public interface BaseMapper<E, Vo> {

	/** 添加 */
	int insert(E e);
	/** 删除 */
	int delete(E e);
	/** 修改 */
	int update(E e);
	/** 查询 */
	List<Vo> select(E e);
	/** 查询总记录数 */
	int selectCount(Map<String, Object> map);
	/** 查询(分页/条件) */
	List<Vo> selectByPage(Map<String, Object> map);
}

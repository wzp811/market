package com.bean.vo;

import java.util.Date;

import com.bean.entity.Role;

/**
 * 用户Vo
 * view object 与界面显示对接的实体类
 * @author SZU
 *
 */
public class UserVo {

	private Long id;
	private String userName;
	private String password;
	private String realName;
	private Integer gender;
	private Date birthday;
	private String phone;
	private String address;
	private Integer roleId;
	
	private String genderName;
	private Integer age;
	private Role role;
	
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", userName=" + userName + ", password=" + password + ", realName=" + realName
				+ ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", address=" + address
				+ ", roleId=" + roleId + ", genderName=" + genderName + ", role=" + role + "]";
	}

	public Integer getAge() {
		return age;
	}

	private void setAge() {
		
		//获取系统当前时间
		Date now = new Date();
		
		//获取年份
		int nowYear = now.getYear();
		int birthYear = birthday.getYear();
		
		//计算得到虚岁
		age = nowYear - birthYear;
		
		//获取月份
		int nowMonth = now.getMonth();
		int birthMonth = birthday.getMonth();
		
		//判断, 没有过生日
		if(nowMonth < birthMonth) {
			age--;
			return;
		}
		
		//已经过了生日
		if(nowMonth > birthMonth) return;
		
		//获取日
		int nowDate = now.getDate();
		int birthDate = birthday.getDate();
		
		//判断, 未过生日
		if(nowDate < birthDate) {
			age--;
			return;
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
		setGenderName();
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
		setAge();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getGenderName() {
		return genderName;
	}

	private void setGenderName() {
		switch (gender) {
			case 1:
				genderName = "男";
				break;
			case 2:
				genderName = "女";
				break;
			case 0:
				genderName = "保密";
				break;
		}
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}

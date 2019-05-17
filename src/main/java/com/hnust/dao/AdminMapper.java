package com.hnust.dao;

import com.hnust.pojo.Admin;

public interface AdminMapper {
	
	
	public Admin findAdmin(Long phone, String password);

	public Admin findAdminById(Integer id);

	public void updateAdmin(Admin admins);

}

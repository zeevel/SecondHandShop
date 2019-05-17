package com.hnust.service;

import com.hnust.pojo.Admin;

public interface AdminService {

	
	public Admin findAdmin(Long phone, String password);

	public Admin findAdminById(Integer id);

	public void updateAdmin(Admin admins);
	
	

}

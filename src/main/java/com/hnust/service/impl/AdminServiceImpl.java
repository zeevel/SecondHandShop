package com.hnust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hnust.dao.AdminMapper;
import com.hnust.pojo.Admin;
import com.hnust.service.AdminService;

@Service(value="adminService")
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper am;

	public Admin findAdmin(Long phone, String password) {
		// TODO Auto-generated method stub
		return am.findAdmin(phone,password);
	}

	public Admin findAdminById(Integer id) {
		// TODO Auto-generated method stub
		return am.findAdminById(id);
	}

	public void updateAdmin(Admin admins) {
		 am.updateAdmin(admins);
	}


	

}

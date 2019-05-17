package com.hnust.service;

import java.util.List;

import com.hnust.pojo.Notice;

public interface NoticeService {

	List<Notice> getNoticeList();
	
	public void insertSelective(Notice notice);
	
	



}

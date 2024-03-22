package com.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.ListDto;
import com.project.mapper.ListMapper;

import lombok.Setter;

@Service
public class BasicService {
	
	@Setter(onMethod_ = @Autowired)
	private ListMapper mapper;
	
	public ArrayList<ListDto> list() {
		return mapper.list();
	}
	
	public ListDto read(long bno) {
		return mapper.read(bno);
	}
	
	public void write(ListDto dto) {
		mapper.write(dto);
	}

}

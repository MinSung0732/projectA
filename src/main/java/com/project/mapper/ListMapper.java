package com.project.mapper;

import java.util.ArrayList;

import com.project.dto.ListDto;

public interface ListMapper {
	public ArrayList<ListDto> list();
	public ListDto read(long bno);
	public void write(ListDto dto);
}

package com.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.dto.SignUpDto;

public interface SignUpMapper {
	public void signUp(SignUpDto dto);
	public ArrayList<SignUpDto> loginList();
	public SignUpDto signIn(@Param("id") String id, @Param("word") String word);
}

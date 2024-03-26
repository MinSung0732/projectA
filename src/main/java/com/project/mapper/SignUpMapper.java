package com.project.mapper;

import java.util.ArrayList;

import com.project.dto.SignUpDto;

public interface SignUpMapper {
	public void signUp(SignUpDto dto);
	public ArrayList<SignUpDto> loginList();
	public SignUpDto signIn(SignUpDto dto);
}

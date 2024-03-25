package com.project.mapper;

import java.util.ArrayList;

import com.project.dto.WeightDto;
import com.project.dto.myWeightDto;

public interface WeightMapper {
	public ArrayList<WeightDto> getWeight();
	public ArrayList<myWeightDto> searchList(myWeightDto myDto);
	public void setterWeight(WeightDto dto);
	public WeightDto myWeight(String id);
	public void del(long id);
}

package com.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.ListDto;
import com.project.dto.WeightDto;
import com.project.dto.myWeightDto;
import com.project.mapper.ListMapper;
import com.project.mapper.WeightMapper;

@Service
public class BasicService {
	
	@Autowired
	private ListMapper mapper;
	@Autowired
	private WeightMapper weightMapper;
	
	public ArrayList<ListDto> list() {
		return mapper.list();
	}
	
	public ListDto read(long bno) {
		return mapper.read(bno);
	}
	
	public void write(ListDto dto) {
		mapper.write(dto);
	}
	
	public ArrayList<WeightDto> myWeight(){
		return weightMapper.getWeight();
	}
	
	public WeightDto readWeight(String id) {
		return weightMapper.myWeight(id);
	}
	
	public ArrayList<myWeightDto> searchList(String id){
		myWeightDto myDto = new myWeightDto();
		myDto.setId(id);
		return weightMapper.searchList(myDto);
	}
	
	public void weight(WeightDto dto) {
        if (weightMapper != null) {
            weightMapper.setterWeight(dto);
        } else {
           System.out.println("null");
        }
    }
	
	public void del(long id) {
		weightMapper.del(id);
	}

}

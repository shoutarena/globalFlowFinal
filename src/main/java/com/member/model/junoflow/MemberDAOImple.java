package com.member.model.junoflow;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAOImple implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberDTO loginCheck(MemberDTO temp) {
		MemberDTO dto = sqlSessionTemplate.selectOne("loginCheck", temp);
		if(dto != null) {
			if(dto.getPwd().equals(temp.getPwd())) {
				return dto;
			}
		}
		return null;
	}

}

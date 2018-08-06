package com.member.model.junoflow;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAOImple implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberDTO loginCheck(MemberDTO temp) {
		return sqlSessionTemplate.selectOne("loginCheck", temp);
	}

}

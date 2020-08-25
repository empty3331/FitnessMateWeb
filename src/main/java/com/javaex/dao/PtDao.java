package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PtVo;
import com.javaex.vo.UserVo;

@Repository
public class PtDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<PtVo> selectTraineeList(int trainerNo) {
		System.out.println("dao 트레이니 리스트");
		
		List<PtVo> ptList = sqlSession.selectList("pt.selectTraineeList", trainerNo);
		
		return ptList;
	}

	public PtVo selectPtInfo(Map<String, Integer> ptMap) {
		System.out.println("dao 트레이니 인포");
		
		PtVo ptVo = sqlSession.selectOne("pt.selectPtInfo", ptMap);
		
		return ptVo;
	}

	public UserVo selectUserInfo(String keyword) {
		System.out.println("dao 회원 검색");
		
		UserVo userVo = sqlSession.selectOne("pt.selectUserInfo", keyword);
		
		return userVo;
	}

	public void insertPt(Map<String, Integer> regMap) {
		System.out.println("dao pt 추가");
		
		sqlSession.insert("pt.insertPt", regMap);
	}

	public void updateMemo(Map<String, Object> memoMap) {
		System.out.println("dao 메모 수정");
		
		sqlSession.update("pt.updateMemo", memoMap);
	}
	
	
	
}

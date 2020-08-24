package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.AddressVo;
import com.javaex.vo.InterestVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public int idCheck(String id) {
		System.out.println("userService.idCheck");
		
		return userDao.selectSameId(id);
	}
	
	public UserVo signUp(UserVo vo) {
		System.out.println("userService.signUp");

		/*
		String saveDir = "C:\\javaStudy\\upload_file";
		String saveName = "";
		
		if(profileImg.getOriginalFilename() != "") {
			// 확장자
			String exName = profileImg.getOriginalFilename().substring(profileImg.getOriginalFilename().lastIndexOf("."));
			
			// 저장 파일 이름
			saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			
			// 파일 경로
			String filePath = saveDir + "\\" + saveName;
			
			// 파일을 서버에 복사
			try {
				byte[] fileData = profileImg.getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bout = new BufferedOutputStream(out);
				
				bout.write(fileData);
				bout.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// vo에 저장
		vo.setProfileImg(saveName);
		*/
		
		return userDao.insertUser(vo);
	}

	public List<String> getAddress() {
		System.out.println("userService.주소 대분류 가져오기");
		
		return userDao.selectAddress();
	}

	public List<String> getCityList(String thisProvince) {
		System.out.println("userService.도시가져오기");
		
		return userDao.selectCity(thisProvince);
	}

	public List<String> getRegionList(String thisCity) {
		System.out.println("userService.동네가져오기");
		
		return userDao.selectRegion(thisCity);
	}

	public List<InterestVo> getInterestList() {
		System.out.println("userService.관심분야가져오기");
		
		return userDao.selectInterestAll();
	}

	public void signUpTrainer(UserVo vo, AddressVo addressVo, List<Integer> fieldList, List<String> careerList, List<String> birthList) {
		System.out.println("userService.트레이너 회원가입");
		
		//주소 합치기
		String address = "";

		if(addressVo.getProvince().equals("") && addressVo.getCity().equals("") && addressVo.getRegion().equals("")) {
			address = " | | ";
		}else {
			address = addressVo.getProvince()+"|"+addressVo.getCity()+"|"+addressVo.getRegion();
		}
		
		vo.setLocation(address);
		
		//날짜 합치기
		String birthDate = "";
		
		if(birthList == null) {
			birthDate = "";
		}else {
			birthDate = birthList.get(0).substring(0, 2)+"/"+birthList.get(1)+"/"+birthList.get(2);
		}
		
		vo.setbirthDate(birthDate);
		
		userDao.updateTrainerInfo(vo);
		
		Map<String, Integer> interestMap = new HashMap<>();
		interestMap.put("userNo", vo.getUserNo());

		for(int fieldNo : fieldList) {
			interestMap.put("fieldNo", fieldNo);
			userDao.insertInterest(interestMap);
		}
		
		if(careerList != null) {
			Map<String, Object> careerMap = new HashMap<>();
			careerMap.put("userNo", vo.getUserNo());
			
			for(String career : careerList) {
				careerMap.put("career", career);
				userDao.insertCareer(careerMap);
			}
		}
		
	}

	public UserVo login(String userId, String userPw) {
		System.out.println("userService.로그인");
		
		UserVo userVo = new UserVo();
		userVo.setUserId(userId);
		userVo.setPassword(userPw);
		
		return userDao.selectUser(userVo);
	}

	public void deleteInterest(int userNo) {
		System.out.println("userService.전문분야 초기화");
		
		userDao.deleteInterest(userNo);
	}

	public void deleteCareer(int careerNo) {
		System.out.println("userService.커리어지우기");
		
		userDao.deleteCareer(careerNo);
	}
}
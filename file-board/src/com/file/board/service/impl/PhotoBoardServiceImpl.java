package com.file.board.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.dao.PhotoBoardDAO;
import com.file.board.service.PhotoBoardService;
import com.file.board.vo.PhotoBoardVO;

@Service
public class PhotoBoardServiceImpl implements PhotoBoardService {
	private final String uploadPath = "C:\\java_study\\workspace\\file-board\\WebContent\\resources\\";
	@Autowired
	PhotoBoardDAO photoBoardDAO;

	@Override
	public int insertPhotoBoard(MultipartFile file, PhotoBoardVO pb) {

		String orgFileName = file.getOriginalFilename();
		String extName = orgFileName.substring(orgFileName.lastIndexOf("."));
		String fileName = System.nanoTime() + extName;
		pb.setPbPhotoName(orgFileName);
		pb.setPbPhotoPath(fileName);
		int cnt = photoBoardDAO.insertPhotoBoard(file, pb);
		if (cnt == 1) {
			File f = new File(uploadPath + fileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public List<PhotoBoardVO> selectPhotoBoardList(PhotoBoardVO pb) {
		return photoBoardDAO.selectPhotoBoardList(pb);
	}

}

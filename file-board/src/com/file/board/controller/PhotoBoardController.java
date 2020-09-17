package com.file.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.service.PhotoBoardService;
import com.file.board.vo.PhotoBoardVO;

@Controller
public class PhotoBoardController {
	
	
	@Autowired
	private PhotoBoardService pbService;
	@RequestMapping(value="/photo/list",method=RequestMethod.GET)
	public String goList(Model model) {
		model.addAttribute("pbList",pbService.selectPhotoBoardList(null));
		return "photo/list";
	}
	
	@RequestMapping(value="/photo/write",method=RequestMethod.GET )
	public String goWrtie() {
		return "photo/write";
	}
	
	@RequestMapping(value="/photo/write",method=RequestMethod.POST)
	public String doWrtie(@RequestParam("pbFile") MultipartFile file, @ModelAttribute PhotoBoardVO pb) {
		System.out.println(file.getSize()/1024+"kb");
		pbService.insertPhotoBoard(file, pb);
		return "redirect:/photo/list";
	}
}

package com.file.board.controller;


import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.file.board.vo.PhotoBoardVO;

@Controller
public class HomeColtroller {
	@Autowired
	private SqlSessionFactory ssf;
	@Autowired
	private DataSource ds;
	PhotoBoardVO pb = new PhotoBoardVO();
	@RequestMapping("/") //localhost
	public String goHome(Model model) {
		System.out.println(ds);
		System.out.println(ssf);
		try {
			Connection con = ds.getConnection();
			System.out.println(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("msg","Hello~~");
		return "index";
	}
	public static void main(String[] args) {
		
	}
}

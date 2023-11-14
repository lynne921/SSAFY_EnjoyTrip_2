package com.ssafy.enjoytrip.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.MyException;
import com.ssafy.enjoytrip.board.model.dao.BoardDao;
import com.ssafy.enjoytrip.board.model.dto.BoardDto;
import com.ssafy.enjoytrip.util.PageBean;
import com.ssafy.enjoytrip.util.PageNavigation;
import com.ssafy.enjoytrip.util.PageUtility;
import com.ssafy.enjoytrip.util.SizeConstant;

@Service("BoardService")
@Repository
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	public BoardServiceImpl(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public void writeArticle(BoardDto boardDto) {
		try {
			boardDao.writeArticle(boardDto);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	}

	@Override
	public List<BoardDto> listArticle(PageBean bean) {

		System.out.println("BookService.searchAll 수행 중...............");
		try {
			int total = boardDao.totalCount(bean);
			PageUtility page = new PageUtility(bean.getInterval(), total, bean.getPageNo(), null);
			bean.setPageLink(page.getPageBar());
			return boardDao.listArticle(bean);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MyException("게시글 리스트 조회 중 오류 발생");
		}
	}

//	@Override
//	public PageNavigation makePageNavigation(Map<String, String> map) {
//		
//		try {
//			PageNavigation pageNavigation = new PageNavigation();
//
//			int naviSize = SizeConstant.NAVIGATION_SIZE;
//			int sizePerPage = SizeConstant.LIST_SIZE;
//			int currentPage = Integer.parseInt(map.get("pgno"));
//
//			pageNavigation.setCurrentPage(currentPage);
//			pageNavigation.setNaviSize(naviSize);
//			int totalCount = boardDao.getTotalArticleCount(map);
//			pageNavigation.setTotalCount(totalCount);
//			int totalPageCount = (totalCount - 1) / sizePerPage + 1;
//			pageNavigation.setTotalPageCount(totalPageCount);
//			boolean startRange = currentPage <= naviSize;
//			pageNavigation.setStartRange(startRange);
//			boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
//			pageNavigation.setEndRange(endRange);
//			pageNavigation.makeNavigator();
//
//			return pageNavigation;
//			
//		} catch (Exception e) {
//			throw new MyException("makePageNavigation 처리 중 오류 발생!!!");
//		}
//		
//	}

	@Override
	public BoardDto getArticle(int articleNo) {
		try {
			return boardDao.getArticle(articleNo);
		} catch (Exception e) {
			throw new MyException("getArticle 처리 중 오류 발생!!!");
		}
		
	}

	@Override
	public void updateHit(int articleNo) {
		
		try {
			boardDao.updateHit(articleNo);
		} catch (Exception e) {
			throw new MyException("updateHit 처리 중 오류 발생!!!");
		}
	}

	@Override
	public void modifyArticle(BoardDto boardDto) {
		
		try {
			boardDao.modifyArticle(boardDto);
		} catch (Exception e) {
			throw new MyException("modifyArticle 처리 중 오류 발생!!!");
		}
	}

	@Override
	public void deleteArticle(int articleNo) {
		
		try {
			boardDao.deleteArticle(articleNo);
		} catch (Exception e) {
			throw new MyException("deleteArticle 처리 중 오류 발생!!!");
		}
	}

}

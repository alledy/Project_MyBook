package mybook.my.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import model.InterestBookList;
import model.MyBookList;
import service.NaverBookService;
import vo.MemberVO;
import vo.PagingVO;

@Controller
@SessionAttributes("status")
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping(value = {"/readBook"}) 
	public ModelAndView  readBook(@RequestParam(required=false)String keyword, @ModelAttribute MyBookList model, String bookNum, String readkeyword,
			@SessionAttribute("status")MemberVO loginVO, @RequestParam(defaultValue="1")int curPage) {
		ModelAndView mav = new ModelAndView(); 
		String userId = loginVO.getUserId();
		if(readkeyword != null) {
			Map<String, String> map = new HashMap<String, String>();
	        map.put("readkeyword", readkeyword);
	        map.put("email", "qwe@gmail.com");

			mav.addObject("list", service.searchReadbook(map)); 
			mav.setViewName("readBook");
			return mav;	
		}
		
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api�? ?��?�� 찾�? 값을 list?��?��?���? 보내�??��.
		}else {
			model.setEmail(userId);
			
			if(bookNum != null) {
				//update
				if(model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
					model.setId(Integer.parseInt(bookNum));
					boolean result = service.update(model);
					if(result) {
						mav.addObject("msg", "mybooklist update ?���?");
					}
					else
						mav.addObject("msg", "mybooklist update ?��?��");
				}else {
					//delete
					boolean result = service.delete(Integer.parseInt(bookNum));
				} //insert				
			}else if(bookNum == null && model.getTitle()!=null && model.getTitle()!=null && 
				model.getPublisher()!=null && model.getImage()!=null 
				&& model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
				boolean result = service.insert(model);
				if(result) 
					mav.addObject("msg", "mybooklist insert ?���?");
				else
					mav.addObject("msg", "mybooklist insert ?��?��");
			}
		}
//		mav.addObject("list", service.listAll("qwe@gmail.com")); 
		
		// selectAll & paging
				int listCnt = service.getTotalCnt(userId);
				PagingVO pageList = new PagingVO(listCnt, curPage);
				model.setStart(pageList.getStartIndex());
				model.setLast(pageList.getEndIndex());
				List<MyBookList> list = service.listAll(model);
				mav.addObject("list", list); 
				
//				mav.addObject("listCnt", listCnt);
				mav.addObject("pagination", pageList);				
				mav.setViewName("readBook");
		return mav;
	}
	
	@RequestMapping(value = {"/interestBook"}) 
	public ModelAndView interestBook(@RequestParam(required=false)String keyword, InterestBookList model, String bookNum) {
		ModelAndView mav = new ModelAndView(); 
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api�? ?��?�� 찾�? 값을 list?��?��?���? 보내�??��.
		}else {
			model.setEmail("qwe@gmail.com");
			
			if(bookNum != null) {
				//delete
				boolean result = service.deleteInterestBook(Integer.parseInt(bookNum));
			}else if(model.getTitle()!=null && model.getTitle()!=null && 
					model.getPublisher()!=null && model.getDescription()!=null & model.getImage()!=null) {
				boolean result = service.insertInterestBook(model);
				if(result) 
					mav.addObject("msg", "InterestBookList insert ?���?");
				else
					mav.addObject("msg", "InterestBookList insert ?��?��");
			}
		}
		mav.addObject("list", service.listAllInterestBook("qwe@gmail.com")); 
		mav.setViewName("interestBook");
		return mav;
	}
	
	@RequestMapping(value = {"/detailInterestBook"}) 
	public ModelAndView detailInterestBook(String bookNum, String bookTitle) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookTitle", bookTitle);
		mav.addObject("list", service.selectDetailInterestBook(Integer.parseInt(bookNum))); 
		mav.setViewName("detailInterestBook");
		return mav;
	}
	
}


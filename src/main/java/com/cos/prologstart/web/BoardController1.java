package com.cos.prologstart.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.prologstart.service.BoardService1;
import com.cos.prologstart.vo.BoardVO;
import com.cos.prologstart.vo.ReplyVO;



@Controller
public class BoardController1 {
	
	@Autowired
	private BoardService1 bs;
			

	@GetMapping("/admin_index")
		public String index() {
			return "admin/admin_index";
		}

	 
		@GetMapping("adminMain")
		public String adminMain() {
			return "admin/admin_index";
	}
		 

	@GetMapping("/board")
	public String board2() {
		
		return "board/mainBoard";
	}
	
	
	@GetMapping("/write")
	public String write() {
		return "write"; 
	}
	
	
	@GetMapping("/adminWrite") //공지사항(notice)도 작성할 수 있도록 한 글쓰기 화면
	public String adminWrite() {
		return "admin/adminWrite";
	}
	
	@GetMapping("/getSearchList")
	private String getSearchList(@RequestParam("type")String type,
								 @RequestParam("keyword")String keyword,
								 Model model1)throws Exception {
		
		 if(type.equals("") || keyword.equals("")) { return "board/mainBoard"; }
		
		model1.addAttribute("menu",bs.getSearchList(type,keyword));
		
		return "board/search";
	}
	
	
	@GetMapping("board/profileList")
	public String profileList( Model model1) {
		
		model1.addAttribute("menu", bs.getAllUser());
		
		return "/board/profileList";
	}
	
	@GetMapping("/getPopularList")
	private String getPopularList(Model model1)throws Exception {
		
		model1.addAttribute("menu",bs.getPopularList());
		
		return "board/popular";
	}

	
	@GetMapping("/detailView") //게시글 상세보기를 누르면 보이는 화면
	public String detailView(
			HttpServletRequest req, HttpSession session,
			 		   @RequestParam("num")int num,
					   @RequestParam("title")String title,
					   @RequestParam("image")String image,
					   @RequestParam("lang")String lang,
					   @RequestParam("writer")String writer,
					   @RequestParam("date1")String date1,
					   @RequestParam("hit")int hit,
					   @RequestParam("user_num")int user_num,
					   Model model1) throws Exception{
		
		 String contents = req.getParameter("contents"); 
		 contents = contents.replace("<br>", "\r\n");
		
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("date1", date1);
		model1.addAttribute("writer", writer);
		model1.addAttribute("user_num", user_num);
		model1.addAttribute("hit", bs.hitCount(num));
		
		
		String user_id =req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		List<ReplyVO> reList = bs.readReply(num);//댓글이 보이도록
		model1.addAttribute("reList", reList);//List로 넘김
		
		return "detailView"; 
	}
	
	
	@GetMapping("/view") // /view는 수정기능 X 화면
	public String view(
					   @RequestParam("num")int num,
					   @RequestParam("title")String title,
					   @RequestParam("image")String image,
					   @RequestParam("lang")String lang,
					   @RequestParam("writer")String writer,
					   @RequestParam("contents")String contents,Model model1) throws Exception {
		model1.addAttribute("num", num);
		model1.addAttribute("title", title);
		model1.addAttribute("image", image);
		model1.addAttribute("lang", lang);
		model1.addAttribute("contents", contents);
		model1.addAttribute("writer", writer);
		
		List<ReplyVO> reList = bs.readReply(num);
		model1.addAttribute("reList", reList);
		
		return "view"; 
	}
	
	@PostMapping("/writeAfter") //게시판에서 글쓰고 '발행'누르면 여기로 온다.
	public String writeAction(
			HttpServletRequest req,
			HttpSession session,
			@RequestParam("file") MultipartFile file,
			@RequestParam("lang") String lang,
			@RequestParam("title")String title,
			@RequestParam("user_num")int user_num,
				Model model1) throws IllegalStateException, IOException {

		
		 String contents = req.getParameter("contents"); 
		 contents = contents.replace("\r\n", "<br>");
		
		
		String user_id=req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
	
		String path = "C:/workspace/springbootwork/upload/"; //이미지가 저장될 외부 경로 지정
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path + file.getOriginalFilename()));
			}
		
		bs.addBoard(new BoardVO(user_id,user_num,0,lang, title, contents, file.getOriginalFilename())); //게시글 insert됨
		return "board/mainBoard";
	}
	
	 @GetMapping("/boardList")
	 @ResponseBody public List<BoardVO> boardList(){ 
		  	return bs.getAllBoard(); //전체 게시판 모두 조회 
	}
	 
	 @GetMapping("/userList")//관리자 화면에서 회원강제탈퇴를 누르면
	 public String userList(Model model1) {
		 model1.addAttribute("getAllUser", bs.getAllUser()); //전체 회원정보를 보여줌
		 return "admin/userList";
	 }
	 
	 @GetMapping("/myReplyList") //내가 쓴 댓글 전체보기
	 public String myReplyList(Model model1,
			 					@RequestParam("user_id")String user_id) throws Exception {
		 model1.addAttribute("myReplyList", bs.myReplyList(user_id)); //전체 회원정보를 보여줌
		 return "replyList";
	 }
	
	 
	 @GetMapping("/deleteMember")//회원강제탈퇴
		public String deleteMember(
								@RequestParam("username")String username,
								Model model1) throws Exception {
	
			 bs.deleteMember(username);

				return "redirect:/userList"; //회원 전체 보여주는 userList 컨트롤러로 이동
			
		}
		

	@GetMapping("/java") //java 게시판
	public String java(@RequestParam("lang")String lang,
						HttpServletRequest req, 
						HttpSession session,
						Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
			model1.addAttribute("menu", bs.getMenu(lang)); //lang이 java인 모든 게시글을 조회
		
		return "board/java";

	}
	@GetMapping("/javascript")//
	public String script(@RequestParam("lang")String lang,
						HttpServletRequest req, 
						HttpSession session,
						Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/javascript";

	}
	@GetMapping("/spring")//
	public String spring(@RequestParam("lang")String lang,
						 HttpServletRequest req, 
						 HttpSession session,
						 Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		return "board/spring";

	}
	@GetMapping("/html")//
	public String html(@RequestParam("lang")String lang,
					   HttpServletRequest req, 
					   HttpSession session,
					   Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/html";

	}
	
	
	@GetMapping("/notice")
	public String notice(@RequestParam("lang")String lang,
					   HttpServletRequest req, 
					   HttpSession session,
					   Model model1) {
	
		String user_id = req.getParameter("user_id");
		session.setAttribute("user_id", user_id);
		
		model1.addAttribute("menu", bs.getMenu(lang));
		
		return "board/notice";

	}
	
	
	  @GetMapping("/updateForm") //게시글 수정버튼을 누르면
	  public String updateForm( @RequestParam("num")int num,
			  					@RequestParam("title")String title,
			  					@RequestParam("image")String image,
			  					@RequestParam("lang")String lang,
			  					@RequestParam("writer")String writer,
			  					@RequestParam("contents")String contents,
			  					@RequestParam("date1")String date1,
			  					Model model1) {
		  
		  
		  
		  model1.addAttribute("num", num);
		  model1.addAttribute("title", title);
		  model1.addAttribute("image", image);
		  model1.addAttribute("lang", lang);
		  model1.addAttribute("writer", writer);
		  model1.addAttribute("contents", contents);
		  model1.addAttribute("date1", date1);
		  
		  return "updateView"; //게시글 수정화면
		
	  }
	  
	  
	  @GetMapping("/updateclear")//수정완료가 되면
	  public String updateclear( 
			  					@RequestParam("num")int num,
			  					@RequestParam("title")String title,
			  					@RequestParam("image")String image,
								@RequestParam("lang")String lang,
								@RequestParam("writer")String writer,
								/*@RequestParam("contents")String contents*/
								HttpServletRequest req,
								Model model1) throws Exception {
		 
		  model1.addAttribute("num", num);
		  model1.addAttribute("title", title);
		  model1.addAttribute("lang", lang);
		  model1.addAttribute("image", image);
		  model1.addAttribute("writer", writer);
		 
		  String contents = req.getParameter("contents"); 
		contents = contents.replace("\r\n", "<br>");
		
		bs.updateclear(num,lang,title,image,contents);
		
		model1.addAttribute("menu", bs.getBoardOne(num));
		
		  contents = contents.replace("<br>", "\r\n");
		
		 model1.addAttribute("contents", contents);
		  
		  List<ReplyVO> reList = bs.readReply(num);
		  model1.addAttribute("reList", reList);
			
		  return "view"; //이 화면에서 수정된 화면을 바로 보여줌
	  }
	  
	  
	  @GetMapping("/delete")//게시글 삭제
	  public String delete(@RequestParam("num")int num) throws Exception {
		  bs.deleteBoard(num); //글번호로 게시글 삭제
		  bs.deleteAllReply(num); //삭제한 게시글에 있는 댓글도 삭제
		  return "board/mainBoard";
	  }
	  
	  
		@GetMapping("/writeReply") //댓글 작성
		public String replyWrite(
								@RequestParam("num")int num,
								@RequestParam("writer")String writer,
								@RequestParam("content")String content,
								Model model1) throws Exception {
	
				bs.writeReply(num,writer,content); //댓글번호, 작성자, 댓글내용 insert
				
				return "board/mainBoard";
		}
		
		@GetMapping("/deleteReply")//댓글 삭제
		public String deleteReply(
								@RequestParam("reply_num")int reply_num,
								Model model1) throws Exception {
	
				bs.deleteReply(reply_num);//해당 댓글 번호를 가져와서 댓글 삭제
		
				return "board/mainBoard";
			
		}
		
		@GetMapping("/updateReply")//댓글 수정
		public String updateReply(
								@RequestParam("reply_num")int reply_num,
								@RequestParam("content")String content,
								Model model1) throws Exception {
	
				bs.updateReply(reply_num, content); //댓글 내용 수정
			
				return "board/mainBoard";
			
		}
		
		

}

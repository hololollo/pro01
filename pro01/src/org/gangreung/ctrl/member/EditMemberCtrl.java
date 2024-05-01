package org.gangreung.ctrl.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gangreung.dao.MemberDAO;
import org.gangreung.dto.Member;
import org.gangreung.util.AES256;


@WebServlet("/EditMember.do")
public class EditMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EditMemberCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String key = "%02x";
		
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		Member mem = dao.getMember(id);
		
		//비밀번호 복호화
		try {
			mem.setPw(AES256.decryptAES256(mem.getPw(), key));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("mem", mem);
		RequestDispatcher view = request.getRequestDispatcher("/member/memberInfo.jsp");
		view.forward(request, response);		
		
	}

}

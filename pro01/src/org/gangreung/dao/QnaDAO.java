package org.gangreung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.gangreung.dto.Member;
import org.gangreung.dto.Notice;
import org.gangreung.dto.Qna;

public class QnaDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// select 실행시 목록보기(요청)
	public List<Qna> getLatestList(){
		List<Qna> memList = new ArrayList<>();
		OracleDB oracle = new OracleDB();
		
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(OracleDB.LATEST_QNA);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Qna q = new Qna(rs.getInt("no"),
							rs.getInt(""),
							rs.getInt(""),
							rs.getString(""),
							rs.getString(""));
							rs.getString(""));
							rs.getInt(""));
							rs.getString(""));
							
					memList.add(mem);
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return memList;
}
	public Qna getQna(int no) {
		Notice noti = new Notice();
		OracleDB oracle = new OracleDB();
	
	try {
		con = oracle.connect();
		pstmt = con.prepareStatement(SqlLang.VISITED_UPD_NOTICE);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		pstmt = null;
		pstmt = con.prepareStatement(SqlLang.SELECT_NOTICE_BYNO);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			noti.setNo(rs.getInt("no"));
			noti.setTitle(rs.getString("title"));
			noti.setContent(rs.getString("content"));
			noti.setResdate(rs.getString("resdate"));
			noti.setVisited(rs.getInt("visited"));
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		oracle.close(con, pstmt, rs);
	}
	return noti;
}

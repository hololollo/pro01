package org.gangreung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.gangreung.dto.Notice;

public class NoticeDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<Notice> getNoticeList(){
		List<Notice> notiList = new ArrayList<>();
		
		OracleDB oracle = new OracleDB();
		try {
			con = oracle.connect();
			try {
				pstmt = con.prepareStatement(SqlLang.SELECT_ALL_NOTICE);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Notice noti = new Notice(rs.getString("no"),
							rs.getString("title"),
							rs.getString("content"),
							rs.getString("resdate"),
							rs.getInt("visited"));
					notiList.add(noti);
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return notiList;
	}
	//누르면 전달
	public Notice getNotice(int no) {
		Notice noti = new Notice();
		OracleDB oracle = new OracleDB();
		
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_NOTICE_BYNO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noti.setNo(rs.getString("no"));
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
	public int insNotice(Notice noti) {
		int cnt = 0;
		OracleDB oracle = new OracleDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.INS_NOTICE);
			pstmt.setString(1, noti.getTitle());
			pstmt.setString(2, noti.getContent());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
	
	public int editNotice(Notice noti) {
		int cnt = 0;
		OracleDB oracle = new OracleDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.UPD_NOTICE);
			pstmt.setString(1, noti.getTitle());
			pstmt.setString(2, noti.getContent());
			pstmt.setString(3, noti.getNo());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
	
	public int delNotice(int no){
		int cnt = 0;
		OracleDB oracle = new OracleDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.DEL_NOTICE);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
}
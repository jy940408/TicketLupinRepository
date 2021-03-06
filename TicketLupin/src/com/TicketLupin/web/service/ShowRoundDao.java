package com.TicketLupin.web.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.TicketLupin.web.DBconn.DBconn;

public class ShowRoundDao {

	public ShowRoundVo insertShowRound(ShowRoundVo srv) {
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		ShowRoundVo result = null;
		String sql = "INSERT INTO SHOWROUND(SIDX, SRDATE, SRROUND1, SRROUND2, SRROUND3, SRROUND4) "
				+ "VALUES(?, ?, ?, ?, ?, ?)";

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, srv.getSidx());
			pstmt.setString(2, srv.getSrdate());
			pstmt.setString(3, srv.getSrround1());
			pstmt.setString(4, srv.getSrround2());
			pstmt.setString(5, srv.getSrround3());
			pstmt.setString(6, srv.getSrround4());
			int update = pstmt.executeUpdate();
			System.out.println("ShowRoundDao 들어오는 것 확인");
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<ShowRoundVo> getShowRoundList(int idx) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ShowRoundVo> result = new ArrayList<>();
		String sql = "SELECT SRIDX, SIDX, SRDATE, SRROUND1, SRROUND2, SRROUND3, SRROUND4 "
				+ "FROM SHOWROUND WHERE SIDX = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int sridx = rs.getInt("SRIDX");
				int sidx = rs.getInt("SIDX");
				String srdate = rs.getString("SRDATE");
				String srround1 = rs.getString("SRROUND1");
				String srround2 = rs.getString("SRROUND2");
				String srround3 = rs.getString("SRROUND3");
				String srround4 = rs.getString("SRROUND4");
				
				ShowRoundVo srv = new ShowRoundVo(sridx, sidx, srdate, srround1, srround2, srround3, srround4);
				
				result.add(srv);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public ShowRoundVo getShowRoundDetail(int idx, String date){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ShowRoundVo srv = null;
		String sql = "SELECT SRIDX, SIDX, SRDATE, SRROUND1, SRROUND2, SRROUND3, SRROUND4 "
				+ "FROM SHOWROUND WHERE SRDATE = '" + date + "' AND SIDX = ?";

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			
			int sridx = rs.getInt("SRIDX");
			int sidx = rs.getInt("SIDX");
			String srdate = rs.getString("SRDATE");
			String srround1 = rs.getString("SRROUND1");
			String srround2 = rs.getString("SRROUND2");
			String srround3 = rs.getString("SRROUND3");
			String srround4 = rs.getString("SRROUND4");
			
			srv = new ShowRoundVo(sridx, sidx, srdate, srround1, srround2, srround3, srround4);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return srv;	
	}
	
	public int deleteShowRound(int sidx) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = "DELETE FROM SHOWROUND WHERE SIDX = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sidx);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
		
}

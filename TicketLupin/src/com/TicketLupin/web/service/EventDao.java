package com.TicketLupin.web.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.TicketLupin.web.DBconn.DBconn;
import com.TicketLupin.web.service.NewsVo;
public class EventDao {

	private	Connection conn;
	private PreparedStatement pstmt;
	
	public EventDao() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	public List<NewsVo> getNewsList(String query, String setting, int page){
		
		List<NewsVo> list = new ArrayList<NewsVo>();
		
		String sql = "SELECT * FROM (SELECT ROWNUM NUM, W.* FROM (SELECT * FROM NEWS WHERE WTITLE LIKE ? AND WPUB = 'Y' AND WDELYN = 'N' ORDER BY " + setting + " DESC) W) WHERE NUM BETWEEN ? AND ?";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setInt(2, 1+(page-1)*10);
			pstmt.setInt(3, page*10);
			
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				
				int widx = rs.getInt("WIDX");
				String wtitle = rs.getString("WTITLE");
				String wbasicinfo = rs.getString("WBASICINFO");
				String wintroduce = rs.getString("WINTRODUCE");
				String wdiscount = rs.getString("WDISCOUNT");
				String wcompany = rs.getString("WCOMPANY");
				String wcategory = rs.getString("WCATEGORY");
				int midx = rs.getInt("MIDX");
				Date wregdate = rs.getDate("WREGDATE");
				int whit = rs.getInt("WHIT");
				String wimage = rs.getString("WIMAGE");
				String wfiles = rs.getString("WFILES");
				String wpub = rs.getString("WPUB");
				int wgood = rs.getInt("WGOOD");
				String wdelyn = rs.getString("WDELYN");
				String wtitleposter = rs.getString("WTITLEPOSTER");
				Date wopendate = rs.getDate("WOPENDATE");
				
				NewsVo nv = new NewsVo(widx, wtitle, wbasicinfo, wintroduce, wdiscount, wcompany, wcategory, midx, wregdate, whit, wimage, wfiles, wpub, wgood, wdelyn, wtitleposter, wopendate);
				
				list.add(nv);
			}
		
			
		}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return list;
	}		
	
	public int getNewsListCount(String query, String setting){
		
		int count = 0;
		
		String sql = "SELECT COUNT(WIDX) COUNT FROM (SELECT ROWNUM NUM, W.* FROM (SELECT * FROM NEWS WHERE WTITLE LIKE ? ORDER BY ? DESC) W)";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, setting);
			
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				
				count = rs.getInt("COUNT");
							
			}
		
		}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return count;
	}
	
	public NewsVo getNewsDetail(int idx){
		
		NewsVo newsvo = new NewsVo();
		
		String sql = "SELECT * FROM NEWS WHERE WIDX = ?";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			int widx = rs.getInt("WIDX");
			String wtitle = rs.getString("WTITLE");
			String wbasicinfo = rs.getString("WBASICINFO");
			String wintroduce = rs.getString("WINTRODUCE");
			String wdiscount = rs.getString("WDISCOUNT");
			String wcompany = rs.getString("WCOMPANY");
			String wcategory = rs.getString("WCATEGORY");
			int midx = rs.getInt("MIDX");
			Date wregdate = rs.getDate("WREGDATE");
			int whit = rs.getInt("WHIT");
			String wimage = rs.getString("WIMAGE");
			String wfiles = rs.getString("WFILES");
			String wpub = rs.getString("WPUB");
			int wgood = rs.getInt("WGOOD");
			String wdelyn = rs.getString("WDELYN");
			String wtitleposter = rs.getString("WTITLEPOSTER");
			Date wopendate = rs.getDate("WOPENDATE");
			
			newsvo = new NewsVo(widx, wtitle, wbasicinfo, wintroduce, wdiscount, wcompany, wcategory, midx, wregdate, whit, wimage, wfiles, wpub, wgood, wdelyn, wtitleposter, wopendate);
		
		}catch (SQLException e) {
				e.printStackTrace();
		}
		System.out.println("dao: " + newsvo);
		return newsvo;
	}		
	
	public int insetEvent(EventVo ev) {
		int result = 0;
		//인덱스,타이틀,콘텐츠,회원인덱스, 작성일, 조회수, 이미지, 파일, 공개,좋아요, 삭제, 이벤트 시작날짜, 이벤트 끝 날
		String sql = "INSERT INTO EVENT VALUES(EVENT_SEQUENCE.NEXTVAL, ?, ?, ?, sysdate, 1, ?, '123', ?, 1, 'N', ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ev.getEtitle());
			pstmt.setString(2, ev.getEcontent());
			pstmt.setInt(3, ev.getMidx());
			pstmt.setString(4, ev.getEimage());
			pstmt.setString(5, ev.getEpub());
			pstmt.setDate(6, ev.getEopendate());
			pstmt.setDate(7, ev.getEenddate());
			
			ResultSet rs = pstmt.executeQuery();
			System.out.println(ev.getEtitle());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteNews(int idx) {
		int result = 0;
		
		String sql = "UPDATE NEWS SET WDELYN = 'Y' WHERE WIDX = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			ResultSet rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	public int modifyNews(NewsVo nv) {
		int result = 0;
		//�ε���, Ÿ��Ʋ, �⺻ ����, ����ε���, ��ϳ�¥, ��ȸ��, �̹���, ÷������, ��������, ���ƿ� ��, ��������, ���³�¥, Ÿ��Ʋ������, �����Ұ�, ��������, ������ ����, ī�װ�
		String sql = "UPDATE NEWS SET WTITLE = ?, WBASICINFO = ?, WTITLEPOSTER = ?, WPUB = ?, WOPENDATE = ?, WINTRODUCE = ?, WDISCOUNT = ?, WCOMPANY = ? WHERE WIDX = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nv.getWtitle());
			pstmt.setString(2, nv.getWbasicinfo());
			pstmt.setString(3, nv.getWtitleposter());
			pstmt.setString(4, nv.getWpub());
			pstmt.setDate(5, nv.getWopendate());
			pstmt.setString(6, nv.getWintroduce());
			pstmt.setString(7, nv.getWdiscount());
			pstmt.setString(8, nv.getWcompany());
			pstmt.setInt(9, nv.getWidx());
			
			ResultSet rs = pstmt.executeQuery();
			System.out.println(nv.getWtitle());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public int countNewsView(int widx) {
		int result = 0;
		NewsVo nv = new NewsVo();
		
		String sql = "UPDATE NEWS SET WHIT = WHIT + 1 WHERE WIDX = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, widx);
			
			ResultSet rs = pstmt.executeQuery();
			System.out.println(nv.getWhit());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
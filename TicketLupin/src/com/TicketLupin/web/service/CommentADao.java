package com.TicketLupin.web.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.TicketLupin.web.DBconn.DBconn;

public class CommentADao {
	
	public List<CommentAVo> getCommentAList(String setting,String query,int page,String order, String delyn ){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CommentAVo> clist = new ArrayList<CommentAVo>();
		String sql ="select * from(select @ROWNUM := @ROWNUM + 1 AS ROWNUM, AA.* FROM (select @ROWNUM := @ROWNUM + 1 AS no, a.* from "+
					"(select count(distinct bb.cridx) as rcnt, aa.* from(select a.*, b.mname, b.mid,c.stitle,d.etitle from c_comment a "+
					"left join member b on a.midx=b.midx left join show1 c on a.sidx=c.sidx left join event d  on a.eidx=d.eidx "+
					"where a.c_delyn = ? and "+setting+" like ?)aa left join (SELECT * FROM C_REPORT WHERE CRDELYN='N')bb  on aa.c_idx = bb. c_idx group by aa.c_idx, aa.origin_c_idx, aa.sidx, "+
					"aa.eidx, aa. midx,aa.c_content, aa.c_regdate, aa.c_delyn, aa.c_depth, aa.c_sort,aa.mname, aa.mid, aa.stitle,aa.etitle )a, "+
					"(SELECT @ROWNUM := 0) B ORDER BY ? ASC)AA,(SELECT @ROWNUM := 0) BB ORDER BY no DESC)a limit ?,10";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, delyn);
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, "order");
			pstmt.setInt(4, (page-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CommentAVo cav = new CommentAVo();
				
				cav.setC_idx(rs.getInt("c_idx"));
				cav.setOrigin_c_idx(rs.getInt("origin_c_idx"));
				cav.setSidx(rs.getInt("sidx"));
				cav.setEidx(rs.getInt("eidx"));
				cav.setMidx(rs.getInt("midx"));
				cav.setC_content(rs.getString("c_content"));
				cav.setC_regdate(rs.getDate("c_regdate"));
				cav.setC_delyn(rs.getString("c_delyn"));
				cav.setC_depth(rs.getInt("c_depth"));
				cav.setC_sort(rs.getString("c_sort"));
				cav.setMname(rs.getString("mname"));
				cav.setMid(rs.getString("mid"));
				cav.setStitle(rs.getString("stitle"));
				cav.setEtitle(rs.getString("etitle"));
				cav.setNo(rs.getInt("no"));
				cav.setRcnt(rs.getInt("rcnt"));
			
				
				clist.add(cav);
				}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return clist;				
		
	}
	
	
	public int getCommentListCount(int page, String setting, String query,String delyn){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql = "select count(a.c_idx) as count from c_comment a left join member b on a.midx=b.midx left join show1 c on a.sidx=c.sidx "+
					" left join event d  on a.eidx=d.eidx where a.c_delyn = ? and "+setting+" like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, delyn);
			pstmt.setString(2, "%"+query+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				count = rs.getInt("count");
				
			}
		
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch (SQLException e) {
				e.printStackTrace();
		}
		return	count;
	}

	public int deleteComment(String delyn,int c_idx) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int value= 0;
		String sql ="update c_comment set c_delyn = ? where c_idx = ? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, delyn);
			pstmt.setInt(2, c_idx);
			value = pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
			/* conn.commit(); */
		}catch(Exception e) {
			e.printStackTrace();
		
		}

		return value;
	}
	
	public int deleteCommentall(String keyword) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int value= 0;
		String sql = "update  C_comment set c_delyn = 'Y'   where c_content like ?" ;   
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			value = pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
			/* conn.commit(); */
		}catch(Exception e) {
			e.printStackTrace();
		
		}

		return value;
	}
		
	public int insertReport(int midx,int c_idx,String sort,String etcval) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int value = 0;
		String sql ="INSERT INTO C_REPORT(MIDX,C_IDX,CRSORT,CRCONTENT,CRREGDATE,CRDELYN) VALUES(?,?,?,?,now(),'N')";
		try {
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setInt(2, c_idx);
			pstmt.setString(3,sort);
			pstmt.setString(4,etcval);
			value = pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
			/* conn.commit(); */
		}catch(Exception e) {
			e.printStackTrace();
		
		}
		return value;
	}
	public CommentAVo getCommentView(int c_idx){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CommentAVo value = new CommentAVo();
		
		String sql = "select distinct a.c_idx, concat(IFNULL(stitle ,''), IFNULL(etitle ,'')) as title,c.sidx,d.eidx,b.mid,a.c_regdate,a.c_content,b.mname,b.midx " + 
					"from c_comment a LEFT JOIN member b ON a.midx = b.midx LEFT JOIN show1 c ON a.sidx=c.sidx LEFT JOIN event d ON a.eidx= d.eidx where a.c_idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			value.setMid(rs.getString("mid"));
			value.setMname(rs.getString("mname"));
			value.setTitle(rs.getString("title"));
			value.setC_regdate(rs.getDate("c_regdate"));
			value.setSidx(rs.getInt("sidx"));
			value.setEidx(rs.getInt("eidx"));
			value.setMidx(rs.getInt("midx"));
			value.setC_content(rs.getString("c_content"));
			rs.close();
			pstmt.close();
			conn.close();
		
		}catch (SQLException e) {
				e.printStackTrace();
		}
		return	value;
	}
	public List<CommentAVo> getReportList(int c_idx,int page ){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CommentAVo> rlist = new ArrayList<CommentAVo>();
		String sql = 	"select * from(select @ROWNUM := @ROWNUM + 1 AS NO, AA.* FROM (select @ROWNUM := @ROWNUM + 1 AS NUM, b. mid, a.* "+
						"from c_report a, member b ,(SELECT @ROWNUM := 0)C where a.midx = b.midx and c_idx = ? and crdelyn='N' order by a.cridx)AA,"+
						"(SELECT @ROWNUM := 0) BB ORDER BY NO DESC)a limit ?,10";      
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			pstmt.setInt(2, (page-1)*10);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CommentAVo cav = new CommentAVo();
				
				cav.setCridx(rs.getInt("cridx"));
				cav.setMid(rs.getString("mid"));
				cav.setMidx(rs.getInt("midx"));
				cav.setCrsort(rs.getString("crsort"));
				cav.setCrregdate(rs.getDate("crregdate"));
				cav.setCrcontent(rs.getString("crcontent"));
				cav.setNo(rs.getInt("no"));
				
				rlist.add(cav);
				}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rlist;				
		
	}
	public int getReportListCount(int c_idx){
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql =" select count(*) as count from c_report where c_idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				count = rs.getInt("count");
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		
		}catch (SQLException e) {
				e.printStackTrace();
		}
		return	count;
	}
	public int deleteCheckComment(String check) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int value= 0;
		String sql ="update c_comment set c_delyn='Y' where c_idx in("+check+")";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			value = pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
			/* conn.commit(); */
		}catch(Exception e) {
			e.printStackTrace();
		
		}

		return value;
	}
	public int deleteCheckReport(String check) {
		
		DBconn dbconn = new DBconn();
		Connection conn = dbconn.getConnection();
		PreparedStatement pstmt = null;
		
		int value= 0;
		String sql ="update c_report set crdelyn='Y' where cridx in("+check+")";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			value = pstmt.executeUpdate();	
			
			pstmt.close();
			conn.close();
			
			/* conn.commit(); */
		}catch(Exception e) {
			e.printStackTrace();
		
		}

		return value;
	}
		

}

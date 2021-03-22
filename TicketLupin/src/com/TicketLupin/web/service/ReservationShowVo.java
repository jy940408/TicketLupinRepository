package com.TicketLupin.web.service;

import java.util.Date;

public class ReservationShowVo extends ReservationVo{

	private String stitle;
	private int num;
	
	public ReservationShowVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	

	public ReservationShowVo(String stitle, int num) {
		super();
		this.stitle = stitle;
		this.num = num;
	}

	public ReservationShowVo(String stitle, int ridx, int sidx, int midx, String rseat, int rprice, String rdiscount, String srdate,
			String srround, Date rregdate, int num) {
		super(ridx, sidx, midx, rseat, rprice, rdiscount, srdate, srround, rregdate);

		this.stitle = stitle;
		this.num = num;
	}

	
	
}
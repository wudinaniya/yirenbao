package com.qx.pojo;

import java.util.Date;

/**
 * 用户类
 * @author dell
 *
 */
public class User {
	private Integer uid;
	private String unickname;
	private String upassword;
	private String uphonenumber;
	private String ureferrer;
	private Date uregistdate;
	private String uheadimg;
	private String ulastip;
	private Date ulasttime;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUnickname() {
		return unickname;
	}
	public void setUnickname(String unickname) {
		this.unickname = unickname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUphonenumber() {
		return uphonenumber;
	}
	public void setUphonenumber(String uphonenumber) {
		this.uphonenumber = uphonenumber;
	}
	public String getUreferrer() {
		return ureferrer;
	}
	public void setUreferrer(String ureferrer) {
		this.ureferrer = ureferrer;
	}
	public Date getUregistdate() {
		return uregistdate;
	}
	public void setUregistdate(Date uregistdate) {
		this.uregistdate = uregistdate;
	}
	public String getUheadimg() {
		return uheadimg;
	}
	public void setUheadimg(String uheadimg) {
		this.uheadimg = uheadimg;
	}
	public String getUlastip() {
		return ulastip;
	}
	public void setUlastip(String ulastip) {
		this.ulastip = ulastip;
	}
	public Date getUlasttime() {
		return ulasttime;
	}
	public void setUlasttime(Date ulasttime) {
		this.ulasttime = ulasttime;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", unickname=" + unickname + ", upassword=" + upassword + ", uphonenumber="
				+ uphonenumber + ", ureferrer=" + ureferrer + ", uregistdate=" + uregistdate + ", uheadimg=" + uheadimg
				+ ", ulastip=" + ulastip + ", ulasttime=" + ulasttime + "]";
	}
	
}

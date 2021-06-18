package orderPackege;

import java.sql.Date;

public class OrderDTO {
	private int orderid;
	private String memberid;
	private int productid;
	private String filename;
	private int quantity;
	private int price;
	private Date date;
	


	public OrderDTO() {
		
	}



	public OrderDTO(int orderid, String memberid, int productid, String filename, int quantity, Date date, int price) {
		super();
		this.orderid = orderid;
		this.memberid = memberid;
		this.productid = productid;
		this.filename = filename;
		this.quantity = quantity;
		this.price = price;
		this.date = date;
	}



	public int getOrderid() {
		return orderid;
	}



	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}



	public String getMemberid() {
		return memberid;
	}



	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}



	public int getProductid() {
		return productid;
	}



	public void setProductid(int productid) {
		this.productid = productid;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}

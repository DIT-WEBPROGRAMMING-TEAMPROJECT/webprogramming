package orderPackege;

public class OrderListDTO {
	private String regtime;
	private String thumbnailLink;
	private String productName;
	private int price;
	private int quantity;
	
	public OrderListDTO() {}
	public OrderListDTO(String regtime, String thumbnailLink, String productName, int price, int quantity) {
		super();
		this.regtime = regtime;
		this.thumbnailLink = thumbnailLink;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
	}
	
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public String getThumbnailLink() {
		return thumbnailLink;
	}
	public void setThumbnailLink(String thumbnailLink) {
		this.thumbnailLink = thumbnailLink;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}

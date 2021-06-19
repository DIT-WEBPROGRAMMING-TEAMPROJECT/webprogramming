package basketPackege;

public class BasketDTO {
	private String name;
	private String thumbnailLink;
	private int price;
	private int count;
	private int productId;
	
	public BasketDTO() {};
	public BasketDTO(String name, String thumbnailLink, int price, int count) {
		super();
		this.name = name;
		this.thumbnailLink = thumbnailLink;
		this.price = price;
		this.count = count;
	}
	public BasketDTO(String name, String thumbnailLink, int price, int count, int productId) {
		super();
		this.name = name;
		this.thumbnailLink = thumbnailLink;
		this.price = price;
		this.count = count;
		this.productId = productId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getThumbnailLink() {
		return thumbnailLink;
	}
	public void setThumbnailLink(String thumbnailLink) {
		this.thumbnailLink = thumbnailLink;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
}

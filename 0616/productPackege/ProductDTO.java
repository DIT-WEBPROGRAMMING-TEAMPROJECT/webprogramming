package productPackege;

public class ProductDTO {
	private int productId;
	private int productCode;
	private String name;
	private String detailedLink;
	private String thumbnailLink;
	private int price;
	private int stock;
	
	public ProductDTO() {}
	public ProductDTO(int productId, int productCode, String name, String detailedLink,
			String thumbnailLink, int price, int stock) {
		super();
		this.productId = productId;
		this.productCode = productCode;
		this.name = name;
		this.detailedLink = detailedLink;
		this.thumbnailLink = thumbnailLink;
		this.price = price;
		this.stock = stock;
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetailedLink() {
		return detailedLink;
	}
	public void setDetailedLink(String detailedLink) {
		this.detailedLink = detailedLink;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
}

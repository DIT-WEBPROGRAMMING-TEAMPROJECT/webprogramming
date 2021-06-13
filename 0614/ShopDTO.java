package shopPackege;


public class ShopDTO {
	private int productid;
	private int productcode;
	private String name;
	private String info;
	private String detailed;
	private String thumbnail;
	private int price;
	private int stock;
	
	public ShopDTO() {}
	public ShopDTO(int productid,int productcode,String name,String info,String detailed,String thumbnail,int price,int stock) {
		super();
		this.productid=productid;
		this.productcode=productcode;
		this.name=name;
		this.info=info;
		this.detailed=detailed;
		this.thumbnail=thumbnail;
		this.price=price;
		this.stock=stock;
	}
	public int getProductId() {
		return productid;
	}
	public void setProductId(int productId) {
		this.productid = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProductCode() {
		return productcode;
	}
	public void setProductCode(int productCode) {
		this.productcode = productCode;
	}

	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	/*@Override
	public String toString() {
		return "productDTO]"+productId+":"+productCode+":"+name+":"+info+":"+Detailed+":"+Thumbnail+":"+price+":"+stock;
	}*/
}

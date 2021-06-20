package boardPackege;

public class BoardListDTO {
	private String productName;
	private String thumbnailLink;
	private String memberId;
	private String regtime;
	private String content;
	
	public BoardListDTO() {}
	public BoardListDTO(String productName, String thumbnailLink, String memberId, String regtime, String content) {
		super();
		this.productName = productName;
		this.thumbnailLink = thumbnailLink;
		this.memberId = memberId;
		this.regtime = regtime;
		this.content = content;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getThumbnailLink() {
		return thumbnailLink;
	}
	public void setThumbnailLink(String thumbnailLink) {
		this.thumbnailLink = thumbnailLink;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}

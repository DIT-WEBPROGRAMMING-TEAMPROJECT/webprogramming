package boardPackege;

public class BoardDTO {
	private String memberId;
	private int productId;
	private int boardID;
	private String title;
	private String content;
	private String regtime;
	
	public BoardDTO() {}
	public BoardDTO(String memberId,int productId,int boardID,String title,String content,String regtime) {
		super();
		this.memberId=memberId;
		this.productId=productId;
		this.boardID=boardID;
		this.title=title;
		this.content=content;
		this.regtime=regtime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	
	@Override
	public String toString() {
		return "BoardDTO] " + memberId + " : " + productId + " : " + " : " + boardID+" : " +title+" : " + content + " : " +  regtime;
	}
}

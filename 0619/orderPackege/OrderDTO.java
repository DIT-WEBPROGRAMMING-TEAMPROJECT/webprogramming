package orderPackege;
import java.sql.Date;

public class OrderDTO {
		private String memberid;
		private int productid;
		private int quantity;
		private String regtime;
		
		public OrderDTO() {}
		public OrderDTO(String memberid, int productid, int quantity, String regtime) {
			super();
			this.memberid = memberid;
			this.productid = productid;
			this.quantity = quantity;
			this.regtime = regtime;
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
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getRegtime() {
			return regtime;
		}
		public void setRegtime(String regtime) {
			this.regtime = regtime;
		}
}

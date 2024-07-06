package entities;

public class Cart {

	private int pid;
	private String pname;
	private int pQuantity;
	private int uid;
	private int pprice;
	public Cart(int pid, String pname, int pQuantity, int pprice,int uid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pQuantity = pQuantity;
		this.pprice=pprice;
		this.uid = uid;
	}
	public Cart() {
		super();
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	
	
	
	
	
	
	
}

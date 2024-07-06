package entities;

public class Message {

	private String Type;
	private String Content;
	private String cssClass;
	
	// Constructor

	public Message(String type, String content, String cssClass) {
		super();
		Type = type;
		Content = content;
		this.cssClass = cssClass;
	}
	public Message() {
		super();
	}
	
	// Gettors and Settors
	
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	
	
	
	
	
}

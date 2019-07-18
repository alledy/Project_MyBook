package model;

public class MyBookList {
	private int id;
    private String email;
    private String title;
    private String author;
    private String publisher;
    private String image;
    private String m_title;
    private String m_star;
    private String m_content;
    private String registdate;
    
    private int startPage;
    private int endPage;
    
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_star() {
		return m_star;
	}
	public void setM_star(String m_star) {
		this.m_star = m_star;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	@Override
	public String toString() {
		return "MyBookList [id=" + id + ", email=" + email + ", title=" + title + ", author=" + author + ", publisher="
				+ publisher + ", image=" + image + ", m_title=" + m_title + ", m_star=" + m_star + ", m_content="
				+ m_content + ", registdate=" + registdate + "]";
	}
}
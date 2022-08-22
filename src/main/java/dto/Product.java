package dto;

public class Product {
	private String p_num;
	private String p_name;
	private Integer p_type;
	private Integer p_price;
	private String p_desc;
	private String p_spec;
	private String p_image;
	private String p_quan;
	private String p_useyn; 
	private String p_regdate;
	
	public Product() {}
	
	public Product(String p_num, String p_name, Integer p_price) {
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public Integer getP_type() {
		return p_type;
	}

	public void setP_type(Integer p_type) {
		this.p_type = p_type;
	}

	public Integer getP_price() {
		return p_price;
	}

	public void setP_price(Integer p_price) {
		this.p_price = p_price;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public String getP_spec() {
		return p_spec;
	}

	public void setP_spec(String p_spec) {
		this.p_spec = p_spec;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_quan() {
		return p_quan;
	}

	public void setP_quan(String p_quan) {
		this.p_quan = p_quan;
	}

	public String getP_useyn() {
		return p_useyn;
	}

	public void setP_useyn(String p_useyn) {
		this.p_useyn = p_useyn;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}
	
}
	/*
	private String productId;
	private String pname;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInStock;
	private String condition;
	private String filename; // 이미지파일명
	private int quantity; //장바구니에 담은 개
	
	public Product() {}
	
	
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname=pname;
		this.unitPrice=unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
}
*/
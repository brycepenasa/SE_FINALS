package newp;
import java.io.Serializable;

public class forgotbean implements Serializable {

	private static final long serialVersionUID = 1L;
	private String uname;
	private String secQ;
	private String secA;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getSecQ() {
		return secQ;
	}

	public void setSecQ(String secQ) {
		this.secQ = secQ;
	}
	
	public String getSecA() {
		return secA;
	}

	public void setSecA(String secA) {
		this.secA = secA;
	}
}

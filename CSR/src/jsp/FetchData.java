 package jsp;

public class FetchData {
	private static String id="";
	private static String clubname="";
	private static String clubtype="";
	public static String getId() {
		return id;
		
	}
	public static String getClubtype() {
		return clubtype;
		
	}
	public static String getClubname() {
		return clubname;
		
	}
	public void setId(String Id) {
		this.id=id;
	}
	public void setClubtype(String clubtype) {
		this.clubtype=clubtype;
	}
	public void setClubname(String clubname) {
		this.clubname=clubname;
	}

}

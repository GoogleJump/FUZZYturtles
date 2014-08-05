
public class Guest {
	//fields
	private String name;
	public int [] bills; //public for now out of laziness
	private int owed;
	
	public Guest(String newname, int twenties, int tens, int fives, int ones) {
		name = newname;
		bills = new int[4];
		bills[0] = twenties;
		bills[1] = tens;
		bills[2] = fives;
		bills[3] = ones;
	}
	
	public int twenties() {
		return bills[0];
	}
	
	public int tens() {
		return bills[1];
	}
	
	public int fives() {
		return bills[2];
	}
	
	public int ones() {
		return bills[3];
	}
	
	public void setOwed(int cost) {
		owed = cost;
	}
	
	public int getOwed() {
		return owed;
	}
	
	public String getName() {
		return name;
	}
	
	public String toString() {
		String str = "Name: " + name + " Twenties: " + bills[0] + " Tens: " + bills[1] + " Fives: " + bills[2] + " Ones: " + bills[3];
		return str;
	}
}

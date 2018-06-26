package JavaClasses;

/**
 * String Pair Class
 * @author Avtandil
 *
 */
public class StrPair implements Comparable<StrPair>{
	private String first;
	private String second;
	
	/**
	 * StrPair constructor
	 * @param first - First string of the pair
	 * @param second - Second string of the pair
	 */
	public StrPair(String first, String second) {
		this.first = first;
		this.second = second;
	}
	
	/**
	 * 
	 * @return First string of the pair
	 */
	public String getFirst() {
		return first;
	}
	
	/**
	 * 
	 * @return Second string of the pair
	 */
	public String getSecond() {
		return second;
	}
	
	/**
	 * Compares this pair to the other pair.
	 * @param other - other pair to be compared to this one
	 * @return true if given pair is equal to this one
	 */
	public boolean equals(StrPair other) {
		if(this.first.equals(other.getFirst()) && this.second.equals(other.getSecond())) {
			return true;
		}
		return false;
	}

	/**
	 * Compare function for sorting
	 */
	@Override
	public int compareTo(StrPair otherPair) {
		//StrPair otherPair = (StrPair)other;
		if(otherPair.getFirst().equals(this.first)) {
			return otherPair.getSecond().compareTo(this.second);
		}
		return otherPair.getFirst().compareTo(this.first);
	}
	
}

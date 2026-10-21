package junit;

public class Factorial {
	
	public int facts(int num) {
		
		int fact=1;
		for(int i=1;i<=num;i++) {
			fact=fact*i;
		}
	return fact;
	}

}

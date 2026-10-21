package junit;

import static org.junit.Assert.*;

import org.junit.Test;

public class FactorialTest {

	@Test
	public void test() {
	Factorial f=new Factorial();
	int result=f.facts(5);
	
	
	assertEquals(129, result);
	
	
	}

}

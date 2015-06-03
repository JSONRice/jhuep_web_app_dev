package hw3.test;

import junit.framework.TestCase;
import hw3.main.CreditCardValidator;

import org.junit.Assert;
import org.junit.Test;

public class CreditCardValidatorTest extends TestCase {
	
	public static long[] goodinput = {4388576018410707L, 5522791956013777L, 6011764113927706L};
	public static long[] badinput  = {1234567890123456L, 1234567890123L, 12L, 9223372036854775807L, -14L, 456492084841234L, 4388576018402626L};

	
	@Test
	public void testGetPrefix() {
		// good input
		assertEquals(43885, CreditCardValidator.getPrefix(goodinput[0], 5));
		assertEquals(5522791956013L, CreditCardValidator.getPrefix(goodinput[1], 13));
		
		// bad input
		assertEquals(0L, CreditCardValidator.getPrefix(badinput[4], 13));
	}
	
	@Test
	public void testGetSize(){
		// good input
		assertEquals(16, CreditCardValidator.getSize(goodinput[0]));
		assertEquals(16, CreditCardValidator.getSize(goodinput[1]));
		assertEquals(16, CreditCardValidator.getSize(goodinput[2]));
		
		// bad input
		assertEquals(16, CreditCardValidator.getSize(badinput[0]));
		assertEquals(13, CreditCardValidator.getSize(badinput[1]));
		assertEquals(2,  CreditCardValidator.getSize(badinput[2]));
		assertEquals(19, CreditCardValidator.getSize(badinput[3]));
		assertEquals(1,  CreditCardValidator.getSize(badinput[4]));
		assertEquals(15, CreditCardValidator.getSize(badinput[5]));
	}
	
	
	@Test
	public void testSumOfOddPlace(){
       Assert.assertEquals(41, CreditCardValidator.sumOfOddPlace(goodinput[0]));
       Assert.assertEquals(38, CreditCardValidator.sumOfOddPlace(badinput[6]));
	}

	@Test
	public void testSumOfDoubleEvenPlace(){
       Assert.assertEquals(29, CreditCardValidator.sumOfDoubleEvenPlace(goodinput[0]));
       Assert.assertEquals(37, CreditCardValidator.sumOfDoubleEvenPlace(badinput[6]));
	}

	
	@Test
	public void testIsValid() {
		for (long good : goodinput){
			Assert.assertTrue( "The following is a good value that tested bad: " + good, CreditCardValidator.isValid(good));			
		}
		
		for (long bad : badinput){
			Assert.assertFalse( "The following is a bad value that tested good: " + bad, CreditCardValidator.isValid(bad));			
		}
	}
}

import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runners.*;

public class UnitTests {
	private static final int DEFAULT_TIMEOUT = 600000;
	private static final int MAX_COUNT = 25;
	private Split split = new Split();
	
	@Test(timeout = DEFAULT_TIMEOUT)
	public void test01_canMakeExactlyOneBill() throws Throwable {
		assertEquals(split.canMakeExactly(1, 1, 1, 1, 1), true);
		assertEquals(split.canMakeExactly(1, 1, 1, 1, 5), true);
		assertEquals(split.canMakeExactly(1, 1, 1, 1, 10), true);
		assertEquals(split.canMakeExactly(1, 1, 1, 1, 20), true);
		
		assertEquals(split.canMakeExactly(1, 1, 1, 0, 1), false);
		assertEquals(split.canMakeExactly(1, 1, 0, 1, 5), false);
		assertEquals(split.canMakeExactly(1, 0, 1, 1, 10), false);
		assertEquals(split.canMakeExactly(0, 1, 1, 1, 20), false);	
	}
	
	@Test(timeout = DEFAULT_TIMEOUT)
	public void test02_canMakeExactlyTwoBills() throws Throwable {
		for (int i = 0; i < 4; i++) {
			int bill1 = split.BILLINTS[i];
			for (int j = 0; j < 4; j++) {
				int bill2 = split.BILLINTS[j];
				if (i == j && bill1 != 5 && bill1 != 10) {
					assertEquals(split.canMakeExactly(1, 1, 1, 1, bill1 + bill2), false);
				} else {
					assertEquals(split.canMakeExactly(1, 1, 1, 1, bill1 + bill2), true);
				}
			}
		}
	}
	
	@Test(timeout = DEFAULT_TIMEOUT)
	public void test03_canMakeExactlyAllBills() throws Throwable {
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 5; j++) {
				for (int k = 0; k < 5; k++) {
					for (int l = 0; l < 5; l++) {
						int sum = 20 * i + 10 * j + 5 * k + l;
						assertEquals(split.canMakeExactly(i, j, k, l, sum), true);
						//check that more than the sum can't be made
						assertEquals(split.canMakeExactly(i, j, k, l, sum + 1), false);
					}
				}
			}
		}
	}
	
	@Test(timeout = DEFAULT_TIMEOUT)
	public void test04_canMakeExactlyNoBills() throws Throwable {
		assertEquals(split.canMakeExactly(0, 0, 0, 0, 0), true);
		assertEquals(split.canMakeExactly(0, 0, 0, 0, 1), false);
		assertEquals(split.canMakeExactly(1, 2, 3, 4, 0), true);
	}
	
	@Test(timeout = DEFAULT_TIMEOUT)
	//This test brute forces through every combination of 0-MAX_COUNT twenties, tens, fives, and ones,
	//then brute forces through all the sums that can be made with some subset of these bills. It checks
	//that this sum returns true with the combination of bills. Then, if the number of 1s is not equal to 4
	// mod 5, it checks that the sum made by adding the subset of bills checked before but with one more than
	//the total number of possible ones cannot be made.
	public void test05_canMakeExactlyComboOfSomeBills() throws Throwable {
		for (int i = 0; i < MAX_COUNT; i++) {
			for (int j = 0; j < MAX_COUNT; j++) {
				for (int k = 0; k < MAX_COUNT; k++) {
					for (int l = 0; l < MAX_COUNT; l++) {
						for (int m = 0; m <= i; m++) {
							int twenties = i - m;
							for (int n = 0; n <= j; n++) {
								int tens = j - n;
								for (int o = 0; o <= k; o++) {
									int fives = k - o;
									for (int p = 0; p <= l; p++) {
										int ones = l - p;
										int sum = 20 * twenties + 10 * tens + 5 * fives + ones;
										assertEquals(split.canMakeExactly(twenties, tens, fives, ones, sum), true);
										//if there are less than 4 ones total, a sum that requires 1 more one that the guest has will be impossible to make
										if (l % 5 != 4) {
											assertEquals(split.canMakeExactly(twenties, tens, fives, ones, sum - ones + l + 1), false);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	//This test brute forces through the same cases as the previous one, but instead checks that getBillsToPay
	//for each combination of bills and sum returns a valid answer (valid meaning that the sum of bills paid is
	//equal to the sum wanted, and that the number of each denomination paid is less than or equal to the number
	//of that bill available in total.
	@Test(timeout = DEFAULT_TIMEOUT)
	public void test06_getBillsToPay() {
		for (int i = 0; i < MAX_COUNT; i++) {
			for (int j = 0; j < MAX_COUNT; j++) {
				for (int k = 0; k < MAX_COUNT; k++) {
					for (int l = 0; l < MAX_COUNT; l++) {
						for (int m = 0; m <= i; m++) {
							int twenties = i - m;
							for (int n = 0; n <= j; n++) {
								int tens = j - n;
								for (int o = 0; o <= k; o++) {
									int fives = k - o;
									for (int p = 0; p <= l; p++) {
										int ones = l - p;
										int sum = 20 * twenties + 10 * tens + 5 * fives + ones;
										int [] bills = {i, j, k, l};
										int [] billsPaid = split.getBillsToPay(bills, sum);
										int sumBillsPaid = 20 * billsPaid[0] + 10 * billsPaid[1] + 5 * billsPaid[2] + billsPaid[3];
										assertEquals(sumBillsPaid, sum);
										assert(billsPaid[0] <= i);
										assert(billsPaid[1] <= j);
										assert(billsPaid[2] <= k);
										assert(billsPaid[3] <= l);
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

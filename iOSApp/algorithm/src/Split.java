/*
 * SplitTab Bill Splitting Algorithm
 * This is a first pass at the bill splitting algorithm. The idea is that all of the guests pool their money
 * in the center of the table. Then, if possible, each guest takes back the correct amount of change.
 * 
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import acm.program.*;
import java.io.*;
import java.util.*;

public class Split extends Program {
	private static final String[] BILLSTRS = {"twent(ies)", "ten(s)", "five(s)", "one(s)"};
	private static final int[] BILLINTS = {20, 10, 5, 1};
	private static final int BILLMAX = 4;
	
	public void run() {
		ArrayList<Guest> guests = new ArrayList<Guest>();
		
		String name = readLine("Guest's name (hit enter when done): ");
		while (!name.equals("")) {
			int owed = readInt("How much does " + name + " owe (integer value only)? ");
			int twenties = readInt("How many twenties does " + name + " have? ");
			int tens = readInt("How many tens does " + name + " have? ");
			int fives = readInt("How many fives does " + name + " have? ");
			int ones = readInt("How many ones does " + name + " have? ");
			Guest guest = new Guest(name, twenties, tens, fives, ones);
			guest.setOwed(owed);
			guests.add(guest);
			name = readLine("Guest's name (hit enter when done): ");
		}
		
		int[] totalCash = sumGuestsCash(guests);
		for (int i = 0; i < guests.size(); i++) {
			printGuestsActions(guests.get(i), totalCash);
		}
	}
	
	//Adds up all of the cash the guests have and returns each bill's tally in an array of ints
	private int[] sumGuestsCash(ArrayList<Guest> guests) {
		int[] totalCash = new int[BILLMAX];
		for (int i = 0; i < guests.size(); i++) {
			Guest guest = guests.get(i);
			for (int j = 0; j < BILLMAX; j++) {
				totalCash[j] += guest.bills[j];
			}
		}
		return totalCash;
	}
	
	//Prints the bills this guest should contribute and the ones they should take back.
	//At the moment, each guest contributes all their money and takes back the appropriate amount.
	//Recognizes but doesn't really handle cases where one guest doesn't have enough, or change can't be made exactly.
	//totalCash parameter is the sum of all the guests' money (array of tallies of each bill type)
	private void printGuestsActions(Guest guest, int[] totalCash) {
		//totals up this guest's bills
		int guestCash = 20 * guest.bills[0] + 10 * guest.bills[1] + 5 * guest.bills[2] + guest.bills[3];	
		if (guestCash >= guest.getOwed()) {
			//guest has enough money
			int change = guestCash - guest.getOwed();
			//System.out.println("totalCash " + Arrays.toString(totalCash));
			if (canMakeExactly(totalCash[0], totalCash[1], totalCash[2], totalCash[3], change)) {
				int[] guestChange = getBillsToPay(totalCash, change);
				
				//if a guest is taking change out of what they put in, they should never put those bills in
				for (int i = 0; i < BILLMAX; i++) {
					if (guest.bills[i] == guestChange[i]) {
						guest.bills[i] = 0;
						guestChange[i] = 0;
					} else if (guestChange[i] > 0 && guest.bills[i] > 0) {
						if (guestChange[i] > guest.bills[i]) {
							guestChange[i] -= guest.bills[i];
							guest.bills[i] = 0;
						} else if (guest.bills[i] > guestChange[i]) {
							guest.bills[i] -= guestChange[i];
							guestChange[i] = 0;
						}
					}
				}
				
				System.out.print(guest.getName() + " puts down ");
				for (int i = 0; i < BILLMAX; i++) {
					if (guest.bills[i] != 0 /*&& guest.bills[i] != guestChange[i]*/) System.out.print(guest.bills[i] + " " + BILLSTRS[i] + " ");
				}
				System.out.print("and takes back ");
				int count = 0;
				for (int i = 0; i < BILLMAX; i++) {
					if (guestChange[i] != 0 /*&& guestChange[i] != guest.bills[i]*/) {
						System.out.print(guestChange[i] + " " + BILLSTRS[i] + " ");
						count++;
					}
				}
				if (count >0) {
					System.out.println();
				} else {
					System.out.println("nothing");
				}

			} else {
				//exact change for this guest can't be made from the available bills
				System.out.println();
				System.out.println("Uh oh, can't make exact change for " + guest.getName());
			}
		} else if (guestCash < guest.getOwed()){
			//guest does not have enough money
			System.out.println("Uh oh, " + guest.getName() + " doesn't have enough cash!");
		}
	}
	
	//Returns true if a combination of the specified bills exists to make the amount owed
	private Boolean canMakeExactly(int twenties, int tens, int fives, int ones, int owed) {
		int total = 20 * twenties + 10 * tens + 5 * fives + ones;
		if (total == owed) return true;
		if (total < owed) return false;
		if (twenties - 1 >= 0) {
			if (canMakeExactly(twenties - 1, tens, fives, ones, owed)) return true;
		}
		if (tens - 1 >= 0) {
			if (canMakeExactly(twenties, tens - 1, fives, ones, owed)) return true;
		}
		if (fives - 1 >= 0) {
			if (canMakeExactly(twenties, tens, fives - 1, ones, owed)) return true;
		}
		if (ones - 1 >= 0) {
			if (canMakeExactly(twenties, tens, fives, ones - 1, owed)) return true;
		}
		return false;
	}
	
	//Given an array of available bills and an amount of money, returns an array making that amount of
	//money using  bills from the given array. Updates the given array to no longer include bills
	//that need to be used to make the amount of money owed.
	//Assumes the owed amount can be made exactly with the bills in the array
	private int[] getBillsToPay(int[] bills, int owed) {
		int [] billsPaid = new int[BILLMAX];
		while (owed >= 20 && bills[0] > 0) {
			owed -= 20;
			billsPaid[0] = billsPaid[0] + 1;
			bills[0] = bills[0] - 1;
		}
		while (owed >= 10 && bills[1] > 0) {
			owed -= 10;
			billsPaid[1] = billsPaid[1] + 1;
			bills[1] = bills[1] - 1;
		}
		while (owed >= 5 && bills[2] > 0) {
			owed -= 5;
			billsPaid[2] = billsPaid[2] + 1;
			bills[2] = bills[2] - 1;
		}
		while (owed >= 1 && bills[3] > 0) {
			owed -= 1;
			billsPaid[3] = billsPaid[3] + 1;
			bills[3] = bills[3] - 1;
		}
		return billsPaid;
	}
}

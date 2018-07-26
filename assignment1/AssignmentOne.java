/*
@authors: Ayse Akin & Zoe Millard
Pledge: I pledge my honor that I have abided by the Stevens Honor System. -AA, ZM
Date: 8 Sept 17
*/

import java.util.*;

public class AssignmentOne
{
	private static List<Integer> results = new ArrayList<Integer>();

	public static List<Integer> lprimes(List<Integer[]> intervals){
	//lprimes gets list of primes & makes sure there's no duplicates
		List<Integer> primes = null;
		for (int i = 0; i < intervals.size(); i++){
			PrimeFinder pf = new PrimeFinder(intervals.get(i)[0], intervals.get(i)[1]);
    		Thread newThread = new Thread(pf);
    		newThread.start();
    		try{
				newThread.join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			primes = pf.getPrimesList();
			for (int j = 0; j < primes.size(); j++){
				if(j > 0){ //removes dups except it doesnt work and I'm not sure why
					if (results.get(j - 1) != primes.get(j)){
						results.add(primes.get(j));
					}
				}else{
					results.add(primes.get(j));
				}
			}
			primes = new ArrayList<Integer>();

		}
		return results;
    }

    public static void main(String[] args){
		List<Integer[]> intervals = new ArrayList<Integer[]>();
        List<Integer> finalResults = new ArrayList<Integer>();
        Scanner input = new Scanner(System.in);
        System.out.println("Please give a list of numbers to check for prime numbers between. \n" +
        "IE: 2 101 201 301 will check for prime numbers between 2 and 101, 101 and 201, and 201 and 301.");
        String num = input.nextLine();
        String[] nums = num.split(" ");
       	for (int x = 0; x < nums.length-1; x++){ //below it makes sure the input is valid
       		if(Integer.parseInt(nums[x]) >= 2 && Integer.parseInt(nums[x+1]) > Integer.parseInt(nums[x])){
       			Integer[] interval = new Integer[2];
				interval[0] = Integer.parseInt(nums[x]);
				interval[1] = Integer.parseInt(nums[x+1]);
				intervals.add(interval);
       		}
		}
		lprimes(intervals);
		System.out.print("[");
		for(int i = 0; i < results.size(); i++){
			System.out.print(results.get(i));
			if(i != results.size() - 1){
				System.out.print(",");
			}else{
				System.out.print("] \n");
			}
		}
	}
}
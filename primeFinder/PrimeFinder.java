/*
@authors: Ayse Akin & Zoe Millard
Pledge: I pledge my honor that I have abided by the Stevens Honor System. -AA, ZM
Date: 8 Sept 17
*/

import java.util.*;
public class PrimeFinder implements Runnable{
	private Integer start;
	private Integer end;
	private List<Integer> primes;

	PrimeFinder(Integer startNum, Integer endNum){
		start = startNum;
		end = endNum;
	}

	public List<Integer> getPrimesList(){
		run();
		return primes;
	}

	public Boolean isPrime(int n){
		for (int i = 2; i<n; i++){
			if ((n%i)== 0){
				return false;
			}
		}
		return true;
	}

	public void run(){
		primes = new  ArrayList<Integer>();
		for(int i = start; i < end; i++){
			if(isPrime(i)){
				primes.add(i);
			}
		}
	}
}
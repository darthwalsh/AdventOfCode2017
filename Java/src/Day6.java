import java.io.*;
import java.util.*;

public class Day6 {

	public static void main(String[] args) throws Exception {
		File input = new File("../day6test.txt");
		Scanner scan = new Scanner(input);
		List<Integer> nums = new ArrayList<Integer>();
		while(scan.hasNext())
			nums.add(scan.nextInt());
		scan.close();

		System.out.println(nums);
		Set<List<Integer>> lists = new HashSet<List<Integer>>();
		while(lists.add(nums)) {
			iterate(nums);
//			System.out.println(nums);
		}
		
		System.out.println(lists.size());
	}

	public static void iterate(List<Integer> nums){
		int value = nums.stream().max(Comparator.naturalOrder()).get();
		int index = nums.indexOf(value);
		nums.set(index, 0);
		index++;
		for(;value>0;value--,index++) {
			index%=nums.size();
			nums.set(index,nums.get(index)+1);
		}
	}
}

package com.sapo.edu.demo.utlis;

import java.util.Scanner;
import org.apache.commons.lang3.StringUtils;
public class DemoStringUtils {
    public DemoStringUtils(){
    }
    public void demo(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter your name: ");
        String inputString = scanner.nextLine();

        int count1 = Integer.parseInt(String.valueOf(StringUtils.countMatches(inputString, "a")));
        int count2 = Integer.parseInt(String.valueOf(StringUtils.countMatches(inputString, "e")));
        System.out.println("Count of a: " + count1 + "\nCount of e: " + count2);

        String stringWithSuffix = StringUtils.appendIfMissing(inputString, " beautiful forever <3", new CharSequence[0]);
        System.out.println("Handle feature appendIfMissing 'beautiful forever': " + stringWithSuffix);

        String substring = StringUtils.substring(inputString, 2, 7);
        System.out.println("The substring is: " + substring);

        String[] split = StringUtils.split(inputString, " ");
        System.out.println("Split string: ");
        for (String s : split) {
            System.out.println(s);
        }

    }
}

package com.sapo.edu.demo.utlis;

import java.util.Scanner;
import org.apache.commons.lang3.ArrayUtils;
public class DemoArrayUtils {
    public DemoArrayUtils(){
    }
    public void demo(){
        String[] a = {"a", "b", "c"};
        String[] b = {"d", "e", "f", "g"};

        String str = ArrayUtils.toString(a);
        System.out.println("Convert array to string: " + str);

        boolean isSameLength = ArrayUtils.isSameLength(a, b);
        System.out.println("Compare lengths a and b: " + isSameLength);

        String[] c = ArrayUtils.addAll(a, b);
        System.out.println("Merge a and b: ");
        for (String s : c) {
            System.out.println(s);
        }

        String[] d = ArrayUtils.subarray(c, 2, 5);
        System.out.println("Subarray of c: ");
        for (String s : d) {
            System.out.println(s);
        }

        String[] e = ArrayUtils.removeElement(c, "a");
        System.out.println("Remove element a of c: ");
        for (String s : e) {
            System.out.println(s);
        }

        String[] f = ArrayUtils.clone(c);
        System.out.println("Clone c: ");
        for (String s : f) {
            System.out.println(s);
        }
    }
}
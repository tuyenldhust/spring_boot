package com.sapo.edu.demo.utlis;

import java.util.Date;
import java.util.Scanner;

import org.apache.commons.lang3.time.DateUtils;
public class DemoDateUtils {
    public DemoDateUtils(){
    }
    public void demo(){
        Date today = new Date();
        System.out.println("Today: " + today);
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number of days: ");
        int days = sc.nextInt();
        Date newDate = DateUtils.addDays(today, days);
        System.out.printf("New date: %s\n", newDate);

        // Parse date from String
        Scanner input = new Scanner(System.in);
        System.out.println("\n Parse date from String\nEnter date: ");
        String date = input.nextLine();
        try {
            Date date1 = DateUtils.parseDate(date, "dd/MM/yyyy");
            System.out.println("Date: " + date1);

            Date date2 = DateUtils.setMonths(date1, 11);
            System.out.println("Set month 12: " + date2);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
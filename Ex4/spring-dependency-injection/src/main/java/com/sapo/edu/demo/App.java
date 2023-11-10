package com.sapo.edu.demo;

import java.util.Scanner;
import java.math.BigDecimal;

public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter your account number: ");
        String accountNumber = scanner.nextLine();
        System.out.println("Enter your pin: ");
        String pin = scanner.nextLine();
        System.out.println("Enter your initial money: ");
        String initialMoney = scanner.nextLine();

        Customer customer = new Customer(accountNumber, pin, new BigDecimal(initialMoney));
        PrinterFile printerFile = new PrinterFile();
        printerFile.printCustoner(customer);
    }
}

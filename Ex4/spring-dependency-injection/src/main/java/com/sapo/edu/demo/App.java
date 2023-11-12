package com.sapo.edu.demo;

import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.math.BigDecimal;

@SpringBootApplication
public class App implements CommandLineRunner {

    @Autowired
    private ApplicationContext context;

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
    // TODO Auto-generated method stub
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter your account number: ");
        String accountNumber = scanner.nextLine();
        System.out.println("Enter your pin: ");
        String pin = scanner.nextLine();
        System.out.println("Enter your initial money: ");
        String initialMoney = scanner.nextLine();
        scanner.close();

        Customer customer = context.getBean(Customer.class);
        customer.setAcctNo(accountNumber);
        customer.setPin(pin);
        customer.setBalance(new BigDecimal(initialMoney));

        PrinterFile printerFile = context.getBean(PrinterFile.class);
        printerFile.printCustoner(customer);
    }
}

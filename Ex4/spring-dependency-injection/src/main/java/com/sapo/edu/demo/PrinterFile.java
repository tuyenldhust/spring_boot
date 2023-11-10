package com.sapo.edu.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.io.FileWriter;
import java.io.IOException;
@Component
public class PrinterFile implements Printer {
    @Value("${log_path}")
//    private String logFile = "log.txt";
    @Override
    public void printCustoner(Customer customer) {
        try (FileWriter myWriter = new FileWriter("log.txt")) {
            myWriter.write("Account Number: " + customer.getAcctNo() +
                                "\nPin: " + customer.getPin() +
                                "\nMoney: " + customer.getBalance().toString());
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
//            e.printStackTrace();
        }
    }

    @Override
    public void printMessage(String message) {
        try {
            FileWriter myWriter = new FileWriter("log.txt");
            myWriter.write(message);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
        }
    }
}

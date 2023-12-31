package com.sapo.edu.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class Customer {
    private String acctNo;
    private String pin;

    @Value("${init.money}")
    private BigDecimal balance;

    public Customer() {
    }

    public Customer(String accountNo,String pin,BigDecimal balance) {
        this.acctNo = accountNo;
        this.pin = pin;
        this.balance = balance;
    }

    public String getAcctNo() {
        return acctNo;
    }

    public void setAcctNo(String acctNo) {
        this.acctNo = acctNo;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
}

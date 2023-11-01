package com.sapo.edu.demo;

import com.sapo.edu.demo.utlis.DemoDateUtils;
import com.sapo.edu.demo.utlis.DemoStopWatch;
import com.sapo.edu.demo.utlis.DemoStringUtils;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.sapo.edu.demo.utlis.DemoArrayUtils;


import java.util.Scanner;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		int select = 0;
		Scanner input = new Scanner(System.in);

		System.out.println("Please choose: \n" +
				"1. String Utils \n" +
				"2. Array Util \n" +
				"3. Date Utils \n" +
				"4. Stop Watch \n" +
				"5. Exit \n");

		if (input.hasNext()) {
			select = input.nextInt();
		}

		switch (select) {
			case 1:
				DemoStringUtils demoStringUtils = new DemoStringUtils();
				demoStringUtils.demo();
				break;
			case 2:
				DemoArrayUtils demoArrayUtils = new DemoArrayUtils();
				demoArrayUtils.demo();
				break;
			case 3:
				DemoDateUtils demoDateUtils = new DemoDateUtils();
				demoDateUtils.demo();
				break;
			case 4:
				DemoStopWatch demoStopWatch = new DemoStopWatch();
				demoStopWatch.demo();
				break;
			case 5:
				System.out.println("Exit !");
				System.exit(0);
			default:
				System.out.println("Please choose from 1 to 5 !");
		}

		DemoApplication demoApplication = new DemoApplication();
		demoApplication.run();
	}
}

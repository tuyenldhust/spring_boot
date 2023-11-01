package com.sapo.edu.demo.utlis;

import org.apache.commons.lang3.time.StopWatch;
public class DemoStopWatch {
    public DemoStopWatch(){
    }
    public void demo(){
        StopWatch stopwatch = StopWatch.createStarted();
        int i = 5;
        while (i > 0) {
            System.out.println(i);
            i--;
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        stopwatch.stop();
        System.out.println("Time: " + stopwatch.getTime());

        stopwatch.reset();
        stopwatch.start();

    }
}

/*
 * Name: Muhammad Owais Imran
 * Course: CS511-A
 * Assignment: 02 (Semaphores)
 * Due Date: Oct 1st, 2023
*/
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Semaphore;
import java.util.concurrent.CountDownLatch;

public class Bakery implements Runnable {
    private static final int TOTAL_CUSTOMERS = 200;
    private static final int CAPACITY = 50;
    private static final int FULL_BREAD = 20;
    private Map<BreadType, Integer> availableBread;
    private ExecutorService executor;
    private float sales = 0;
    private CountDownLatch doneSignal = new CountDownLatch(TOTAL_CUSTOMERS);
    

    public Semaphore cashier;
    public Semaphore customers;
    public Semaphore[] breadShelves;

    /**
     * Remove a loaf from the available breads and restock if necessary
     */
    public void takeBread(BreadType bread) {
        int breadLeft = availableBread.get(bread);
        if (breadLeft > 0) {
            availableBread.put(bread, breadLeft - 1);
        } else {
            System.out.println("No " + bread.toString() + " bread left! Restocking...");
            // restock by preventing access to the bread stand for some time
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ie) {
                ie.printStackTrace();
            }
            availableBread.put(bread, FULL_BREAD - 1);
        }
    }

    /**
     * Add to the total sales
     */
    public void addSales(float value) {
        sales += value;
    }

    /**
     * Run all customers in a fixed thread pool
     */
    public void run() {
        availableBread = new ConcurrentHashMap<BreadType, Integer>();
        availableBread.put(BreadType.RYE, FULL_BREAD);
        availableBread.put(BreadType.SOURDOUGH, FULL_BREAD);
        availableBread.put(BreadType.WONDER, FULL_BREAD);

        
        cashier = new Semaphore(4);
        customers = new Semaphore(50);

        breadShelves = new Semaphore[3];
        for(int i=0; i<3; i++) {
            breadShelves[i] = new Semaphore(1);
        }

        executor = Executors.newFixedThreadPool(CAPACITY);
        for(int i=0; i<TOTAL_CUSTOMERS; i++) {
            Customer customer = new Customer(this, doneSignal);
            executor.execute(customer);
        }

        try {
            doneSignal.await();
            System.out.printf(" Total sales = %.2f\n", sales);
            executor.shutdown();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
    }
}

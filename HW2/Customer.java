/*
 * Name: Muhammad Owais Imran
 * Course: CS511-A
 * Assignment: 02 (Semaphores)
 * Due Date: Oct 1st, 2023
*/

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.HashMap;
import java.util.Map;

public class Customer implements Runnable {
    private Bakery bakery;
    private Random rnd;
    private List<BreadType> shoppingCart;
    private int shopTime;
    private int checkoutTime;
    private CountDownLatch doneSignal;
    private String customerHash;
    private static int customerID= 1;
    
    
    /**
     * Initialize a customer object and randomize its shopping cart
     */
    public Customer(Bakery bakery, CountDownLatch l) {
        
        this.bakery = bakery;
        this.doneSignal = l;

        this.shoppingCart = new ArrayList<>();
        this.rnd = new Random();
        this.shopTime = rnd.nextInt(10)+10;     // anywhere between 10-20ms
        this.checkoutTime = rnd.nextInt(50)+20; // anywhere between 20-70ms

        customerHash = Integer.toString(customerID);
        customerID++;
        
        fillShoppingCart();
    }

    /**
     * Run tasks for the customer
     */
    public void run() {

        try {
            bakery.customers.acquire();
            Map<String, Integer> breadToIndexMap = new HashMap<>();
            breadToIndexMap.put("RYE", 0);
            breadToIndexMap.put("WONDER", 1);
            breadToIndexMap.put("SOURDOUGH", 2);

            System.out.println("[EVENT]: Customer: " + customerHash + " has started shopping at time: " + shopTime + "ms");
            Thread.sleep(shopTime);
            for (int i=0; i<this.shoppingCart.size(); i++) {
                System.out.println("[EVENT]: Customer ID: " + customerHash + " is picking Bread: " + shoppingCart.get(i));
                this.bakery.breadShelves[ breadToIndexMap.get(shoppingCart.get(i).toString()) ].acquire();
                this.bakery.takeBread(this.shoppingCart.get(i));
                this.bakery.breadShelves[ breadToIndexMap.get(shoppingCart.get(i).toString()) ].release();
            }

            Thread.sleep(checkoutTime);
           
            bakery.cashier.acquire();
            System.out.println("[EVENT]: Customer: " + customerHash + " has finished shopping at time: " + checkoutTime + "ms");
            this.bakery.addSales(this.getItemsValue());
            bakery.cashier.release();
            
            bakery.customers.release();
            doneSignal.countDown();

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    /**
     * Return a string representation of the customer
     */
    public String toString() {
        return "Customer " + hashCode() + ": shoppingCart=" + Arrays.toString(shoppingCart.toArray()) + ", shopTime=" + shopTime + ", checkoutTime=" + checkoutTime;
    }

    /**
     * Add a bread item to the customer's shopping cart
     */
    private boolean addItem(BreadType bread) {
        // do not allow more than 3 items, chooseItems() does not call more than 3 times
        if (shoppingCart.size() >= 3) {
            return false;
        }
        shoppingCart.add(bread);
        return true;
    }

    /**
     * Fill the customer's shopping cart with 1 to 3 random breads
     */
    private void fillShoppingCart() {
        int itemCnt = 1 + rnd.nextInt(3);
        while (itemCnt > 0) {
            addItem(BreadType.values()[rnd.nextInt(BreadType.values().length)]);
            itemCnt--;
        }
    }

    /**
     * Calculate the total value of the items in the customer's shopping cart
     */
    private float getItemsValue() {
        float value = 0;
        for (BreadType bread : shoppingCart) {
            value += bread.getPrice();
        }
        return value;
    }
}

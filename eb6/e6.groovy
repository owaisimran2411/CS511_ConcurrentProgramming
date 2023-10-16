
import java.util.concurrent.locks.*
class Pizza {
    // Variable declared here
    int small
    int large
    final Lock lock = new ReentrantLock()
    final Condition smallC = lock.newCondition()
    final Condition smallL = lock.newCondition()

    Pizza() {
        small = 0
        large = 0
    }

    void purchaseSmallPizza() {
        // complete
        lock.lock()
        try {
            while (small == 0) {
                smallC.await()
            }
            small--

        } finally {
            lock.unlock()
        }
    }

    void purchaseLargePizze() {
        // complete
        lock.lock()
        try {
            while (large == 0 && small < 2 ) {
                smallL.await()
            }
            if (large > 0 ) {
                large--
            }
            else {
                small-=2
            }
        } finally {
            lock.unlock()
        }
    }

    void bakeSmallPizza() {
        // complete
        lock.lock()
        try {
            small++
            smallC.signal()
            smallL.signal()
        } finally {
            lock.unlock()
        }
    }

    void bakeLargePizza() {
        // complete
        lock.lock()
        try {
            large++
            smallC.signal()
            smallL.signal()
        } finally {
            lock.unlock()
        }
    }
}

Pizza p = new Pizza()

10.times {
    Thread.start { // buyer
        switch((new Random()).nextInt(2)) {
            case 0:
                p.purchaseSmallPizza()
                break
            default:
                p.purchaseLargePizze()
                break
        }
    }
}

10.times {
    Thread.start { // baker
        switch((new Random()).nextInt(2)) {
            case 0:
                p.bakeSmallPizza()
                break
            default:
                p.bakeLargePizza()
                break
        }
    }
}
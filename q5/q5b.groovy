/*
    Name: Muhammad Owais Imran
    Pledge: I pledge my honor that I will abide by the Stevens Honor Code
*/
import java.util.concurrent.locks.*

class Grid {
    private int p
    private int c

    final Lock l = new ReentrantLock()
    final Condition pCond = l.newCondition()
    final Condition cCond = l.newCondition()

    Grid() {
        p=0
        c=0
    }

    void StartConsuming() {
        l.lock()
        try {
            while( c > p) {
                println "Consumers are greater than Producers, so we have to wait to Consume; COUSUMERS: " + c + "  PRODUCERS: " + p
                cCond.await()
            }
            c++
            pCond.signal()
        } finally {
            l.unlock()
        }
    }

    void StopConsuming() {
        l.lock()
        try {
            while(c<1) {
                println "There are no current Consumers"
                cCond.await()
            }
            c--
            pCond.signal()
            cCond.signal()
        } finally {
            l.unlock()
        }
    }

    void StartProducing() {
        l.lock()
        try {
            p++
            pCond.signal()
            cCond.signal()
        } finally {
            l.unlock()
        }
    }

    void StopProducing() {
        l.lock()
        try {
            while( p < c || p < 1) {
                println "Consumers are greater than Producer, so we have to wait to stop producing; COUSUMERS: " + c + "  PRODUCERS: " + p + " (OR) There are no producers"
                pCond.await()
            }
            p-- 
            cCond.signal()
        } finally {
            l.unlock()
        }
    }

}

final int N = 100

Grid grid = new Grid()
N.times {
    int c = it
    Thread.start {
        switch((new Random()).nextInt(2)) {
            case 0:
                println "Thread: " + c + " entered as Consumer"
                grid.StartConsuming()
                println "Thread: " + c + " Started Consuming"
                grid.StopConsuming()
                println "Thread: " + c + " Stopped Consuming"
            default:
                println "Thread: " + c + " entered as Producer"
                grid.StartProducing()
                println "Thread: " + c + " Started Producing"
                grid.StopProducing()
                println "Thread: " + c + " Stopped Producing"
        }
    }
}
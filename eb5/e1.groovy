import java.util.concurrent.Semaphore

final int NP = 10
final int NJ = 7

Semaphore tickets = new Semaphore(0)
Semaphore mutex = new Semaphore(1)
boolean itGotLate = false


NP.times {
    Thread.start {
        tickets.release()
    }
}

NJ.times {
    Thread.start {
        mutex.acquire()
        if ( !itGotLate ) {
            // mutex.acquire() invalid for case2 because what to do with those who are stuck at this point, can lead to tickets.acquire() issue again
            tickets.acquire()
            tickets.acquire()
            // mutex.release()
        }    
        else {
            tickets.release()
        }
        mutex.release()
    }
}

Thread.start { // Timer
    sleep(1000)
    itGotLate = true

    // it is done to unblock the thread if the contexts get switch in the middle
    tickets.release()
    tickets.release()
}
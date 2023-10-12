import java.util.concurrent.Semaphore

final int N=10; // capacity
Semaphore[] board = [new Semaphore(0), new Semaphore(0)]
Semaphore onboard = new Semaphore(0)
Semaphore offboard = new Semaphore(0)
Semaphore disembark = new Semaphore(0)


Thread.start {
    int coast = 0;
    while (true) {
        // allow passengers on
        board[coast].release(N)

        // wait for all passengers to be on board
        N.times {
            onboard.acquire()
        }
        // move to opposite coast
        coast = 1-coast
        // wait for all passengers to get of
        disembark.release(N)
        N.times {
            offboard.acquire()
        }
    }
}

100.times {
    Thread.start { // Passenger on East Coast
        // get on
        board[0].acquire()
        onboard.release()
        // get off at opposite coast i.e. West Coast
        disembark.acquire()
        offboard.release()
        
    }
}

100.times {
    Thread.start {  // Passenger on West Coast
        // get on
        board[1].acquire()
        onboard.release()
        // get off at opposite coast i.e. East Coast
        disembark.acquire()
        offboard.release()
    }
}
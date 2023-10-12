import java.util.concurrent.Semaphore

// Declare Semaphores here
Semaphore feedingLot = new Semaphore(1)
Semaphore mutexCat = new Semaphore(1)
Semaphore mutexDog = new Semaphore(1)

20.times {
    Thread.start {
        //access feeding lot
        feedingLot.acquire()
        // eat
        mutexCat.acquire()
        mutexCat.release()
        // exit feeding lot
        feedingLot.release()
    }
}

20.times {
    Thread.start {
        // access feeding lot
        feedingLot.acquire()
        mutexDog.acquire()
        mutexDog.release()
        // eat
        // exit feeding lot
        feedingLot.release()
    }
}
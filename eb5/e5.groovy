import java.util.concurrent.Semaphore

Semaphore station0 = new Semaphore(1)
Semaphore station1 = new Semaphore(1)
Semaphore station2 = new Semaphore(1)
permToProcess = [new Semaphore(0), new Semaphore(0), new Semaphore(0)]
doneProcessing = [new Semaphore(0), new Semaphore(0), new Semaphore(0)]

100.times {
    Thread.start { // Car
        // go to station0
        station0.acquire()
        permToProcess[0].release()
        doneProcessing[0].acquire()
        // Move on to station1
        station1.acquire()
        station0.release()
        permToProcess[1].release()
        doneProcessing[1].acquire()
        // Move on to station2
        station2.acquire()
        station1.release()
        permToProcess[2].release()
        doneProcessing[2].acquire()
        station2.release()
    }
}

3.times {
    int id = it // iteration variable
    Thread.start { // Machine at station id
        while(true) {
            // Wait for car to arrive
            permToProcess[id].acquire()
            // process car when it has arrived
            doneProcessing[id].release()

        }
    }
}

return
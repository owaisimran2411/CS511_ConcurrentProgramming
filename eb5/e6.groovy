import java.util.concurrent.Semaphore

// Declare semaphores here
Semaphore useCrossing = new Semaphore(1)
endpointMutexList = [new Semaphore(1, true), new Semaphore(1, true)]

noOfCarsCrossing = [0, 0]   // list of ints
r = new Random()

100.times {
    int myEndPoint = r.nextInt(2)   // pick a random direction
    int id = it
    Thread.start { // Car
        // entry protocol
        endpointMutexList[myEndPoint].acquire()
        if (noOfCarsCrossing[myEndPoint] == 0) {
            useCrossing.acquire()
        }
        noOfCarsCrossing[myEndPoint]++
        endpointMutexList[myEndPoint].release()

        // cross crossing
        println "car " +id +" crossing in direction "+myEndPoint+" current totals: "+noOfCarsCrossing

        // exit control
        endpointMutexList[myEndPoint].acquire()
        noOfCarsCrossing[myEndPoint]--
        if (noOfCarsCrossing[myEndPoint] == 0) {
            useCrossing.release()
        }
        endpointMutexList[myEndPoint].release()

    }
}
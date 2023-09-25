import java.util.concurrent.Semaphore

Semaphore okA = new Semaphore(3)
Semaphore okB = new Semaphore(0)

Thread.start {
    while(true) {
        okA.acquire()
        print "a"
        okB.release()
    }
}

Thread.start {
    while(true) {
        okB.acquire()
        okB.acquire()
        okB.acquire()
        print "b"
        okA.release()
        okA.release()
        okA.release()
    }
}
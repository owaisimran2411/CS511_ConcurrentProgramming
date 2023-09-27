import java.util.concurrent.Semaphore

Semaphore okA = new Semaphore(2)
Semaphore okBorC = new Semaphore(0)
Semaphore mutex = new Semaphore(1)

Thread.start { // P
    while (true) {
        okA.acquire()
        print "a"
        okBorC.release()
    }
}

Thread.start { // Q
    while (true) {
        mutex.acquire()
        okBorC.acquire()
        okBorC.acquire()
        okBorC.acquire()
        print "b"
        okA.release()
        okA.release()
        okA.release()
        mutex.release()
    }
}

Thread.start { // R
    while (true) {
        mutex.acquire()
        okBorC.acquire()
        okBorC.acquire()
        okBorC.acquire()
        print "c"
        okA.release()
        okA.release()
        okA.release()
        mutex.release()
    }
}
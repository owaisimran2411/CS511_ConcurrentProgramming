import java.util.concurrent.Semaphore

Semaphore sem1 = new Semaphore(0)
Semaphore sem2 = new Semaphore(0)
Semaphore sem3 = new Semaphore(0)

Thread.start {
    print "R "
    sem1.release()
    sem3.acquire()
    print "OK "
    sem3.release()
}

Thread.start {
    sem1.acquire()
    print "I "
    sem2.release()
    sem3.acquire()
    print "OK "
    sem3.release()
}

Thread.start {
    sem2.acquire()
    print "O "
    sem3.release()
    sem3.acquire()
    print "OK "
    sem3.release()
}
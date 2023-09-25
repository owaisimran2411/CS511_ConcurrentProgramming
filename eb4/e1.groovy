import java.util.concurrent.Semaphore

Semaphore printA = new Semaphore(0)
Semaphore printF = new Semaphore(0)
Semaphore printC = new Semaphore(0)

Thread.start {
    // P
    
    print "a"
    printA.release()
    print "b"
    printF.acquire()
    print "c"
    
}

Thread.start {
    // Q
    
    print "e"
    printA.acquire()
    print "f"
    printF.release()
    print "g"    
}
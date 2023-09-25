import java.util.concurrent.Semaphore

Semaphore printL = new Semaphore(0)
Semaphore printAS = new Semaphore(0)

Thread.start {
    printL.acquire()
    print "A"
    print "S"
    printAS.release()
}

Thread.start {
    print "L"
    printL.release()
    printAS.acquire()
    print "E"
    print "R"
}
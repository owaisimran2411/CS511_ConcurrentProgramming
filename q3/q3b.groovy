
/*
Quiz 3 - 25 Sep 2023 - Topic 2

You may only declare semaphores and add acquire/release instructions.
The output should be:

aabccaabccaabcc....

Name: Muhammad Owais Imran

*/

import java.util.concurrent.Semaphore;
// Semaphore declarations 
Semaphore okA = new Semaphore(4)
Semaphore okB = new Semaphore(0)
Semaphore okC = new Semaphore(0)

Thread.start { // P
    while (true) {
        okA.acquire()
        okA.acquire()
        print "a"
        okB.release()
        okB.release()
    
    }
}

Thread.start { // Q
    while (true) {
        okB.acquire()
        okB.acquire()
        okB.acquire()
        okB.acquire()
        print "b"
        okC.release()
        okC.release()
        okC.release()
        okC.release()
    }
}

Thread.start { // R
    while (true) {
        okC.acquire()
        okC.acquire()
        print "c"
        okA.release()
        okA.release()
    }
}
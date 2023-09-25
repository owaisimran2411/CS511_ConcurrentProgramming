import java.util.concurrent.Semaphore

Semaphore mutex1 = new Semaphore(0, true)
Semaphore mutex2 = new Semaphore(1, true)

int n2=0
int n=50

P = Thread.start {
    while (n>=0) {
        mutex1.acquire()
        n = n-1
        mutex2.release()
    }
}

Thread.start {
    while (true) {
        mutex2.acquire()
        n2 = n2 + 2*n + 1
        mutex1.release()
    }
}

P.join()

print n2
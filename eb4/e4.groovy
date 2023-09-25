import java.util.concurrent.Semaphore

int y=0
int z=0

Semaphore restrictValues = new Semaphore(1)

Thread.start {
    int x
    restrictValues.acquire()
    x = y+z
    restrictValues.release()
    print x
}

Thread.start {
    restrictValues.acquire()
    y = 1
    restrictValues.release()
    restrictValues.acquire()
    z = 2
    restrictValues.release()
}

// 1. 0,1,2,3

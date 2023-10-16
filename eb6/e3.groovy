class Barrier {
    // complete
    int threadCount
    int b
    Barrier(int barrier) {
        // code for constructor
        b = barrier
        threadCount = 0
    }

    synchronized void waitAtBarrier() {
        threadCount++
        while (threadCount != b) {
            wait()
            notify()
        }
        notify()
    }
}

Barrier b = new Barrier(3)

Thread.start { // T1
    print("a")
    b.waitAtBarrier()
    print("1")
}

Thread.start { // T2
    print("b")
    b.waitAtBarrier()
    print("2")
}

Thread.start { // T3
    print("c")
    b.waitAtBarrier()
    print("3")
}
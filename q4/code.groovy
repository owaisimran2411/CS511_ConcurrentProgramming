// Name1: Muhammad Owais Imran
// Name2: Ridham Patel
// Pledge: I pledge my honor that I will abide my the Stevens Honor Code

import java.util.concurrent.Semaphore

Semaphore permToLoad = new Semaphore(1)
Semaphore doneLoading = new Semaphore(0)

// Additional semaphores
Semaphore[] tracks = [new Semaphore(1), new Semaphore(1)]
Semaphore[] mutex = [new Semaphore(1), new Semaphore(1)]
boolean isPassenger = false

100.times {

    int dir = ( new Random()).nextInt(2) ;
    Thread.start { // Passenger Train travelling in direction dir
        // complete
        print "passenger train at track: $dir\n"
        mutex[dir].acquire()
        tracks[dir].acquire()
        
    
        // release
        
        tracks[dir].release()
        mutex[dir].release()
        print "passenger train at track: $dir left\n"
    }
}

100.times {
    int dir = ( new Random()).nextInt(2) ;
    Thread.start { // Freight Train travelling in direction dir
        // complete
        print "freight train at track: $dir\n"
        mutex[0].acquire()
        mutex[1].acquire()
        tracks[dir].acquire()
        doneLoading.acquire()
        tracks[dir].release()
        permToLoad.release()
        mutex[1].release()
        mutex[0].release()
        print "freight train at track: $dir left\n"
    }
}

Thread.start { // Loading Machine
    while ( true ) {
        permToLoad.acquire() ;
        // load freight train
        doneLoading.release() ;
    }
}


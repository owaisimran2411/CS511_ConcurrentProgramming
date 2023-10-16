import java.util.concurrent.locks.*

class TrainStation {
    final Lock l = new ReentrantLock()
    final Condition southP = l.newCondition()
    final Condition northP = l.newCondition()
    final Condition southNorthF = l.newCondition()
    boolean trainAtSouth
    boolean trainAtNorth

    TrainStation() {
        trainAtSouth = false
        trainAtNorth = false
    }

    void acquireNorthTrackP() {
        l.lock()
        try {
            while (trainAtNorth) {
                northP.await()
            }
            trainAtNorth = true
        } finally {
            l.unlock()
        }
    }
    void releaseNorthTrackP() {
        l.lock()
        try {
            trainAtNorth = false
            northP.signal()
            southNorthF.signal()
        } finally {
            l.unlock()
        }

    }
    void acquireSouthTrackP() {
        l.lock()
        try {
            while (trainAtSouth) {
                southP.await()
            }
            trainAtSouth = true
        } finally {
            l.unlock()
        }
    }
    void releaseSouthTrackP() {
        l.lock()
        try {
            trainAtSouth = false
            southP.signal()
            southNorthF.signal()
        } finally {
            l.unlock()
        }
    }
    void acquireTracksF() {
        l.lock()
        try {
            while (trainAtNorth && trainAtSouth) {
                southNorthF.await()
            }
            trainAtNorth = true
            trainAtSouth = true
        } finally {
            l.unlock()
        }
    }
    void releaseTrackF() {
        l.lock()
        try {
            trainAtNorth=false
            trainAtSouth=false
            southNorthF.signal()
            northP.signal()
            southP.signal()
        } finally {
            l.unlock()
        }
    }
}

TrainStation s = new TrainStation()

100.times {
    Thread.start {  // Passenger Train going North
        s.acquireNorthTrackP()
        println "NPT" + Thread.currentThread().getId()
        s.releaseNorthTrackP()
    }
}

100.times {
    Thread.start {  // Passenger Train going South
        s.acquireSouthTrackP()
        println "SPT" + Thread.currentThread().getId()
        s.releaseSouthTrackP()
    }
}

10.times {
    Thread.start {  // Freight Train
        s.acquireTracksF()
        println "FT" + Thread.currentThread().getId()
        s.releaseTrackF()
    }
}
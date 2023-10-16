import java.util.concurrent.locks.*

class Sequencer {
    final Lock lock = new ReentrantLock()
    final Condition stage_1 = lock.newCondition()
    final Condition stage_2 = lock.newCondition()
    final Condition stage_3 = lock.newCondition()
    Integer state

    Sequencer() {
        state = 1
    }

    void first() {
        l.lock()
        try {
            while (state!=1) {
                stage_1.await()
            }
            state=2
            stage_2.signal()
        } finally {
            l.unlock()
        }
    }

    void second() {
        l.lock()
        try {
            while (state!=2) {
                stage_2.await()
            }
            state=2
            stage_3.signal()
        } finally {
            l.unlock()
        }
    }
    void third() {
        l.lock()
        try {
            while (state!=3) {
                stage_3.await()
            }
            state=3
            stage_1.signal()
        } finally {
            l.unlock()
        }
    }
}
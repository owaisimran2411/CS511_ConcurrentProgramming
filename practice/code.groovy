import java.util.concurrent.locks.*
class BB {
    Integer buffer
    final Lock l = new ReentrantLock()
    final Condition canProduce = l.newCondition()
    final Condition canConsume = l.newCondition()
    BB() {
        buffer = null
    }

    void produce(Integer p) {
        l.lock()
        try {
            while(buffer!=null) {
                canProduce.await()
            }
            buffer = p
            canConsume.signal()
        } finally {
            l.unlock()
        }
    }

    Integer consume() {
        Integer temp
        l.lock()
        try {
            while(buffer==null) {
                canConsume.await()
            }
            temp = buffer
            buffer = null
            canProduce.signal()
            return temp
        } finally {
            l.unlock()
        }
    }
}

BB bb = new BB()

10.times {
    Thread.start {
        bb.produce((new Random()).nextInt(10))
    }
}

10.times {
    Thread.start {
        println bb.consume()
    }
}


// class Sem {
//     int permits
//     Sem (int init) {
//         permits = init
//     }

//     synchronized void acquire() {
//         while (permits == 0) {
//             wait()
//         }
//         permits--
//     }

//     synchronized void release() {
//         notify()
//         permits++
//     }
// }

// Sem s = new Sem(1)

// Thread.start {
//     s.acquire()
//     println "a"
// }

// Thread.start {
//     s.release()
//     println "b"
// }
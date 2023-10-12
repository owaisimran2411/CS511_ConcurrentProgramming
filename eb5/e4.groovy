import java.util.concurrent.Semaphore

MAX_WEIGHTS = 50
GYM_CAP = 50

// Declare Semaphore here
Semaphore atATime = new Semaphore(GYM_CAP)
Semaphore weights = new Semaphore(MAX_WEIGHTS)
Semaphore mutexWeights = new Semaphore(1, true)

def make_routine(int no_exercises) { // returns a random route
    Random rand = new Random()
    int size = rand.nextInt(no_exercises)
    def routine = []

    size.times {
        routine.add(new Tuple(rand.nextInt(4), rand.nextInt(MAX_WEIGHTS)))
    }
    return routine
}

100.times {
    int id = it
    Thread.start {
        def routine = make_routine(20) // random routine of 20 exercises
        // enter gym
        atATime.acquire()

        routine.size().times {
            // complete exercise on machine
            println "$id is performing"+routine[it][0]+"--"+routine[it][1]
            mutexWeights.acquire()
            routine[it][1].times {
                weights.acquire()
            }
            weights.release(routine[it][1])
            mutexWeights.release()
        }

        atATime.release()

    }
}

return
return
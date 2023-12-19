#define N 3
#define C 10

byte permToProcess[N];
byte doneProcessing[N];
byte station0 = 1;
byte station1 = 1;
byte station2 = 1;

byte cars[N];

inline acquire(s) {
    atomic {
        s>0 -> s--
    }
}
inline release(s) {
    atomic {
        s++
    }
}

proctype Car() {
    atomic {
        acquire(station0)
        assert(cars[0]<2)
        cars[0]++
    }
    release(permToProcess[0])
    acquire(doneProcessing[0])
    atomic {
        acquire(station1)
        assert(cars[1]<2)
        cars[1]++
    }
    atomic {
        release(station0)
        cars[0]--
    }
    release(permToProcess[1])
    acquire(doneProcessing[1])
    atomic {
        acquire(station2)
        assert(cars[2]<2)
        cars[2]++
    }
    atomic {
        release(station1)
        cars[1]--
    }
    release(permToProcess[2])
    release(doneProcessing[2])
    atomic {
        release(station2)
        cars[2]--
    }
}

proctype Machine(int i) {
        acquire(permToProcess[i])
        release(doneProcessing[i])
}

init {
    byte i;
    for (i:0..(N-1)) {
        permToProcess[i] = 0
        doneProcessing[i] = 0
        cars[i] = 0
    }

    atomic {
        for(i:0..(C)) {
            run Car()
        }
        for(i:0..(N-1)) {
            run Machine(i)
        }
    }
}
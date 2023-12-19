byte ticket=0;
byte mutex=1;

byte pCount=0, jCount=0;

inline acquire(sem) {
    atomic {
        sem > 0 -> sem--
    }
}

inline release(sem) {
    sem++
}

active[20] proctype jets() {
endstate1:
    do
    ::  ticket>1 ->
            atomic {
                acquire(mutex)
                ticket--
                ticket--
                jCount++
                release(mutex)
                break
            }   
    od;
}

active[20] proctype patriots() {
    atomic {
        acquire(mutex)
        ticket++
        pCount++
        release(mutex)
    }
}

active proctype validate() {
    assert (pCount*2>=jCount && pCount>=0 && jCount>=0)
}
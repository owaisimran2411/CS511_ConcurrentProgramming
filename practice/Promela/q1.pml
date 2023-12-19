byte x=0;

proctype P() {
    do
        :: x>=200 -> break;
        :: else -> x++;
    od;
}

proctype Q() {
    do
        :: x<=0 -> break;
        :: else -> x--;
    od;
}

proctype R() {
    do
        :: x==200 -> x=0;
        :: else -> skip
    od;
}

active proctype validate() {
    assert (x>=0 && x<=200)
}

init {
    atomic {
        run P();
        run Q();
        run R();
    }
}
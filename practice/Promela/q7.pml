byte np=0,nq=0,crit=0

active proctype P() {
    do
        ::  byte temp=nq
            np = temp + 1
            do
                ::  nq==0 || np<=nq -> skip
                ::  else -> break
            od;
            crit++
            assert (crit<=1)
            crit--
            np = 0
    od;
}

active proctype Q() {
    do
        ::  byte temp=np
            nq = temp + 1
            do
                ::  np==0 || nq<np -> skip
                ::  else -> break
            od;
            crit++
            assert (crit<=1)
            crit--
            nq = 0
    od;
}
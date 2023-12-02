# define N 5    /*number of processes in the ring*/
# define L 10   /*size of buffer (>= 2N)*/
byte I;         /*will be used for init for assigning ID to nodes*/

mtype = {one, two, winner};             /*symb. Msg. Names*/
chan q[N] = [L] of {mtype, byte};        /*async messsage*/

byte nr_leaders = 0;        /*hint variable to count number of leaders*/

proctype nnode (chan inp, out; byte mynumber) {
    bit Active = 1;
    bit know_winner = 0;
    byte nr;
    byte maximum = mynumber;
    byte neighbourR;

    xr inp; /*channel assertion : exclusive recv access to channel in*/
    xs out; /*channel assertion : exclusive send access to channel out*/

    printf("\nMSC %d", mynumber);
    out!one(mynumber);
    end:    do
    :: inp?one(nr) -> 
        if
        :: Active ->
            if
            ::  nr != maximum ->
                    out!two(nr);
                    neighbourR = nr;
            ::  else ->
                    know_winner = 1;
                    out!winner, nr;
            fi
        ::  else ->
                out!one(nr)
        fi
    
    :: inp?two(nr) ->
        if
        ::  Active ->
            if
            ::  neighbourR > nr && neighbourR > maximum ->
                    maximum = neighbourR;
                    out!one(neighbourR)
            ::  else ->
                    Active = 0 
            fi
        ::  else ->
                out!two(nr) 
        fi
    
    ::  inp?winner, nr ->
        if
        ::  nr != mynumber ->
                printf("\nMSC %d: LOST", inp);
        :: else ->
                printf("\nMSC %d: LEADER", inp);
                assert(nr_leaders <= 1);
                atomic {
                    if
                    :: mynumber == N ->
                            assert(nr == mynumber);
                    fi;
                    nr_leaders++;
                }
                
        fi;
        if
        ::  know_winner
        ::  else -> out!winner, nr
        fi;
        break
    od
}

init {
    byte proc;
    byte Ini[6];        /*N<=6 randomize the process numbers*/
    atomic {
        I = 1;      /*pick a number to be assigned 1..N*/
        do
        ::  I <= N ->
            if          /*Non deterministic Choice*/
            :: Ini[0] == 0 && N >= 1 -> Ini[0] = I
            :: Ini[1] == 0 && N >= 2 -> Ini[1] = I
            :: Ini[2] == 0 && N >= 3 -> Ini[2] = I
            :: Ini[3] == 0 && N >= 4 -> Ini[3] = I
            :: Ini[4] == 0 && N >= 5 -> Ini[4] = I
            :: Ini[5] == 0 && N >= 6 -> Ini[5] = I      /*Works for Upto N=6*/
            fi;
            I++
        :: I > N ->
            break
        od;

        /*starts all nodes in the ring*/
        proc = 1;
        do
        ::  proc <= N ->
                run nnode(q[proc-1], q[proc%N], Ini[proc-1]);
                proc++;
        ::  proc > N ->
                break;
        od    
    }
}   
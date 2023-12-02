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
        :: nr == mynumber ->
                out!winner, inp;
                printf("\nMSC %d: LEADER", inp);
                break;
        :: nr > mynumber ->
                out!one, nr
        :: else -> skip;
        fi
    
    ::  inp?winner, nr ->
        if
		:: nr != inp ->
			printf("\nI am node %d and I know the leader is node %d", inp, nr)
			out! winner, nr;

		:: else ->
			printf("\nI am node %d and I am the leader", mynumber);
			skip;
		fi;
		break;
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
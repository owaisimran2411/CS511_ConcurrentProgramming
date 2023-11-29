int turn = 1;
bool wantP = false;
bool wantQ = false;
int cs=0;

active proctype P() {
    do
        ::  wantP = true;
            do
                ::  wantQ ->
                    if
                    ::  turn == 2 ->
                        wantP = false
                        do
                            ::  turn == 1 -> break
                            ::  else -> skip
                        od;
                    ::  else -> skip
                    fi
                :: else -> break
            od;
            cs++;
            assert (cs == 1);
            cs--;
            turn = 2;
            wantP = false
    od
}

active proctype Q() {
    do
        ::  wantQ = true;
            do
                ::  wantP ->
                    if
                    ::  turn == 1 ->
                        wantQ = false
                        do
                            ::  turn == 2 -> break
                            ::  else -> skip
                        od;
                    ::  else -> skip
                    fi
                :: else -> break
            od;
            cs++;
            assert (cs == 1);
            cs--;
            turn = 1;
            wantQ = false
    od
}
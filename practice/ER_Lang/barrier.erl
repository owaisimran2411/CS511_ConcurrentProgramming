-module(barrier).
-compile(export_all).
-compile(nowarn_export_all).

mk_barrier(N) ->
    spawn(?MODULE,coord,[N,0,[]]).

%% coord(N,M,L)
%% N is the size of the barrier
%% M is the number of processes that have YET to reach the barrier
%% L is the PID of those threads that have ALREADY reached the barrier

coord(N,0,L) ->
    implement;
coord(N,M,L) when M>0 ->
    implement.

reached(B) ->
    B!{self()},
    receive
	{ok} ->
	    ok
    end.


    

    

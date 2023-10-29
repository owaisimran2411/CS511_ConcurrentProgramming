%% Simple examples of recursion on lists
%% 25 Oct 2023

-module(ml).
-compile(export_all).
-compile(nowarn_export_all).

fact(0) ->
    1;
fact(N) when N>0 ->
    N*fact(N-1).

sizel([]) ->
    0;
sizel([_H|T]) ->
    1+sizel(T).

suml([]) ->
    0;
suml([H|T]) ->
    H + suml(T).

sumltr([],A) ->
    A;
sumltr([H|T],A) ->
    sumltr(T,H+A).

rev([]) ->
    [];
rev([H|T]) ->
    rev(T) ++ [H].

mapl(_F,[]) ->
    [];
mapl(F,[H|T]) ->
    [F(H)|mapl(F,T)].

foldr(A,_F,[]) ->
    A;
foldr(A,F,[H|T]) ->
    F(H,foldr(A,F,T)).






-module(q5).
-compile(export_all).
-compile(nowarn_export_all).

% HELPER METHODS

diff(Val1, Val2) ->
    Val2 - Val1.

% QUESTION REQUIREMENTS

mult(Num1, Num2) ->
    Num1 * Num2.

double(Num1) -> 
    mult(Num1, 2).

distance({A,B}, {C,D}) ->
    math:sqrt(mult(diff(A,C), diff(A,C))+mult(diff(B,D), diff(B,D))).

my_and(A, B) ->
    Res = if
        A == 1 andalso B == 1 -> "True";
        true -> "False"
    end,
    Res.

my_or(A, B) ->
    Res = if
        A == 1 orelse B == 1 -> "True";
        true -> "False"
    end,
    Res.

my_not(A) ->
    Res = if
        A == 1 -> 0;
        true -> 1
    end,
    Res.
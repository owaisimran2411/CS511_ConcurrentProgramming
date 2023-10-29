-module(q6).
-compile(export_all).
-compile(nowarn_export_all).

fibonacci(0) ->
    0;
fibonacci(1) ->
    1;
fibonacci(N) when N > 1 ->
    fibonacciTR(N, 0, 1).

fibonacciTR(2, A, B) ->
    A+B;

fibonacciTR(N, A, B) ->
    fibonacciTR(N-1, B, A+B).
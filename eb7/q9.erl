-module(q9).
-compile(export_all).
-compile(nowarn_export_all).

map([], _N) ->
    [];
map([H|T], N) ->
    [H+N|map(T, N)].

filter([], _N) ->
    [];
filter([H|T], N) ->
    Res = if
        H /= N -> [H] ++ filter(T, N);
        true -> filter(T,N)
    end,
    Res.

fold([], "*") ->
    1;
fold([], _Op) ->
    0;
fold([H|T], _Op) ->
    Res = if
        _Op == "+" -> H + fold(T, _Op);
        _Op == "-" -> H - fold(T, _Op);
        _Op == "*" -> H * fold(T, _Op);
        true -> []
    end,
    Res.

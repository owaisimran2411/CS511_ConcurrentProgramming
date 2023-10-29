-module(q7).
-compile(export_all).
-compile(nowarn_export_all).

% HELPER METHODS
maxHelper([], Max) ->
    Max;
maxHelper([H|T], Max) ->
    Res = if
        Max > H -> maxHelper(T, Max);
        true -> maxHelper(T, H)
    end,
    Res.

% QUESTION REQUIREMENTS
sum([]) ->
    0;
sum([H|T]) ->
    H + sum(T).

maximum([H|T]) ->
    maxHelper([H|T], 0).

zip([], []) ->
    [];
zip([LH|LT], []) ->
    [LH|LT];
zip([], [RH|RT]) ->
    [RH|RT];
zip([LH|LT], [RH|RT]) ->
    [{LH, RH}, zip(LT, RT)].

% append([],[]) ->
%     [];
append([], List) ->
    List;
append([LH|LT], List) ->
    [LH|append(LT, List)].

reverse([]) ->
    [];
reverse([LH|LT]) ->
    append(reverse(LT), [LH]).


evenL([]) ->
    [];
evenL([LH|LT]) ->
    if
        LH rem 2 == 0 -> append([LH], evenL(LT));
        true -> append([], evenL(LT))
    end.

take([], _N) ->
    [];
take([LH|LT], N) ->
    Res = if
        N > 0 -> append([LH], take(LT, N-1));
        true -> []
    end,
    Res.

drop([], _N) ->
    [];
drop([LH|LT], N) ->
    Res = if
        N > 0 -> append([], drop(LT, N-1));
        true -> [LH|LT]
    end,
    Res.


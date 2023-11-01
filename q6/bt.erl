% NAME: MUHAMMAD OWAIS IMRAN
% QUIZ: 6

-module(bt).
-compile(export_all).
-compile(nowarn_export_all).

-type btree() :: {empty}
	      |  {node,number(),btree(),btree()}.

-spec t1() -> btree().
t1() ->
    {node,1,
     {node,2,{empty},{empty}},
     {node,3,{empty},{empty}}}.

-spec t2() -> btree().
t2() ->
    {node,4,
     {node,2,{empty},{empty}},
     {node,12,
      {empty},
      {node,7,{empty},{empty}}}}.

-spec t3() -> btree().
t3() ->
    {node,4,
     {node,2,{empty},{empty}},
     {node,12,
      {node,7,{empty},{empty}},
      {empty}}}.

t4() ->
    {empty}.
% -spec maxbt(btree()) -> number().

findMax([], _Max) ->
    _Max;
findMax([H|T], _Max) ->
    if
        _Max < H -> findMax(T, H);
        true -> findMax(T, _Max)
    end.

findMin([], _Min) -> 
    _Min;
findMin([H|T], _Min) ->
    if
        _Min > H -> findMin(T, H);
        true -> findMin(T, _Min)
    end.

%% implement


leaves({empty}) ->
    [];
leaves({node,D, _LT ,_RT}) ->
    [D | leaves(_LT) ++ leaves(_RT)].

maxbt({empty}) ->
    throw(empty_tree);
maxbt({node, D, LT, RT}) ->
    FlatTree = leaves({node, D, LT, RT}),
    findMax(FlatTree, D).

minbt({empty}) ->
    throw(empty_tree);
minbt({node, D, LT, RT}) ->
    FlatTree = leaves({node, D, LT, RT}),
    findMin(FlatTree, D).

isbst({node, D, LT, RT}) ->
    Max = maxbt(LT),
    Min = minbt(RT),
    if 
        Max < D andalso Min > D -> true;
        true -> false
    end.


% -spec isbst(btree()) -> boolean().

%% implement

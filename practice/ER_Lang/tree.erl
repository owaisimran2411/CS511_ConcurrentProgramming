%% Simple examples of recursion on binary trees
%% 25 Oct 2023

-module(tree).
-compile(export_all).
-compile(nowarn_export_all).
-author("E.B").

%% {empty} empty tree
%% {node,Data,LT,RT} non-empty tree

  %%   12
  %%  /  \
  %% 7   24
  %%    /
  %%   10

t1() ->
    {node,12,
     {node,7,{empty},{empty}},
     {node,24,
      {node,10,{empty},{empty}},
      {empty}}}.

sizet({empty}) ->
    0;
sizet({node,_D,LT,RT}) ->
    1+sizet(LT)+sizet(RT).

mirror({empty}) ->
    {empty};
mirror({node,D,LT,RT}) ->
    {node,D,mirror(RT),mirror(LT)}.

mapt(_F,{empty}) ->
    {empty};
mapt(F,{node,D,LT,RT}) ->
    {node,F(D),mapt(F,LT),mapt(F,RT)}.

%% Digression: any recursive function can be transformed to an equivalent tail recursive one
%% We use CPS technique (Continuation Passing Style).
%% Here is an example.

%% mapt(_F,{empty},K) ->
%%     K({empty});
%% mapt(F,{node,D,LT,RT},K) ->
%%     mapt(F,RT,fun (R) -> mapt(F,LT,fun (L) -> K({node,F(D),L,R}) end) end). 


foldt(A,_F,{empty}) ->
    A;
foldt(A,F,{node,D,LT,RT}) ->
    F(D,foldt(A,F,LT),foldt(A,F,RT)).

leaves({empty}) ->
    [];
leaves({node,D,{empty},{empty}}) ->
    [D];
leaves({node,_D,LT,RT}) ->
    leaves(LT) ++ leaves(RT).







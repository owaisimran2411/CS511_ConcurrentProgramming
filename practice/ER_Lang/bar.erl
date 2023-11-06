-module(bar).
-compile(export_all).
-compile(nowarn_export_all).

start(P, J) ->
    S=spawn(?MODULE, server, [0,0]),
    [spawn(?MODULE, patriots, [S]) || _ <- lists:seq(1, P)],
    [spawn(?MODULE, jets, [S]) || _ <- lists:seq(1, J)],
    spawn(?MODULE, timer, [S]).


timer(S) ->
    timer:sleep(1000),
    S!{itGotLate}.

patriots(S) ->
    S!{patriots}.

jets(S) ->
    S!{self(), jets},
    receive
        {ok} ->
            ok
    end.
    % error(not_implemented).

flush_notify() ->
    receive
        {From, jets} -> 
            From!{ok},
            flush_notify()
    after 0 ->
        ok
    end.

server(Delta, false) ->
    receive
        {patriots} -> server(Delta+1, false);
        {From,jets} when Delta > 1 -> 
            From!{ok},
            server(Delta-2, false);
        {itGotLate} ->
            flush_notify(),
            server(Delta, true)
    end;

server(Delta, true) ->
    receive
        {From,jets} -> 
            From!{ok},
            server(Delta, true);
        {patriots} -> 
            server(Delta, true)
    end.
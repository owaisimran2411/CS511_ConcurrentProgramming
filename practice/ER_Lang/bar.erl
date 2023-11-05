-module(bar).
-compile(export_all).
-compile(nowarn_export_all).

start(P, J) ->
    S=spawn(?MODULE, server, [0,0]),
    [spawn(?MODULE, patriots, [S]) || _ <- lists(seq(1, P))],
    [spawn(?MODULE, patriots, [J]) || _ <- lists(seq(1, J))].


patriots(S) ->
    S!{patriots}

jets(S) ->
    S!{self(), jets},
    receive
        {ok} ->
            ok
    end.
    % error(not_implemented).

server(Delta) ->
    receive
        {patriots} -> server(Delta+1);
        {From,jets} when Delta > 1 -> 
            From!{ok},
            server(Delta-2)
    end.
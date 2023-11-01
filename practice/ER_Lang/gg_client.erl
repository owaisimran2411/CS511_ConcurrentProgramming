-module(ggclient).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    spawn(?MODULE, client_loop, [S]).

client_loop(S) -> 
    S!{self(), start},
    receive
        {ok, SL} ->
            client_loop_sl(SL, rand:uniform(100))
    end.

client_loop_sl(Sl, N) ->
    Sl!{self(), guess, N},
    receive
        {gotIt} ->
            io:format("~p got it\n", [self()]);
        {tryAgain} ->
            client_loop_sl(Sl, rand:uniform(100))
    end.
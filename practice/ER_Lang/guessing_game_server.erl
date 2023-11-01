-module(gg).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    spawn(?MODULE, server_loop, []).

server_loop() ->
    receive
        {From, start} ->
            Sl = spawn(?MODULE, servlet_loop, [From, rand:uniform(100)]),
            From!{ok, Sl},
            server_loop()
    end.


servlet_loop(Cl, N) ->
    receive
        {From, guess, M} when M==N ->
            From!{gotIt};
        {From, guess, M} when M/=N ->
            From!{tryAgain},
            servlet_loop(Cl, N)
    end.
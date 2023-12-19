-module(filem).
-compile(export_all).
-compile(nowarn_export_all).


start() ->
    S = spawn(?MODULE, server, [0]),
    [ spawn(?MODULE, client, [S]) || _ <- lists:seq(1,100000)].

client(S) ->
    

server(State) ->
    receive
        {From, continue} ->
            server(State+1);
        {From, counter} ->
            io:format("Server has received ~p messaged till now.. Resetting this count to 0", [State]),
            server(0)
    end.
    
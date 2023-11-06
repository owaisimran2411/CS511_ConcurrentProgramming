-module(pc).
-compile(nowarn_export_all).
-compile(export_all).

start(N, P, C) ->
    B = spawn(?MODULE, buffer, [N, 0, 0, 0]),
    [ spawn(?MODULE, producer, [B]) || _ <- lists:seq(1, P)],
    [ spawn(?MODULE, consumer, [B]) || _ <- lists:seq(1, C)].

% buffer(N, Oc, PSP, CSC) ->
    % N = size of buffer
    % Oc = occupied slots of buffer
    % PSP = number of producers who are producing
    % CSC = number of consumers who are consuming

buffer(N, Oc, PSP, CSC) ->
    receive
        {From, start_producing} when Oc+PSP < N ->
            From!{ok},
            buffer(N, Oc, PSP+1, CSC);
            % doSomething;
        {From, start_consuming} when Oc-CSC > 0 ->
            From!{ok},
            buffer(N, Oc, PSP, CSC+1);
            % doSomething;
        {stop_producing} when PSP > 0 ->
            buffer(N, Oc+1, PSP-1, CSC);
            % doSomething;
        {stop_consuming} when CSC > 0->
            buffer(N, Oc-1, PSP, CSC-1)
            % doSomething
    end.

producer(B) ->
    B!{self(), start_producing},
    receive
        {ok} ->
            ok
    end,
    B!{stop_producing}.

consumer(B) ->
    B!{self(), start_consuming},
    receive
        {ok} ->
            ok
    end,
    B!{stop_consuming}.
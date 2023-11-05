-module(barrier).
-compile(export_all).
-compile(nowarn_export_all).

mk_barrier(N) ->
    spawn(?MODULE, coord, [N, N, []]).

% coord(N, M, L)
% N is the size of barrier
% M is the number of threads YET to arrive
% L is a list of the PIDS of the thread that have already arrived


coord(N, 0, L) ->
    % error(implement);   % notify all PIDS in L and then restart the barrier
    [PID!{ok} || PID <- L],
    coord(N, N, []);
coord(N, M, L) when M>0 ->
    % error(implement); % wait for new thread and records its pid in the list
    receive
        {PID} ->
            coord(N, M-1, [PID|L])
    end.

reached(B) ->
    B!{self()},
    receive
        {ok} ->
            ok
    end.
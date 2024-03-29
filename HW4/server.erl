-module(server).

-export([start_server/0]).

-include_lib("./defs.hrl").

-spec start_server() -> _.
-spec loop(_State) -> _.
-spec do_join(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_leave(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_new_nick(_State, _Ref, _ClientPID, _NewNick) -> _.
-spec do_client_quit(_State, _Ref, _ClientPID) -> _NewState.

start_server() ->
    catch(unregister(server)),
    register(server, self()),
    case whereis(testsuite) of
	undefined -> ok;
	TestSuitePID -> TestSuitePID!{server_up, self()}
    end,
    loop(
      #serv_st{
	 nicks = maps:new(), %% nickname map. client_pid => "nickname"
	 registrations = maps:new(), %% registration map. "chat_name" => [client_pids]
	 chatrooms = maps:new() %% chatroom map. "chat_name" => chat_pid
	}
     ).

loop(State) ->
    receive 
	%% initial connection
	{ClientPID, connect, ClientNick} ->
	    NewState =
		#serv_st{
		   nicks = maps:put(ClientPID, ClientNick, State#serv_st.nicks),
		   registrations = State#serv_st.registrations,
		   chatrooms = State#serv_st.chatrooms
		  },
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, join, ChatName} ->
	    NewState = do_join(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, leave, ChatName} ->
	    NewState = do_leave(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to register a new nickname
	{ClientPID, Ref, nick, NewNick} ->
	    NewState = do_new_nick(State, Ref, ClientPID, NewNick),
	    loop(NewState);
	%% client requests to quit
	{ClientPID, Ref, quit} ->
	    NewState = do_client_quit(State, Ref, ClientPID),
	    loop(NewState);
	{TEST_PID, get_state} ->
	    TEST_PID!{get_state, State},
	    loop(State)
    end.

%% executes join protocol from server perspective
do_join(ChatName, ClientPID, Ref, State) ->
	CurrentChatrooms = State#serv_st.chatrooms,
	case maps:get(ChatName, CurrentChatrooms, ChatName) of
		ChatName ->
			ChatroomPID = spawn(chatroom, start_chatroom, [ChatName]),
			UpdatedState = State#serv_st{chatrooms = maps:put(ChatName, ChatroomPID, CurrentChatrooms), registrations = maps:put(ChatName, [], State#serv_st.registrations)},
			do_join(ChatName, ClientPID, Ref, UpdatedState);
		ChatroomPid ->
			ClientNickname = maps:get(ClientPID, State#serv_st.nicks),
			ChatroomPid ! {self(), Ref, register, ClientPID, ClientNickname},
			Registrations = State#serv_st.registrations,
			State#serv_st{registrations=maps:put(ChatName, maps:get(ChatName, Registrations) ++ [ClientPID], Registrations)}
    end.
	% io:format("server:do_join(...): IMPLEMENT ME~n"),
    % State.

%% executes leave protocol from server perspective
do_leave(ChatName, ClientPID, Ref, State) ->
	CurrentChatrooms = State#serv_st.chatrooms,
	ChatPID = maps:get(ChatName, CurrentChatrooms),
	CurrentRegistration = State#serv_st.registrations,
	UpdatedChatClientState = State#serv_st{registrations = maps:update(ChatName, lists:delete(ClientPID, maps:get(ChatName, CurrentRegistration)), CurrentRegistration)},
	ChatPID ! {self(), Ref, unregister, ClientPID},
	ClientPID ! {self(), Ref, ack_leave},
	UpdatedChatClientState.
    % io:format("server:do_leave(...): IMPLEMENT ME~n"),
    % State.

%% executes new nickname protocol from server perspective
helper_nicknames(State, Ref, ClientPID, NewNick, Chatroom) ->
	case maps:find(Chatroom, State#serv_st.registrations) of 
        {ok, ClientPIDs} -> 
            case lists:any(fun(X) -> X == ClientPID end, ClientPIDs) of 
                true -> case maps:find(Chatroom, State#serv_st.chatrooms) of 
                            {ok, ChatroomPID} -> ChatroomPID!{self(), Ref, update_nick, ClientPID, NewNick}
                        end;
                false -> pass
            end
    end.
do_new_nick(State, Ref, ClientPID, NewNick) ->
	CurrentNickNames = maps:values(State#serv_st.nicks),
	case lists:any(fun(N) -> N == NewNick end, CurrentNickNames) of
		false ->
			UpdatedServState = State#serv_st{nicks = maps:update(ClientPID, NewNick, State#serv_st.nicks)},
			CurrentChatRooms = maps:keys(State#serv_st.chatrooms),
			lists:map(fun(X) -> helper_nicknames(State, Ref, ClientPID, NewNick, X) end, CurrentChatRooms),
			ClientPID!{self(), Ref, ok_nick};
		true -> 
			ClientPID!{self(), Ref, err_nick_used},
			UpdatedServState = State
	end,
	UpdatedServState.

    % io:format("server:do_new_nick(...): IMPLEMENT ME~n"),
    % State.

%% executes client quit protocol from server perspective
helper_quit(State, Ref, ClientPID, Chatroom) ->
	 case maps:find(Chatroom, State#serv_st.registrations) of 
        {ok, ClientPIDs} -> 
            case lists:any(fun(X) -> X == ClientPID end, ClientPIDs) of 
                true -> case maps:find(Chatroom, State#serv_st.chatrooms) of 
                            {ok, ChatroomPID} -> ChatroomPID!{self(), Ref, unregister, ClientPID}
                        end;
                false -> pass
            end
    end.
do_client_quit(State, Ref, ClientPID) ->
	UpdatedNicknames = maps:remove(ClientPID, State#serv_st.nicks),
	CurrentRegistrations = State#serv_st.registrations,
	CurrentChatrooms = maps:keys(State#serv_st.chatrooms),
	UpdatedRegistrations = maps:map(
			fun(X, Y) when is_list(X) ->
				lists:delete(ClientPID, Y) end, CurrentRegistrations
		),
	lists:map(
			fun(X) ->
				helper_quit(State, Ref, ClientPID, X) end, CurrentChatrooms
		),
	ClientPID!{self(), Ref, ack_quit},
	State#serv_st{registrations = UpdatedRegistrations, nicks = UpdatedNicknames}.
    % io:format("server:do_client_quit(...): IMPLEMENT ME~n"),
    % State.

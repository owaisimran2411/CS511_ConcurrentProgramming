-module(shipping).
-compile(export_all).
-compile(nowarn_export_all).
-include_lib("./shipping.hrl").

% Helper Methods
iterateOverShips([], _ShipID) ->
    throw(error);
iterateOverShips([ShipListHead|ShipListTail], ShipID) -> 
    Res = if
        ShipListHead#ship.id == ShipID -> ShipListHead;
        true -> iterateOverShips(ShipListTail, ShipID)
    end,
    Res.

iterateOverContainers([], _ContainerID) -> 
    throw(error);
iterateOverContainers([ContainersListHead|ContainersListTail], ContainerID) ->
    Res = if
        ContainersListHead#container.id == ContainerID -> ContainersListHead;
        true -> iterateOverContainers(ContainersListTail, ContainerID)
    end,
    Res.

iterateOverPorts([], _PortID) -> 
    throw(error);
iterateOverPorts([PortsListHead|PortsListTail], PortID) ->
    Res = if
        PortsListHead#port.id == PortID -> PortsListHead;
        true -> iterateOverPorts(PortsListTail, PortID)
    end,
    Res.

occupiedDockSearch([], _PortID) ->
    [];
occupiedDockSearch([{P_ID, D_ID, _S_ID}|LocationsTail], PortID) ->
    Res = if
        P_ID == PortID -> [D_ID] ++ occupiedDockSearch(LocationsTail, PortID);
        true -> occupiedDockSearch(LocationsTail, PortID)
    end,
    Res.

shipDockSearch([], _ShipID) ->
    throw(err);
shipDockSearch([{P_ID, D_ID, S_ID}|LocationsTail], ShipID) ->
    Res = if
        S_ID == ShipID -> {P_ID, D_ID};
        true -> shipDockSearch(LocationsTail, ShipID)
    end,
    Res.

sumOfContainerWeights([], _ContainersList) ->
    0;
sumOfContainerWeights([ContainerListHead|ContainerListTail], ContainersList) ->
    Res = iterateOverContainers(ContainersList, ContainerListHead), 
    Res#container.weight + sumOfContainerWeights(ContainerListTail, ContainersList).

throwException(Error) ->
    throw(Error).

searchShipPortNumber([], _ShipID) ->
    throwException(error);
searchShipPortNumber([{P_ID, _D_ID, S_ID}|T], ShipID) -> 
    if
        S_ID /= ShipID -> searchShipPortNumber(T, ShipID);
        true -> P_ID
    end.

listLength([]) -> 
    0;
listLength([_H|T]) ->
    1+listLength(T).

listSearch([], _Value) ->
    throwException(error);
listSearch([H|T], Value) ->
    if
        H /= Value -> listSearch(T, Value);
        true -> H
    end.

listSearchV([], _Value) ->
    throwException(error);
listSearchV([H|T], Value) ->
    if
        H == Value -> listSearch(T, Value);
        true -> H
    end.

updateKey(Key, NewValue, Map) ->
    UpdatedMap = maps:put(Key, NewValue, Map),
    UpdatedMap.

updateShipRecord(ShippingState, {NPInv, NSInv}) ->
    #shipping_state{ships=ShippingState#shipping_state.ships, containers=ShippingState#shipping_state.containers, ports = ShippingState#shipping_state.ports, ship_locations = ShippingState#shipping_state.ship_locations, ship_inventory = NSInv, port_inventory = NPInv}.

containerPortValidation([], _ShipPortNumber, _PortContainerList) ->
    0;
containerPortValidation([H|T], ShipPortNumber, PortContainerList) ->
    listSearch(PortContainerList, H),
    containerPortValidation(T, ShipPortNumber, PortContainerList).
    
newAndPreLoadValidation([], _PreExistingContainers) ->
    0;
newAndPreLoadValidation([H|T], PreExistingContainers) ->
    listSearchV(PreExistingContainers, H),
    newAndPreLoadValidation(T, PreExistingContainers).

% Assignment Questions
get_ship(Shipping_State, Ship_ID) ->
    Res = iterateOverShips(Shipping_State#shipping_state.ships, Ship_ID),
    Res.
    % io:format("Implement me!!"),
    % error.

get_container(Shipping_State, Container_ID) ->
    Res = iterateOverContainers(Shipping_State#shipping_state.containers, Container_ID),
    Res.
    % io:format("Implement me!!"),
    % error.

get_port(Shipping_State, Port_ID) ->
    Res = iterateOverPorts(Shipping_State#shipping_state.ports, Port_ID),
    Res.
    % io:format("Implement me!!"),
    % error.

get_occupied_docks(Shipping_State, Port_ID) ->
    occupiedDockSearch(Shipping_State#shipping_state.ship_locations, Port_ID).
    % io:format("Implement me!!"),
    % error.

get_ship_location(Shipping_State, Ship_ID) ->
    shipDockSearch(Shipping_State#shipping_state.ship_locations, Ship_ID).
    % io:format("Implement me!!"),
    % error.

get_container_weight(Shipping_State, Container_IDs) ->
    sumOfContainerWeights(Container_IDs, Shipping_State#shipping_state.containers).
    % io:format("Implement me!!"),
    % error.

get_ship_weight(Shipping_State, Ship_ID) ->
    _Res = get_ship(Shipping_State, Ship_ID),
    get_container_weight(Shipping_State, maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory)).
    % io:format("Implement me!!"),
    % error.

load_ship(Shipping_State, Ship_ID, Container_IDs) ->
    % 1. Containers to be loaded and ship port must be same
    ShipPortNumber = searchShipPortNumber(Shipping_State#shipping_state.ship_locations, Ship_ID),
    containerPortValidation(Container_IDs, ShipPortNumber, maps:get(ShipPortNumber, Shipping_State#shipping_state.port_inventory)),
    % 2. Ship ID should exist
    ShipData = get_ship(Shipping_State, Ship_ID),
    % 3. Ship should not overload
    NCL = listLength(Container_IDs),
    ECL = listLength(maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory)),
    if 
        NCL + ECL - 1 > ShipData#ship.container_cap -> throwException(error);
        true -> ok
    end,
    % 4. Container should not be pre loaded onto the ship
    newAndPreLoadValidation(Container_IDs, maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory)),

    % creating a new shipping state object to return
    % 1. update ship_location key in shipping_state record
    % 2. update port_inventory in shipping_stae record
    _NewPortInventory = maps:get(ShipPortNumber, Shipping_State#shipping_state.port_inventory) -- Container_IDs,
    _UpdatePortInventoryMap = updateKey(ShipPortNumber, _NewPortInventory, Shipping_State#shipping_state.port_inventory),
    _NewShipInventory = maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory) ++ Container_IDs,
    _UpdateShipInventoryMap = updateKey(ShipPortNumber, _NewShipInventory, Shipping_State#shipping_state.ship_inventory),
    updateShipRecord(Shipping_State, {_UpdatePortInventoryMap, _UpdateShipInventoryMap}).



    % updating the record

    % io:format("Implement me!!"),
    % error.

unload_ship_all(Shipping_State, Ship_ID) ->
    ShipPortNumber = searchShipPortNumber(Shipping_State#shipping_state.ship_locations, Ship_ID),
    PortContainerMaxCap = get_port(Shipping_State, ShipPortNumber),
    ShipContainers = maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory),
    CurrentPortInventory = maps:get(ShipPortNumber, Shipping_State#shipping_state.port_inventory),
    ShipContainersCount = listLength(ShipContainers),
    PortContainersCount = listLength(CurrentPortInventory),

    if
        ShipContainersCount + PortContainersCount < PortContainerMaxCap#port.container_cap + 1 -> ok;
        true -> throw(error)
    end,

    _NewPortInventory = CurrentPortInventory ++ ShipContainers,
    _UpdatePortInventoryMap = updateKey(ShipPortNumber, _NewPortInventory, Shipping_State#shipping_state.port_inventory),
    _UpdateShipInventoryMap = updateKey(Ship_ID, [], Shipping_State#shipping_state.ship_inventory),
    updateShipRecord(Shipping_State, {_UpdatePortInventoryMap, _UpdateShipInventoryMap}).
    % io:format("Implement me!!"),
    % error.

% unload_ship(Shipping_State, Ship_ID, Container_IDs) ->
%     io:format("Implement me!!"),
%     error.

% set_sail(Shipping_State, Ship_ID, {Port_ID, Dock}) ->
%     io:format("Implement me!!"),
%     error.




%% Determines whether all of the elements of Sub_List are also elements of Target_List
%% @returns true is all elements of Sub_List are members of Target_List; false otherwise
is_sublist(Target_List, Sub_List) ->
    lists:all(fun (Elem) -> lists:member(Elem, Target_List) end, Sub_List).




%% Prints out the current shipping state in a more friendly format
print_state(Shipping_State) ->
    io:format("--Ships--~n"),
    _ = print_ships(Shipping_State#shipping_state.ships, Shipping_State#shipping_state.ship_locations, Shipping_State#shipping_state.ship_inventory, Shipping_State#shipping_state.ports),
    io:format("--Ports--~n"),
    _ = print_ports(Shipping_State#shipping_state.ports, Shipping_State#shipping_state.port_inventory).


%% helper function for print_ships
get_port_helper([], _Port_ID) -> error;
get_port_helper([ Port = #port{id = Port_ID} | _ ], Port_ID) -> Port;
get_port_helper( [_ | Other_Ports ], Port_ID) -> get_port_helper(Other_Ports, Port_ID).


print_ships(Ships, Locations, Inventory, Ports) ->
    case Ships of
        [] ->
            ok;
        [Ship | Other_Ships] ->
            {Port_ID, Dock_ID, _} = lists:keyfind(Ship#ship.id, 3, Locations),
            Port = get_port_helper(Ports, Port_ID),
            {ok, Ship_Inventory} = maps:find(Ship#ship.id, Inventory),
            io:format("Name: ~s(#~w)    Location: Port ~s, Dock ~s    Inventory: ~w~n", [Ship#ship.name, Ship#ship.id, Port#port.name, Dock_ID, Ship_Inventory]),
            print_ships(Other_Ships, Locations, Inventory, Ports)
    end.

print_containers(Containers) ->
    io:format("~w~n", [Containers]).

print_ports(Ports, Inventory) ->
    case Ports of
        [] ->
            ok;
        [Port | Other_Ports] ->
            {ok, Port_Inventory} = maps:find(Port#port.id, Inventory),
            io:format("Name: ~s(#~w)    Docks: ~w    Inventory: ~w~n", [Port#port.name, Port#port.id, Port#port.docks, Port_Inventory]),
            print_ports(Other_Ports, Inventory)
    end.
%% This functions sets up an initial state for this shipping simulation. You can add, remove, or modidfy any of this content. This is provided to you to save some time.
%% @returns {ok, shipping_state} where shipping_state is a shipping_state record with all the initial content.
shipco() ->
    Ships = [#ship{id=1,name="Santa Maria",container_cap=20},
              #ship{id=2,name="Nina",container_cap=20},
              #ship{id=3,name="Pinta",container_cap=20},
              #ship{id=4,name="SS Minnow",container_cap=20},
              #ship{id=5,name="Sir Leaks-A-Lot",container_cap=20}
             ],
    Containers = [
                  #container{id=1,weight=200},
                  #container{id=2,weight=215},
                  #container{id=3,weight=131},
                  #container{id=4,weight=62},
                  #container{id=5,weight=112},
                  #container{id=6,weight=217},
                  #container{id=7,weight=61},
                  #container{id=8,weight=99},
                  #container{id=9,weight=82},
                  #container{id=10,weight=185},
                  #container{id=11,weight=282},
                  #container{id=12,weight=312},
                  #container{id=13,weight=283},
                  #container{id=14,weight=331},
                  #container{id=15,weight=136},
                  #container{id=16,weight=200},
                  #container{id=17,weight=215},
                  #container{id=18,weight=131},
                  #container{id=19,weight=62},
                  #container{id=20,weight=112},
                  #container{id=21,weight=217},
                  #container{id=22,weight=61},
                  #container{id=23,weight=99},
                  #container{id=24,weight=82},
                  #container{id=25,weight=185},
                  #container{id=26,weight=282},
                  #container{id=27,weight=312},
                  #container{id=28,weight=283},
                  #container{id=29,weight=331},
                  #container{id=30,weight=136}
                 ],
    Ports = [
             #port{
                id=1,
                name="New York",
                docks=['A','B','C','D'],
                container_cap=200
               },
             #port{
                id=2,
                name="San Francisco",
                docks=['A','B','C','D'],
                container_cap=200
               },
             #port{
                id=3,
                name="Miami",
                docks=['A','B','C','D'],
                container_cap=200
               }
            ],
    %% {port, dock, ship}
    Locations = [
                 {1,'B',1},
                 {1, 'A', 3},
                 {3, 'C', 2},
                 {2, 'D', 4},
                 {2, 'B', 5}
                ],
    Ship_Inventory = #{
      1=>[14,15,9,2,6],
      2=>[1,3,4,13],
      3=>[],
      4=>[2,8,11,7],
      5=>[5,10,12]},
    Port_Inventory = #{
      1=>[16,17,18,19,20],
      2=>[21,22,23,24,25],
      3=>[26,27,28,29,30]
     },
    #shipping_state{ships = Ships, containers = Containers, ports = Ports, ship_locations = Locations, ship_inventory = Ship_Inventory, port_inventory = Port_Inventory}.

-module(q11).
-compile(export_all).
-compile(nowarn_export_all).

% {node, val, [subtree1, subtree2, subtree3, ...., subtreen] }
gt() -> 
    {node, 10, [
        {node, 2, [
            {node, 13, [{empty}, {empty}, {empty}]}
            ], {empty}, {empty}},
        {node, 5, [
            {node, 15, [{empty}, {empty}, {empty}]}
            ], {empty}, {empty}},
        {node, 18, [
            {node, 22, [{
                node, 9, [{empty}, {empty}, {empty}]
                }]},
            {node, 3, [{empty}, {empty}, {empty}]},
            {node, 6, [{empty}, {empty}, {empty}]}
            ]}
                ]
    }.

mapTree(_F, {empty}) ->
    {empty};
% mapTree(_F, {node, Data, []}) ->
%     {_F(Data)};
mapTree(_F, {node, Data, [H|T]}) ->
    {node, _F(Data), mapTree(_F, H), mapTree(_F, T)}.

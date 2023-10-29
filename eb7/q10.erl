-module(q10).
-compile(export_all).
-compile(nowarn_export_all).

tr() ->
    {
        node, 12,
            {
                node, 7, 
                {
                    node, 18, {empty}, {empty}
                }, {empty}
            },
            {
                node, 24,
                {
                    node, 10, {empty}, {empty}
                }, {node, 5, {empty}, {empty}}
            }
    }.

sumTree({empty}) ->
    0;
sumTree({node, D, LT, RT}) ->
    D+sumTree(LT)+sumTree(RT).

mapTree(Func, {empty}) ->
    0;
mapTree(Func, {node, D, LT, RT}) ->
    {node, Func(D), mapTree(Func, LT), mapTree(Func, RT)}.
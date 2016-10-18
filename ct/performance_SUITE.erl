%%%-------------------------------------------------------------------
%%% File        : performance_SUITE.erl
%%% Description : Test Suite for module: b_trees.
%%%
%%% Created     : 18.10.2016
%%%
%%% Copyright (C) 2016 Walter Weinmann
%%%-------------------------------------------------------------------
-module(performance_SUITE).

-compile(export_all).

-define(NODEBUG, true).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

-include_lib("../include/b_trees_templates.hrl").

-define(NUMBER_INSERTS, 2000).
-define(NUMBER_LOOKUPS, 10000).

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - SUITE
%%--------------------------------------------------------------------

suite() ->
    [
        {timetrap, {minutes, 10}}
    ].

init_per_suite(Config) ->
    [
        {gbtree, test_generator:generate_gb_tree_from_number(?NUMBER_INSERTS, 4)},
        {btree_5, test_generator:generate_b_tree_from_number(5, ?NUMBER_INSERTS, 4)},
        {btree_9, test_generator:generate_b_tree_till_number(9, ?NUMBER_INSERTS, 4)},
        {btree_17, test_generator:generate_b_tree_from_number(17, ?NUMBER_INSERTS, 4)},
        {btree_33, test_generator:generate_b_tree_till_number(33, ?NUMBER_INSERTS, 4)},
        {btree_65, test_generator:generate_b_tree_from_number(65, ?NUMBER_INSERTS, 4)},
        {btree_129, test_generator:generate_b_tree_till_number(129, ?NUMBER_INSERTS, 4)},
        {btree_257, test_generator:generate_b_tree_from_number(257, ?NUMBER_INSERTS, 4)},
        {btree_513, test_generator:generate_b_tree_from_number(513, ?NUMBER_INSERTS, 4)},
        {btree_1025, test_generator:generate_b_tree_from_number(1025, ?NUMBER_INSERTS, 4)},
        {lookUps, test_generator:generate_keys_rand(?NUMBER_INSERTS, ?NUMBER_LOOKUPS, 4)}
        | Config
    ].

end_per_suite(_Config) ->
    ok.

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - ALL
%%--------------------------------------------------------------------

all() ->
    [
        performance_insert_b_tree_order_5_test,
        performance_insert_b_tree_order_9_test,
        performance_insert_b_tree_order_17_test,
        performance_insert_b_tree_order_33_test,
        performance_insert_b_tree_order_65_test,
        performance_insert_b_tree_order_129_test,
        performance_insert_b_tree_order_257_test,
        performance_insert_b_tree_order_513_test,
        performance_insert_b_tree_order_1025_test,
        performance_insert_gb_tree_test,

        performance_is_defined_b_tree_order_5_test,
        performance_is_defined_b_tree_order_9_test,
        performance_is_defined_b_tree_order_17_test,
        performance_is_defined_b_tree_order_33_test,
        performance_is_defined_b_tree_order_65_test,
        performance_is_defined_b_tree_order_129_test,
        performance_is_defined_b_tree_order_257_test,
        performance_is_defined_b_tree_order_513_test,
        performance_is_defined_b_tree_order_1025_test,
        performance_is_defined_gb_tree_test,

        performance_keys_b_tree_order_5_test,
        performance_keys_b_tree_order_9_test,
        performance_keys_b_tree_order_17_test,
        performance_keys_b_tree_order_33_test,
        performance_keys_b_tree_order_65_test,
        performance_keys_b_tree_order_129_test,
        performance_keys_b_tree_order_257_test,
        performance_keys_b_tree_order_513_test,
        performance_keys_b_tree_order_1025_test,
        performance_keys_gb_tree_test,

        performance_lookup_b_tree_order_5_test,
        performance_lookup_b_tree_order_9_test,
        performance_lookup_b_tree_order_17_test,
        performance_lookup_b_tree_order_33_test,
        performance_lookup_b_tree_order_65_test,
        performance_lookup_b_tree_order_129_test,
        performance_lookup_b_tree_order_257_test,
        performance_lookup_b_tree_order_513_test,
        performance_lookup_b_tree_order_1025_test,
        performance_lookup_gb_tree_test
    ].

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 1025
%%--------------------------------------------------------------------

performance_insert_b_tree_order_1025_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(1025, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(1025 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 129
%%--------------------------------------------------------------------

performance_insert_b_tree_order_129_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(129, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(129 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 17
%%--------------------------------------------------------------------

performance_insert_b_tree_order_17_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(17, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(17 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 257
%%--------------------------------------------------------------------

performance_insert_b_tree_order_257_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(257, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(257 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 33
%%--------------------------------------------------------------------

performance_insert_b_tree_order_33_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(33, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(33 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 5
%%--------------------------------------------------------------------

performance_insert_b_tree_order_5_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(5, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(5 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 513
%%--------------------------------------------------------------------

performance_insert_b_tree_order_513_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(513, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(513 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 65
%%--------------------------------------------------------------------

performance_insert_b_tree_order_65_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(65, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(65 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert b_tree order 9
%%--------------------------------------------------------------------

performance_insert_b_tree_order_9_test(_Config) ->
    BTree = test_generator:generate_b_tree_from_number(9, ?NUMBER_INSERTS, 4),
    ?assert(b_trees:height(BTree) =< int_ceil((math:log((?NUMBER_INSERTS + 1) / 2) / math:log(9 div 2)))).

%%--------------------------------------------------------------------
%% TEST CASES: performance insert gb_tree
%%--------------------------------------------------------------------

performance_insert_gb_tree_test(_Config) ->
    test_generator:generate_gb_tree_from_number(?NUMBER_INSERTS, 4).

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 1025
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_1025_test(Config) ->
    BTree = ?config(btree_1025, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

is_defined_b_tree([], _) ->
    none;
is_defined_b_tree([Key | Tail], BTree) ->
    b_trees:is_defined(Key, BTree),
    is_defined_b_tree(Tail, BTree).

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 129
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_129_test(Config) ->
    BTree = ?config(btree_129, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 17
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_17_test(Config) ->
    BTree = ?config(btree_17, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 257
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_257_test(Config) ->
    BTree = ?config(btree_257, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 33
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_33_test(Config) ->
    BTree = ?config(btree_33, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 5
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_5_test(Config) ->
    BTree = ?config(btree_5, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 513
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_513_test(Config) ->
    BTree = ?config(btree_513, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 65
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_65_test(Config) ->
    BTree = ?config(btree_65, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined b_tree order 9
%%--------------------------------------------------------------------

performance_is_defined_b_tree_order_9_test(Config) ->
    BTree = ?config(btree_9, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance is_defined gb_tree
%%--------------------------------------------------------------------

performance_is_defined_gb_tree_test(Config) ->
    GBTree = ?config(gbtree, Config),
    LookUps = ?config(lookUps, Config),
    is_defined_gb_tree(LookUps, GBTree),
    ok.

is_defined_gb_tree([], _) ->
    none;
is_defined_gb_tree([Key | Tail], GBTree) ->
    gb_trees:is_defined(Key, GBTree),
    is_defined_gb_tree(Tail, GBTree).

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 1025
%%--------------------------------------------------------------------

performance_keys_b_tree_order_1025_test(Config) ->
    BTree = ?config(btree_1025, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 129
%%--------------------------------------------------------------------

performance_keys_b_tree_order_129_test(Config) ->
    BTree = ?config(btree_129, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 17
%%--------------------------------------------------------------------

performance_keys_b_tree_order_17_test(Config) ->
    BTree = ?config(btree_17, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 257
%%--------------------------------------------------------------------

performance_keys_b_tree_order_257_test(Config) ->
    BTree = ?config(btree_257, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 33
%%--------------------------------------------------------------------

performance_keys_b_tree_order_33_test(Config) ->
    BTree = ?config(btree_33, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 5
%%--------------------------------------------------------------------

performance_keys_b_tree_order_5_test(Config) ->
    BTree = ?config(btree_5, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 513
%%--------------------------------------------------------------------

performance_keys_b_tree_order_513_test(Config) ->
    BTree = ?config(btree_513, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 65
%%--------------------------------------------------------------------

performance_keys_b_tree_order_65_test(Config) ->
    BTree = ?config(btree_65, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys b_tree order 9
%%--------------------------------------------------------------------

performance_keys_b_tree_order_9_test(Config) ->
    BTree = ?config(btree_9, Config),
    Keys = b_trees:keys(BTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance keys gb_tree
%%--------------------------------------------------------------------

performance_keys_gb_tree_test(Config) ->
    GBTree = ?config(gbtree, Config),
    Keys = gb_trees:keys(GBTree),
    ?assertEqual(?NUMBER_INSERTS, length(Keys)),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 1025
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_1025_test(Config) ->
    BTree = ?config(btree_1025, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

lookup_b_tree([], _) ->
    none;
lookup_b_tree([Key | Tail], BTree) ->
    b_trees:lookup(Key, BTree),
    lookup_b_tree(Tail, BTree).

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 129
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_129_test(Config) ->
    BTree = ?config(btree_129, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 17
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_17_test(Config) ->
    BTree = ?config(btree_17, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 257
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_257_test(Config) ->
    BTree = ?config(btree_257, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 33
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_33_test(Config) ->
    BTree = ?config(btree_33, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 5
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_5_test(Config) ->
    BTree = ?config(btree_5, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 513
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_513_test(Config) ->
    BTree = ?config(btree_513, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 65
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_65_test(Config) ->
    BTree = ?config(btree_65, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup b_tree order 9
%%--------------------------------------------------------------------

performance_lookup_b_tree_order_9_test(Config) ->
    BTree = ?config(btree_9, Config),
    LookUps = ?config(lookUps, Config),
    lookup_b_tree(LookUps, BTree),
    ok.

%%--------------------------------------------------------------------
%% TEST CASES: performance lookup gb_tree
%%--------------------------------------------------------------------

performance_lookup_gb_tree_test(Config) ->
    GBTree = ?config(gbtree, Config),
    LookUps = ?config(lookUps, Config),
    lookup_gb_tree(LookUps, GBTree),
    ok.

lookup_gb_tree([], _) ->
    none;
lookup_gb_tree([Key | Tail], GBTree) ->
    gb_trees:lookup(Key, GBTree),
    lookup_gb_tree(Tail, GBTree).

%%--------------------------------------------------------------------
%% Helper functions.
%%--------------------------------------------------------------------

int_ceil(X) ->
    T = trunc(X),
    if
        X > T -> T + 1;
        true -> T
    end.

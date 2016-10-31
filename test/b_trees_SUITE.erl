%%%-------------------------------------------------------------------
%%% File        : b_trees_SUITE.erl
%%% Description : Test Suite for module: b_trees.
%%%
%%% Created     : 09.09.2016
%%%
%%% Copyright (C) 2016 Walter Weinmann
%%%-------------------------------------------------------------------

-module(b_trees_SUITE).

-compile(export_all).

-define(NODEBUG, true).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

-include_lib("../include/b_trees_templates.hrl").

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - SUITE
%%--------------------------------------------------------------------

suite() ->
    [
        {timetrap, {minutes, 10}}
    ].

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - ALL
%%--------------------------------------------------------------------

all() ->
    [
        delete_any_test,
        delete_b_tree_order_5_test,
        delete_clrs_test,
        delete_error_test,
        empty_b_star_tree_test,
        empty_b_tree_test,
        enter_b_tree_order_4_test,
        from_dict_b_star_tree_test,
        from_dict_b_tree_test,
        get_test,
        height_test,
        insert_b_tree_order_5_test,
        insert_b_tree_order_7_test,
        insert_b_tree_order_8_test,
        insert_clrs_test,
        insert_error_test,
        is_defined_test,
        is_empty_test,
        iterator_next_test,
        keys_test,
        largest_test,
        lookup_test,
        map_b_tree_order_4_test,
        map_error_test,
        number_key_values_test,
        size_test,
        smallest_test,
        take_largest_test,
        take_smallest_test,
        to_list_test,
        update_b_tree_order_4_test,
        update_error_test,
        values_test
    ].

%%--------------------------------------------------------------------
%% TEST CASES: delete_any
%%--------------------------------------------------------------------

delete_any_test(_Config) ->
    ?assertEqual(?B_TREE_05_00, b_trees:delete_any("k_00", ?B_TREE_05_00)),
    ?assertEqual(?B_TREE_05_00, b_trees:delete_any("k_01", ?B_TREE_05_01)),
    ?assertEqual(?B_TREE_05_01, b_trees:delete_any("k_00", ?B_TREE_05_01)),
    ?assertEqual(?B_TREE_05_03, b_trees:delete_any("k_04", ?B_TREE_05_04)),
    ?assertEqual(?B_TREE_05_06, b_trees:delete_any("k_07", ?B_TREE_05_07)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: delete - order 5
%%--------------------------------------------------------------------

delete_b_tree_order_5_test(_Config) ->
    ?assertEqual(?B_TREE_05_00, b_trees:delete("k_01", ?B_TREE_05_01)),

    ?assertEqual(?B_TREE_05_03, b_trees:delete("k_04", ?B_TREE_05_04)),

    ?assertEqual(?B_TREE_05_04, b_trees:delete("k_05", ?B_TREE_05_05)),
    ?assertEqual(?B_TREE_05_05_MINUS_01, b_trees:delete("k_01", ?B_TREE_05_05)),
    ?assertEqual(?B_TREE_05_05_MINUS_02, b_trees:delete("k_02", ?B_TREE_05_05)),
    ?assertEqual(?B_TREE_05_05_MINUS_03, b_trees:delete("k_03", ?B_TREE_05_05)),
    ?assertEqual(?B_TREE_05_05_MINUS_04, b_trees:delete("k_04", ?B_TREE_05_05)),

    ?assertEqual(?B_TREE_05_06, b_trees:delete("k_07", ?B_TREE_05_07)),

    ?assertEqual(?B_TREE_05_07, b_trees:delete("k_08", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_01, b_trees:delete("k_01", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_02, b_trees:delete("k_02", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_03, b_trees:delete("k_03", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_04, b_trees:delete("k_04", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_05, b_trees:delete("k_05", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_06, b_trees:delete("k_06", ?B_TREE_05_08)),
    ?assertEqual(?B_TREE_05_08_MINUS_07, b_trees:delete("k_07", ?B_TREE_05_08)),

    ?assertEqual(?B_TREE_05_08, b_trees:delete("k_09", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_01, b_trees:delete("k_01", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_02, b_trees:delete("k_02", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_03, b_trees:delete("k_03", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_04, b_trees:delete("k_04", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_05, b_trees:delete("k_05", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_06, b_trees:delete("k_06", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_07, b_trees:delete("k_07", ?B_TREE_05_09)),
    ?assertEqual(?B_TREE_05_09_MINUS_08, b_trees:delete("k_08", ?B_TREE_05_09)),

    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 1, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 5, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 8, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 11, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 14, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 17, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 20, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_from(5, 100, 4)),

    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 1, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 5, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 8, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 11, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 14, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 17, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 20, 4)),
    ?assertEqual(?B_TREE_05_00, test_generator:delete_b_tree_till(5, 100, 4)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: delete - Examples based on 
%%                      CLRS Introduction to Algorithms
%%--------------------------------------------------------------------

delete_clrs_test(_Config) ->
    % case 1
    _B_TREE_CLRS_500_MINUS_F = b_trees:delete("k_f", ?B_TREE_CLRS_500),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F, _B_TREE_CLRS_500_MINUS_F),

    % case 2a
    _B_TREE_CLRS_500_MINUS_F_M = b_trees:delete("k_m", ?B_TREE_CLRS_500_MINUS_F),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M, _B_TREE_CLRS_500_MINUS_F_M),

    % case 2b
    _B_TREE_CLRS_500_MINUS_F_L = b_trees:delete("k_l", ?B_TREE_CLRS_500_MINUS_F_2),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_L, _B_TREE_CLRS_500_MINUS_F_L),

    % case 2c
    _B_TREE_CLRS_500_MINUS_F_M_G = b_trees:delete("k_g", ?B_TREE_CLRS_500_MINUS_F_M),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G, _B_TREE_CLRS_500_MINUS_F_M_G),

    % case 3a - delete left
    _B_TREE_CLRS_500_MINUS_F_M_G_D_A = b_trees:delete("k_a", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_A, _B_TREE_CLRS_500_MINUS_F_M_G_D_A),
    _B_TREE_CLRS_500_MINUS_F_M_G_D_B = b_trees:delete("k_b", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_B, _B_TREE_CLRS_500_MINUS_F_M_G_D_B),
    _B_TREE_CLRS_500_2_MINUS_F_M_G_D_E = b_trees:delete("k_e", ?B_TREE_CLRS_500_2_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_2_MINUS_F_M_G_D_E, _B_TREE_CLRS_500_2_MINUS_F_M_G_D_E),
    _B_TREE_CLRS_500_2_MINUS_F_M_G_D_J = b_trees:delete("k_j", ?B_TREE_CLRS_500_2_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_2_MINUS_F_M_G_D_J, _B_TREE_CLRS_500_2_MINUS_F_M_G_D_J),
    _B_TREE_CLRS_500_MINUS_F_M_G_D_N = b_trees:delete("k_n", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_N, _B_TREE_CLRS_500_MINUS_F_M_G_D_N),
    _B_TREE_CLRS_500_MINUS_F_M_G_D_O = b_trees:delete("k_o", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_O, _B_TREE_CLRS_500_MINUS_F_M_G_D_O),

    % case 3a delete right
    _B_TREE_CLRS_500_MINUS_F_M_G_D_U = b_trees:delete("k_u", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_U, _B_TREE_CLRS_500_MINUS_F_M_G_D_U),
    _B_TREE_CLRS_500_MINUS_F_M_G_D_V = b_trees:delete("k_v", ?B_TREE_CLRS_500_MINUS_F_M_G_D),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D_V, _B_TREE_CLRS_500_MINUS_F_M_G_D_V),

    % case 3b
    _B_TREE_CLRS_500_MINUS_F_M_G_D = b_trees:delete("k_d", ?B_TREE_CLRS_500_MINUS_F_M_G),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_D, _B_TREE_CLRS_500_MINUS_F_M_G_D),
    _B_TREE_CLRS_500_MINUS_F_M_G_U = b_trees:delete("k_u", ?B_TREE_CLRS_500_MINUS_F_M_G),
    ?assertEqual(?B_TREE_CLRS_500_MINUS_F_M_G_U, _B_TREE_CLRS_500_MINUS_F_M_G_U),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: delete - error
%%--------------------------------------------------------------------

delete_error_test(_Config) ->
    ?assertException(error, {key_not_found, "k_00"}, b_trees:delete("k_00", ?B_TREE_05_00)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:delete("k_00", ?B_TREE_05_01)),

    ?assertException(error, {key_not_found, "k_10"}, b_trees:delete("k_10", ?B_TREE_05_09)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: empty - b*-tree
%%--------------------------------------------------------------------

empty_b_star_tree_test(_Config) ->
    ?assertEqual(?B_STAR_TREE_07_00, b_trees:empty(07, b_star)),
    ?assert(b_trees:is_empty(b_trees:empty(07, b_star))),
    ?assertEqual(0, b_trees:size(b_trees:empty(07, b_star))),

    ?assertEqual(?B_STAR_TREE_08_00, b_trees:empty(08, b_star)),
    ?assert(b_trees:is_empty(b_trees:empty(08, b_star))),
    ?assertEqual(0, b_trees:size(b_trees:empty(08, b_star))),

    ?assertEqual(?B_STAR_TREE_33_00, b_trees:empty(33, b_star)),
    ?assert(b_trees:is_empty(b_trees:empty(33, b_star))),
    ?assertEqual(0, b_trees:size(b_trees:empty(33, b_star))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: empty - b-tree
%%--------------------------------------------------------------------

empty_b_tree_test(_Config) ->
    ?assertEqual(?B_TREE_04_00, b_trees:empty(04)),
    ?assert(b_trees:is_empty(b_trees:empty(04))),
    ?assertEqual(0, b_trees:size(b_trees:empty(04))),

    ?assertEqual(?B_TREE_05_00, b_trees:empty(05)),
    ?assert(b_trees:is_empty(b_trees:empty(05))),
    ?assertEqual(0, b_trees:size(b_trees:empty(05))),

    ?assertEqual(?B_TREE_33_00, b_trees:empty(33)),
    ?assert(b_trees:is_empty(b_trees:empty(33))),
    ?assertEqual(0, b_trees:size(b_trees:empty(33))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: enter - order 4
%%--------------------------------------------------------------------

enter_b_tree_order_4_test(_Config) ->
    _BTree_04_15_01 = b_trees:enter("k_01", "v_01", ?B_TREE_04_00),
    _BTree_04_15_02 = b_trees:enter("k_02", "v_02", _BTree_04_15_01),
    _BTree_04_15_03 = b_trees:enter("k_03", "v_03", _BTree_04_15_02),
    _BTree_04_15_04 = b_trees:enter("k_04", "v_04", _BTree_04_15_03),
    _BTree_04_15_05 = b_trees:enter("k_05", "v_05", _BTree_04_15_04),
    _BTree_04_15_06 = b_trees:enter("k_06", "v_06", _BTree_04_15_05),
    _BTree_04_15_07 = b_trees:enter("k_07", "v_07", _BTree_04_15_06),
    _BTree_04_15_08 = b_trees:enter("k_08", "v_08", _BTree_04_15_07),
    _BTree_04_15_09 = b_trees:enter("k_09", "v_09", _BTree_04_15_08),
    _BTree_04_15_10 = b_trees:enter("k_10", "v_10", _BTree_04_15_09),
    _BTree_04_15_11 = b_trees:enter("k_11", "v_11", _BTree_04_15_10),
    _BTree_04_15_12 = b_trees:enter("k_12", "v_12", _BTree_04_15_11),
    _BTree_04_15_13 = b_trees:enter("k_13", "v_13", _BTree_04_15_12),
    _BTree_04_15_14 = b_trees:enter("k_14", "v_14", _BTree_04_15_13),
    _BTree_04_15_15 = b_trees:enter("k_15", "v_15", _BTree_04_15_14),
    ?assertEqual(?B_TREE_04_15, _BTree_04_15_15),

    _BTree_04_15_01_NEW = b_trees:enter("k_01", "v_01_new", _BTree_04_15_15),
    _BTree_04_15_02_NEW = b_trees:enter("k_02", "v_02_new", _BTree_04_15_01_NEW),
    _BTree_04_15_03_NEW = b_trees:enter("k_03", "v_03_new", _BTree_04_15_02_NEW),
    _BTree_04_15_04_NEW = b_trees:enter("k_04", "v_04_new", _BTree_04_15_03_NEW),
    _BTree_04_15_05_NEW = b_trees:enter("k_05", "v_05_new", _BTree_04_15_04_NEW),
    _BTree_04_15_06_NEW = b_trees:enter("k_06", "v_06_new", _BTree_04_15_05_NEW),
    _BTree_04_15_07_NEW = b_trees:enter("k_07", "v_07_new", _BTree_04_15_06_NEW),
    _BTree_04_15_08_NEW = b_trees:enter("k_08", "v_08_new", _BTree_04_15_07_NEW),
    _BTree_04_15_09_NEW = b_trees:enter("k_09", "v_09_new", _BTree_04_15_08_NEW),
    _BTree_04_15_10_NEW = b_trees:enter("k_10", "v_10_new", _BTree_04_15_09_NEW),
    _BTree_04_15_11_NEW = b_trees:enter("k_11", "v_11_new", _BTree_04_15_10_NEW),
    _BTree_04_15_12_NEW = b_trees:enter("k_12", "v_12_new", _BTree_04_15_11_NEW),
    _BTree_04_15_13_NEW = b_trees:enter("k_13", "v_13_new", _BTree_04_15_12_NEW),
    _BTree_04_15_14_NEW = b_trees:enter("k_14", "v_14_new", _BTree_04_15_13_NEW),
    ?assertEqual(?B_TREE_04_15_UPDATE, b_trees:enter("k_15", "v_15_new", _BTree_04_15_14_NEW)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: from_dict - b*-tree
%%--------------------------------------------------------------------

from_dict_b_star_tree_test(_Config) ->
    ?assertEqual(?B_STAR_TREE_33_01, b_trees:from_dict(33, b_star, test_generator:generate_key_values_from(1, 2))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: from_dict - b-tree
%%--------------------------------------------------------------------

from_dict_b_tree_test(_Config) ->
    ?assertEqual(?B_TREE_04_04, b_trees:from_dict(4, test_generator:generate_key_values_from(4, 2))),
    ?assertEqual(?B_TREE_05_01, b_trees:from_dict(5, test_generator:generate_key_values_from(1, 2))),
    ?assertEqual(?B_TREE_05_29, b_trees:from_dict(5, test_generator:generate_key_values_from(29, 2))),
    ?assertEqual(?B_TREE_19_19, b_trees:from_dict(19, test_generator:generate_key_values_from(19, 2))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: get
%%--------------------------------------------------------------------

get_test(_Config) ->
    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_04_00)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_04_04)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_04_04)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_04_04)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_04_04)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_04_04)),
    ?assertException(error, {key_not_found, "k_05"}, b_trees:get("k_05", ?B_TREE_04_04)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_07_07)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_07_07)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_07_07)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_07_07)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_07_07)),
    ?assertEqual("v_05", b_trees:get("k_05", ?B_TREE_07_07)),
    ?assertEqual("v_06", b_trees:get("k_06", ?B_TREE_07_07)),
    ?assertEqual("v_07", b_trees:get("k_07", ?B_TREE_07_07)),
    ?assertException(error, {key_not_found, "k_08"}, b_trees:get("k_08", ?B_TREE_07_07)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_10_10)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_10_10)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_10_10)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_10_10)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_10_10)),
    ?assertEqual("v_05", b_trees:get("k_05", ?B_TREE_10_10)),
    ?assertEqual("v_06", b_trees:get("k_06", ?B_TREE_10_10)),
    ?assertEqual("v_07", b_trees:get("k_07", ?B_TREE_10_10)),
    ?assertEqual("v_08", b_trees:get("k_08", ?B_TREE_10_10)),
    ?assertEqual("v_09", b_trees:get("k_09", ?B_TREE_10_10)),
    ?assertEqual("v_10", b_trees:get("k_10", ?B_TREE_10_10)),
    ?assertException(error, {key_not_found, "k_11"}, b_trees:get("k_11", ?B_TREE_10_10)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_13_13)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_13_13)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_13_13)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_13_13)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_13_13)),
    ?assertEqual("v_05", b_trees:get("k_05", ?B_TREE_13_13)),
    ?assertEqual("v_06", b_trees:get("k_06", ?B_TREE_13_13)),
    ?assertEqual("v_07", b_trees:get("k_07", ?B_TREE_13_13)),
    ?assertEqual("v_08", b_trees:get("k_08", ?B_TREE_13_13)),
    ?assertEqual("v_09", b_trees:get("k_09", ?B_TREE_13_13)),
    ?assertEqual("v_10", b_trees:get("k_10", ?B_TREE_13_13)),
    ?assertEqual("v_11", b_trees:get("k_11", ?B_TREE_13_13)),
    ?assertEqual("v_12", b_trees:get("k_12", ?B_TREE_13_13)),
    ?assertEqual("v_13", b_trees:get("k_13", ?B_TREE_13_13)),
    ?assertException(error, {key_not_found, "k_14"}, b_trees:get("k_14", ?B_TREE_13_13)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_16_16)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_16_16)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_16_16)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_16_16)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_16_16)),
    ?assertEqual("v_05", b_trees:get("k_05", ?B_TREE_16_16)),
    ?assertEqual("v_06", b_trees:get("k_06", ?B_TREE_16_16)),
    ?assertEqual("v_07", b_trees:get("k_07", ?B_TREE_16_16)),
    ?assertEqual("v_08", b_trees:get("k_08", ?B_TREE_16_16)),
    ?assertEqual("v_09", b_trees:get("k_09", ?B_TREE_16_16)),
    ?assertEqual("v_10", b_trees:get("k_10", ?B_TREE_16_16)),
    ?assertEqual("v_11", b_trees:get("k_11", ?B_TREE_16_16)),
    ?assertEqual("v_12", b_trees:get("k_12", ?B_TREE_16_16)),
    ?assertEqual("v_13", b_trees:get("k_13", ?B_TREE_16_16)),
    ?assertEqual("v_14", b_trees:get("k_14", ?B_TREE_16_16)),
    ?assertEqual("v_15", b_trees:get("k_15", ?B_TREE_16_16)),
    ?assertEqual("v_16", b_trees:get("k_16", ?B_TREE_16_16)),
    ?assertException(error, {key_not_found, "k_17"}, b_trees:get("k_17", ?B_TREE_16_16)),

    ?assertException(error, {key_not_found, "k_00"}, b_trees:get("k_00", ?B_TREE_19_19)),
    ?assertEqual("v_01", b_trees:get("k_01", ?B_TREE_19_19)),
    ?assertEqual("v_02", b_trees:get("k_02", ?B_TREE_19_19)),
    ?assertEqual("v_03", b_trees:get("k_03", ?B_TREE_19_19)),
    ?assertEqual("v_04", b_trees:get("k_04", ?B_TREE_19_19)),
    ?assertEqual("v_05", b_trees:get("k_05", ?B_TREE_19_19)),
    ?assertEqual("v_06", b_trees:get("k_06", ?B_TREE_19_19)),
    ?assertEqual("v_07", b_trees:get("k_07", ?B_TREE_19_19)),
    ?assertEqual("v_08", b_trees:get("k_08", ?B_TREE_19_19)),
    ?assertEqual("v_09", b_trees:get("k_09", ?B_TREE_19_19)),
    ?assertEqual("v_10", b_trees:get("k_10", ?B_TREE_19_19)),
    ?assertEqual("v_11", b_trees:get("k_11", ?B_TREE_19_19)),
    ?assertEqual("v_12", b_trees:get("k_12", ?B_TREE_19_19)),
    ?assertEqual("v_13", b_trees:get("k_13", ?B_TREE_19_19)),
    ?assertEqual("v_14", b_trees:get("k_14", ?B_TREE_19_19)),
    ?assertEqual("v_15", b_trees:get("k_15", ?B_TREE_19_19)),
    ?assertEqual("v_16", b_trees:get("k_16", ?B_TREE_19_19)),
    ?assertEqual("v_17", b_trees:get("k_17", ?B_TREE_19_19)),
    ?assertEqual("v_18", b_trees:get("k_18", ?B_TREE_19_19)),
    ?assertEqual("v_19", b_trees:get("k_19", ?B_TREE_19_19)),
    ?assertException(error, {key_not_found, "k_20"}, b_trees:get("k_20", ?B_TREE_19_19)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: height
%%--------------------------------------------------------------------

height_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:height(?B_TREE_05_00)),

    ?assertEqual(0, b_trees:height(?B_TREE_05_02)),
    ?assertEqual(1, b_trees:height(?B_TREE_05_05)),
    ?assertEqual(2, b_trees:height(?B_TREE_05_16)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: insert - order 5
%%--------------------------------------------------------------------

insert_b_tree_order_5_test(_Config) ->
    ?assertEqual(?B_TREE_05_00, b_trees:empty(5)),
    ?assertEqual(0, b_trees:number_key_values(?B_TREE_05_00)),
    ?assertException(error, {empty_tree, _}, b_trees:height(?B_TREE_05_00)),
    ?assertEqual(0, b_trees:size(?B_TREE_05_00)),

    ?assertEqual(?B_TREE_05_01, b_trees:insert("k_01", "v_01", ?B_TREE_05_00)),
    ?assertEqual(1, b_trees:number_key_values(?B_TREE_05_01)),
    ?assertEqual(0, b_trees:height(?B_TREE_05_01)),
    ?assertEqual(1, b_trees:size(?B_TREE_05_01)),

    ?assertEqual(?B_TREE_05_02, b_trees:insert("k_02", "v_02", test_generator:generate_b_tree_from_number(5, 1, 2))),
    ?assertEqual(2, b_trees:number_key_values(?B_TREE_05_02)),
    ?assertEqual(0, b_trees:height(?B_TREE_05_02)),
    ?assertEqual(1, b_trees:size(?B_TREE_05_02)),

    ?assertEqual(?B_TREE_05_03, b_trees:insert("k_03", "v_03", test_generator:generate_b_tree_from_number(5, 2, 2))),
    ?assertEqual(3, b_trees:number_key_values(?B_TREE_05_03)),
    ?assertEqual(0, b_trees:height(?B_TREE_05_03)),
    ?assertEqual(1, b_trees:size(?B_TREE_05_03)),

    ?assertEqual(?B_TREE_05_04, b_trees:insert("k_04", "v_04", test_generator:generate_b_tree_from_number(5, 3, 2))),
    ?assertEqual(4, b_trees:number_key_values(?B_TREE_05_04)),
    ?assertEqual(0, b_trees:height(?B_TREE_05_04)),
    ?assertEqual(1, b_trees:size(?B_TREE_05_04)),

    ?assertEqual(?B_TREE_05_05, b_trees:insert("k_05", "v_05", test_generator:generate_b_tree_from_number(5, 4, 2))),
    ?assertEqual(5, b_trees:number_key_values(?B_TREE_05_05)),
    ?assertEqual(1, b_trees:height(?B_TREE_05_05)),
    ?assertEqual(3, b_trees:size(?B_TREE_05_05)),

    ?assertEqual(?B_TREE_05_09, b_trees:insert("k_09", "v_09", test_generator:generate_b_tree_from_number(5, 8, 2))),
    ?assertEqual(9, b_trees:number_key_values(?B_TREE_05_09)),
    ?assertEqual(1, b_trees:height(?B_TREE_05_09)),
    ?assertEqual(4, b_trees:size(?B_TREE_05_09)),

    ?assertEqual(?B_TREE_05_13, b_trees:insert("k_13", "v_13", test_generator:generate_b_tree_from_number(5, 12, 2))),
    ?assertEqual(13, b_trees:number_key_values(?B_TREE_05_13)),
    ?assertEqual(1, b_trees:height(?B_TREE_05_13)),
    ?assertEqual(5, b_trees:size(?B_TREE_05_13)),

    ?assertEqual(?B_TREE_05_17, b_trees:insert("k_17", "v_17", test_generator:generate_b_tree_from_number(5, 16, 2))),
    ?assertEqual(17, b_trees:number_key_values(?B_TREE_05_17)),
    ?assertEqual(2, b_trees:height(?B_TREE_05_17)),
    ?assertEqual(9, b_trees:size(?B_TREE_05_17)),

    ?assertEqual(?B_TREE_05_21, b_trees:insert("k_21", "v_21", test_generator:generate_b_tree_from_number(5, 20, 2))),
    ?assertEqual(21, b_trees:number_key_values(?B_TREE_05_21)),
    ?assertEqual(2, b_trees:height(?B_TREE_05_21)),
    ?assertEqual(10, b_trees:size(?B_TREE_05_21)),

    ?assertEqual(?B_TREE_05_25, b_trees:insert("k_25", "v_25", test_generator:generate_b_tree_from_number(5, 24, 2))),
    ?assertEqual(25, b_trees:number_key_values(?B_TREE_05_25)),
    ?assertEqual(2, b_trees:height(?B_TREE_05_25)),
    ?assertEqual(12, b_trees:size(?B_TREE_05_25)),

    ?assertEqual(?B_TREE_05_29, b_trees:insert("k_29", "v_29", test_generator:generate_b_tree_from_number(5, 28, 2))),
    ?assertEqual(29, b_trees:number_key_values(?B_TREE_05_29)),
    ?assertEqual(2, b_trees:height(?B_TREE_05_29)),
    ?assertEqual(14, b_trees:size(?B_TREE_05_29)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: insert - order 7
%%--------------------------------------------------------------------

insert_b_tree_order_7_test(_Config) ->
    ?assertEqual(?B_TREE_07_00, b_trees:empty(7)),
    ?assertEqual(0, b_trees:number_key_values(?B_TREE_07_00)),
    ?assertException(error, {empty_tree, _}, b_trees:height(?B_TREE_07_00)),
    ?assertEqual(0, b_trees:size(?B_TREE_07_00)),

    ?assertEqual(?B_TREE_07_07, b_trees:insert("k_07", "v_07", test_generator:generate_b_tree_from_number(7, 6, 2))),
    ?assertEqual(7, b_trees:number_key_values(?B_TREE_07_07)),
    ?assertEqual(1, b_trees:height(?B_TREE_07_07)),
    ?assertEqual(3, b_trees:size(?B_TREE_07_07)),

    ?assertEqual(?B_TREE_07_80, test_generator:generate_b_tree_from_list_key_number(7,
        [
            11, 17, 23, 31, 41, 47, 59, 67, 73, 83, 97,
            103, 109, 127, 137, 149, 157, 167, 179, 191, 197,
            211, 227, 233, 241, 257, 269, 277, 283,
            307, 313, 331, 347, 353, 367, 379, 389,
            401, 419, 431, 439, 449, 461, 467, 487, 499,
            509, 523, 547, 563, 571, 587, 599,
            607, 617, 631, 643, 653, 661, 677, 691,
            709, 727, 739, 751, 761, 773, 797,
            811, 823, 829, 853, 859, 877, 883,
            907, 919, 937, 947, 967
        ],
        3)),
    ?assertEqual(80, b_trees:number_key_values(?B_TREE_07_80)),
    ?assertEqual(2, b_trees:height(?B_TREE_07_80)),
    ?assertEqual(26, b_trees:size(?B_TREE_07_80)),

    ?assertEqual(?B_TREE_07_80, test_generator:generate_b_tree_from_list_key_number(7,
        [
            907, 919, 937, 947, 967,
            811, 823, 829, 853, 859, 877, 883,
            709, 727, 739, 751, 761, 773, 797,
            607, 617, 631, 643, 653, 661, 677, 691,
            509, 523, 547, 563, 571, 587, 599,
            401, 419, 431, 439, 449, 461, 467, 487, 499,
            307, 313, 331, 347, 353, 367, 379, 389,
            211, 227, 233, 241, 257, 269, 277, 283,
            103, 109, 127, 137, 149, 157, 167, 179, 191, 197,
            11, 17, 23, 31, 41, 47, 59, 67, 73, 83, 97
        ],
        3)),
    ?assertEqual(2, b_trees:height(?B_TREE_07_80)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: insert - order 8
%%--------------------------------------------------------------------

insert_b_tree_order_8_test(_Config) ->
    ?assertEqual(?B_TREE_08_16, b_trees:insert("k_16", "v_16", test_generator:generate_b_tree_from_number(8, 15, 2))),
    ?assertEqual(16, b_trees:number_key_values(?B_TREE_08_16)),
    ?assertEqual(1, b_trees:height(?B_TREE_08_16)),
    ?assertEqual(5, b_trees:size(?B_TREE_08_16)),

    ?assertEqual(?B_TREE_08_32, b_trees:insert("k_32", "v_32", test_generator:generate_b_tree_from_number(8, 31, 2))),
    ?assertEqual(32, b_trees:number_key_values(?B_TREE_08_32)),
    ?assertEqual(1, b_trees:height(?B_TREE_08_32)),
    ?assertEqual(9, b_trees:size(?B_TREE_08_32)),

    ?assertEqual(?B_TREE_08_64, b_trees:insert("k_64", "v_64", test_generator:generate_b_tree_from_number(8, 63, 2))),
    ?assertEqual(64, b_trees:number_key_values(?B_TREE_08_64)),
    ?assertEqual(2, b_trees:height(?B_TREE_08_64)),
    ?assertEqual(20, b_trees:size(?B_TREE_08_64)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: insert - Examples based on 
%%                      CLRS Introduction to Algorithms
%%--------------------------------------------------------------------

insert_clrs_test(_Config) ->
    _B_TREE_CLRS_498_PLUS_B = b_trees:insert("k_b", "v_b", ?B_TREE_CLRS_498),
    ?assertEqual(?B_TREE_CLRS_498_PLUS_B, _B_TREE_CLRS_498_PLUS_B),

    _B_TREE_CLRS_498_PLUS_B_Q = b_trees:insert("k_q", "v_q", ?B_TREE_CLRS_498_PLUS_B),
    ?assertEqual(?B_TREE_CLRS_498_PLUS_B_Q, _B_TREE_CLRS_498_PLUS_B_Q),

    _B_TREE_CLRS_498_PLUS_B_Q_L = b_trees:insert("k_l", "v_l", ?B_TREE_CLRS_498_PLUS_B_Q),
    ?assertEqual(?B_TREE_CLRS_498_PLUS_B_Q_L, _B_TREE_CLRS_498_PLUS_B_Q_L),

    _B_TREE_CLRS_498_PLUS_B_Q_L_F = b_trees:insert("k_f", "v_f", ?B_TREE_CLRS_498_PLUS_B_Q_L),
    ?assertEqual(?B_TREE_CLRS_498_PLUS_B_Q_L_F, _B_TREE_CLRS_498_PLUS_B_Q_L_F),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: insert - error
%%--------------------------------------------------------------------

insert_error_test(_Config) ->
    ?assertException(error, {key_exists, "k_01"}, b_trees:insert("k_01", "v_01", test_generator:generate_b_tree_from_number(5, 5, 2))),
    ?assertException(error, {key_exists, "k_02"}, b_trees:insert("k_02", "v_02", test_generator:generate_b_tree_from_number(5, 5, 2))),
    ?assertException(error, {key_exists, "k_03"}, b_trees:insert("k_03", "v_03", test_generator:generate_b_tree_from_number(5, 5, 2))),
    ?assertException(error, {key_exists, "k_04"}, b_trees:insert("k_04", "v_04", test_generator:generate_b_tree_from_number(5, 5, 2))),
    ?assertException(error, {key_exists, "k_05"}, b_trees:insert("k_05", "v_05", test_generator:generate_b_tree_from_number(5, 5, 2))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: is_defined
%%--------------------------------------------------------------------

is_defined_test(_Config) ->
    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_04_00)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_04_04)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_04_04)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_04_04)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_04_04)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_04_04)),
    ?assertNot(b_trees:is_defined("k_05", ?B_TREE_04_04)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_05", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_06", ?B_TREE_07_07)),
    ?assert(b_trees:is_defined("k_07", ?B_TREE_07_07)),
    ?assertNot(b_trees:is_defined("k_08", ?B_TREE_07_07)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_05", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_06", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_07", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_08", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_09", ?B_TREE_10_10)),
    ?assert(b_trees:is_defined("k_10", ?B_TREE_10_10)),
    ?assertNot(b_trees:is_defined("k_11", ?B_TREE_10_10)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_05", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_06", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_07", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_08", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_09", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_10", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_11", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_12", ?B_TREE_13_13)),
    ?assert(b_trees:is_defined("k_13", ?B_TREE_13_13)),
    ?assertNot(b_trees:is_defined("k_14", ?B_TREE_13_13)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_05", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_06", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_07", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_08", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_09", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_10", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_11", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_12", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_13", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_14", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_15", ?B_TREE_16_16)),
    ?assert(b_trees:is_defined("k_16", ?B_TREE_16_16)),
    ?assertNot(b_trees:is_defined("k_17", ?B_TREE_16_16)),

    ?assertNot(b_trees:is_defined("k_00", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_01", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_02", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_03", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_04", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_05", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_06", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_07", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_08", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_09", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_10", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_11", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_12", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_13", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_14", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_15", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_16", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_17", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_18", ?B_TREE_19_19)),
    ?assert(b_trees:is_defined("k_19", ?B_TREE_19_19)),
    ?assertNot(b_trees:is_defined("k_20", ?B_TREE_19_19)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: is_empty
%%--------------------------------------------------------------------

is_empty_test(_Config) ->
    ?assertEqual(false, b_trees:is_empty(?B_TREE_33_01)),
    ?assertEqual(true, b_trees:is_empty(?B_TREE_33_00)),
    ?assertEqual(true, b_trees:is_empty(?B_STAR_TREE_07_00)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: iterator & next
%%--------------------------------------------------------------------

iterator_next_test(_Config) ->
    BTree_05_00 = b_trees:empty(5),
    _Iterator_05_00_00 = b_trees:iterator(BTree_05_00),
    ?assertEqual(none, b_trees:next(_Iterator_05_00_00)),

    BTree_05_01 = test_generator:generate_b_tree_from_number(5, 1, 2),
    Iterator_05_01_00 = b_trees:iterator(BTree_05_01),
    {_Key_05_01_01, _Value_05_01_01, _Iterator_05_01_01} = b_trees:next(Iterator_05_01_00),
    ?assertEqual({"k_01", "v_01"}, {_Key_05_01_01, _Value_05_01_01}),
    ?assertEqual(none, b_trees:next(_Iterator_05_01_01)),

    BTree_05_30 = test_generator:generate_b_tree_from_number(5, 30, 2),
    Iterator_05_30_00 = b_trees:iterator(BTree_05_30),
    {_Key_05_30_01, _Value_05_30_01, Iterator_05_30_01} = b_trees:next(Iterator_05_30_00),
    ?assertEqual({"k_01", "v_01"}, {_Key_05_30_01, _Value_05_30_01}),
    {_Key_05_30_02, _Value_05_30_02, Iterator_05_30_02} = b_trees:next(Iterator_05_30_01),
    ?assertEqual({"k_02", "v_02"}, {_Key_05_30_02, _Value_05_30_02}),
    {_Key_05_30_03, _Value_05_30_03, Iterator_05_30_03} = b_trees:next(Iterator_05_30_02),
    ?assertEqual({"k_03", "v_03"}, {_Key_05_30_03, _Value_05_30_03}),
    {_Key_05_30_04, _Value_05_30_04, Iterator_05_30_04} = b_trees:next(Iterator_05_30_03),
    ?assertEqual({"k_04", "v_04"}, {_Key_05_30_04, _Value_05_30_04}),
    {_Key_05_30_05, _Value_05_30_05, Iterator_05_30_05} = b_trees:next(Iterator_05_30_04),
    ?assertEqual({"k_05", "v_05"}, {_Key_05_30_05, _Value_05_30_05}),
    {_Key_05_30_06, _Value_05_30_06, Iterator_05_30_06} = b_trees:next(Iterator_05_30_05),
    ?assertEqual({"k_06", "v_06"}, {_Key_05_30_06, _Value_05_30_06}),
    {_Key_05_30_07, _Value_05_30_07, Iterator_05_30_07} = b_trees:next(Iterator_05_30_06),
    ?assertEqual({"k_07", "v_07"}, {_Key_05_30_07, _Value_05_30_07}),
    {_Key_05_30_08, _Value_05_30_08, Iterator_05_30_08} = b_trees:next(Iterator_05_30_07),
    ?assertEqual({"k_08", "v_08"}, {_Key_05_30_08, _Value_05_30_08}),
    {_Key_05_30_09, _Value_05_30_09, Iterator_05_30_09} = b_trees:next(Iterator_05_30_08),
    ?assertEqual({"k_09", "v_09"}, {_Key_05_30_09, _Value_05_30_09}),
    {_Key_05_30_10, _Value_05_30_10, Iterator_05_30_10} = b_trees:next(Iterator_05_30_09),
    ?assertEqual({"k_10", "v_10"}, {_Key_05_30_10, _Value_05_30_10}),
    {_Key_05_30_11, _Value_05_30_11, Iterator_05_30_11} = b_trees:next(Iterator_05_30_10),
    ?assertEqual({"k_11", "v_11"}, {_Key_05_30_11, _Value_05_30_11}),
    {_Key_05_30_12, _Value_05_30_12, Iterator_05_30_12} = b_trees:next(Iterator_05_30_11),
    ?assertEqual({"k_12", "v_12"}, {_Key_05_30_12, _Value_05_30_12}),
    {_Key_05_30_13, _Value_05_30_13, Iterator_05_30_13} = b_trees:next(Iterator_05_30_12),
    ?assertEqual({"k_13", "v_13"}, {_Key_05_30_13, _Value_05_30_13}),
    {_Key_05_30_14, _Value_05_30_14, Iterator_05_30_14} = b_trees:next(Iterator_05_30_13),
    ?assertEqual({"k_14", "v_14"}, {_Key_05_30_14, _Value_05_30_14}),
    {_Key_05_30_15, _Value_05_30_15, Iterator_05_30_15} = b_trees:next(Iterator_05_30_14),
    ?assertEqual({"k_15", "v_15"}, {_Key_05_30_15, _Value_05_30_15}),
    {_Key_05_30_16, _Value_05_30_16, Iterator_05_30_16} = b_trees:next(Iterator_05_30_15),
    ?assertEqual({"k_16", "v_16"}, {_Key_05_30_16, _Value_05_30_16}),
    {_Key_05_30_17, _Value_05_30_17, Iterator_05_30_17} = b_trees:next(Iterator_05_30_16),
    ?assertEqual({"k_17", "v_17"}, {_Key_05_30_17, _Value_05_30_17}),
    {_Key_05_30_18, _Value_05_30_18, Iterator_05_30_18} = b_trees:next(Iterator_05_30_17),
    ?assertEqual({"k_18", "v_18"}, {_Key_05_30_18, _Value_05_30_18}),
    {_Key_05_30_19, _Value_05_30_19, Iterator_05_30_19} = b_trees:next(Iterator_05_30_18),
    ?assertEqual({"k_19", "v_19"}, {_Key_05_30_19, _Value_05_30_19}),
    {_Key_05_30_20, _Value_05_30_20, Iterator_05_30_20} = b_trees:next(Iterator_05_30_19),
    ?assertEqual({"k_20", "v_20"}, {_Key_05_30_20, _Value_05_30_20}),
    {_Key_05_30_21, _Value_05_30_21, Iterator_05_30_21} = b_trees:next(Iterator_05_30_20),
    ?assertEqual({"k_21", "v_21"}, {_Key_05_30_21, _Value_05_30_21}),
    {_Key_05_30_22, _Value_05_30_22, Iterator_05_30_22} = b_trees:next(Iterator_05_30_21),
    ?assertEqual({"k_22", "v_22"}, {_Key_05_30_22, _Value_05_30_22}),
    {_Key_05_30_23, _Value_05_30_23, Iterator_05_30_23} = b_trees:next(Iterator_05_30_22),
    ?assertEqual({"k_23", "v_23"}, {_Key_05_30_23, _Value_05_30_23}),
    {_Key_05_30_24, _Value_05_30_24, Iterator_05_30_24} = b_trees:next(Iterator_05_30_23),
    ?assertEqual({"k_24", "v_24"}, {_Key_05_30_24, _Value_05_30_24}),
    {_Key_05_30_25, _Value_05_30_25, Iterator_05_30_25} = b_trees:next(Iterator_05_30_24),
    ?assertEqual({"k_25", "v_25"}, {_Key_05_30_25, _Value_05_30_25}),
    {_Key_05_30_26, _Value_05_30_26, Iterator_05_30_26} = b_trees:next(Iterator_05_30_25),
    ?assertEqual({"k_26", "v_26"}, {_Key_05_30_26, _Value_05_30_26}),
    {_Key_05_30_27, _Value_05_30_27, Iterator_05_30_27} = b_trees:next(Iterator_05_30_26),
    ?assertEqual({"k_27", "v_27"}, {_Key_05_30_27, _Value_05_30_27}),
    {_Key_05_30_28, _Value_05_30_28, Iterator_05_30_28} = b_trees:next(Iterator_05_30_27),
    ?assertEqual({"k_28", "v_28"}, {_Key_05_30_28, _Value_05_30_28}),
    {_Key_05_30_29, _Value_05_30_29, Iterator_05_30_29} = b_trees:next(Iterator_05_30_28),
    ?assertEqual({"k_29", "v_29"}, {_Key_05_30_29, _Value_05_30_29}),
    {_Key_05_30_30, _Value_05_30_30, _Iterator_05_30_30} = b_trees:next(Iterator_05_30_29),
    ?assertEqual({"k_30", "v_30"}, {_Key_05_30_30, _Value_05_30_30}),
    ?assertEqual(none, b_trees:next(_Iterator_05_30_30)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: keys
%%--------------------------------------------------------------------

keys_test(_Config) ->
    ?assertEqual([], b_trees:keys(?B_TREE_05_00)),

    ?assertEqual(["k_01"], b_trees:keys(?B_TREE_05_01)),

    _Keys_05_02 = b_trees:keys(?B_TREE_05_02),
    ?assertEqual(test_generator:generate_keys_from(2, 2), _Keys_05_02),
    ?assertEqual(2, length(Keys_05_02)),

    _Keys_05_05 = b_trees:keys(?B_TREE_05_05),
    ?assertEqual(test_generator:generate_keys_from(5, 2), _Keys_05_05),
    ?assertEqual(5, length(Keys_05_05)),

    _Keys_05_09 = b_trees:keys(?B_TREE_05_09),
    ?assertEqual(test_generator:generate_keys_from(9, 2), _Keys_05_09),
    ?assertEqual(9, length(Keys_05_09)),

    _Keys_05_16 = b_trees:keys(?B_TREE_05_16),
    ?assertEqual(test_generator:generate_keys_from(16, 2), _Keys_05_16),
    ?assertEqual(16, length(Keys_05_16)),

    ?assertEqual(80, length(b_trees:keys(?B_TREE_07_80))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: largest
%%--------------------------------------------------------------------

largest_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:largest(?B_TREE_05_00)),
    ?assertEqual({"k_01", "v_01"}, b_trees:largest(?B_TREE_05_01)),
    ?assertEqual({"k_02", "v_02"}, b_trees:largest(?B_TREE_05_02)),
    ?assertEqual({"k_05", "v_05"}, b_trees:largest(?B_TREE_05_05)),
    ?assertEqual({"k_09", "v_09"}, b_trees:largest(?B_TREE_05_09)),
    ?assertEqual({"k_16", "v_16"}, b_trees:largest(?B_TREE_05_16)),
    ?assertEqual({"k_19", "v_19"}, b_trees:largest(?B_TREE_19_19)),
    ?assertEqual({"k_967", "v_967"}, b_trees:largest(?B_TREE_07_80)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: lookup
%%--------------------------------------------------------------------

lookup_test(_Config) ->
    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_04_00)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_04_04)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_04_04)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_04_04)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_04_04)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_04_04)),
    ?assertEqual(none, b_trees:lookup("k_05", ?B_TREE_04_04)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_07_07)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_07_07)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_07_07)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_07_07)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_07_07)),
    ?assertEqual({value, "v_05"}, b_trees:lookup("k_05", ?B_TREE_07_07)),
    ?assertEqual({value, "v_06"}, b_trees:lookup("k_06", ?B_TREE_07_07)),
    ?assertEqual({value, "v_07"}, b_trees:lookup("k_07", ?B_TREE_07_07)),
    ?assertEqual(none, b_trees:lookup("k_08", ?B_TREE_07_07)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_10_10)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_10_10)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_10_10)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_10_10)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_10_10)),
    ?assertEqual({value, "v_05"}, b_trees:lookup("k_05", ?B_TREE_10_10)),
    ?assertEqual({value, "v_06"}, b_trees:lookup("k_06", ?B_TREE_10_10)),
    ?assertEqual({value, "v_07"}, b_trees:lookup("k_07", ?B_TREE_10_10)),
    ?assertEqual({value, "v_08"}, b_trees:lookup("k_08", ?B_TREE_10_10)),
    ?assertEqual({value, "v_09"}, b_trees:lookup("k_09", ?B_TREE_10_10)),
    ?assertEqual({value, "v_10"}, b_trees:lookup("k_10", ?B_TREE_10_10)),
    ?assertEqual(none, b_trees:lookup("k_11", ?B_TREE_10_10)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_13_13)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_13_13)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_13_13)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_13_13)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_13_13)),
    ?assertEqual({value, "v_05"}, b_trees:lookup("k_05", ?B_TREE_13_13)),
    ?assertEqual({value, "v_06"}, b_trees:lookup("k_06", ?B_TREE_13_13)),
    ?assertEqual({value, "v_07"}, b_trees:lookup("k_07", ?B_TREE_13_13)),
    ?assertEqual({value, "v_08"}, b_trees:lookup("k_08", ?B_TREE_13_13)),
    ?assertEqual({value, "v_09"}, b_trees:lookup("k_09", ?B_TREE_13_13)),
    ?assertEqual({value, "v_10"}, b_trees:lookup("k_10", ?B_TREE_13_13)),
    ?assertEqual({value, "v_11"}, b_trees:lookup("k_11", ?B_TREE_13_13)),
    ?assertEqual({value, "v_12"}, b_trees:lookup("k_12", ?B_TREE_13_13)),
    ?assertEqual({value, "v_13"}, b_trees:lookup("k_13", ?B_TREE_13_13)),
    ?assertEqual(none, b_trees:lookup("k_14", ?B_TREE_13_13)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_16_16)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_16_16)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_16_16)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_16_16)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_16_16)),
    ?assertEqual({value, "v_05"}, b_trees:lookup("k_05", ?B_TREE_16_16)),
    ?assertEqual({value, "v_06"}, b_trees:lookup("k_06", ?B_TREE_16_16)),
    ?assertEqual({value, "v_07"}, b_trees:lookup("k_07", ?B_TREE_16_16)),
    ?assertEqual({value, "v_08"}, b_trees:lookup("k_08", ?B_TREE_16_16)),
    ?assertEqual({value, "v_09"}, b_trees:lookup("k_09", ?B_TREE_16_16)),
    ?assertEqual({value, "v_10"}, b_trees:lookup("k_10", ?B_TREE_16_16)),
    ?assertEqual({value, "v_11"}, b_trees:lookup("k_11", ?B_TREE_16_16)),
    ?assertEqual({value, "v_12"}, b_trees:lookup("k_12", ?B_TREE_16_16)),
    ?assertEqual({value, "v_13"}, b_trees:lookup("k_13", ?B_TREE_16_16)),
    ?assertEqual({value, "v_14"}, b_trees:lookup("k_14", ?B_TREE_16_16)),
    ?assertEqual({value, "v_15"}, b_trees:lookup("k_15", ?B_TREE_16_16)),
    ?assertEqual({value, "v_16"}, b_trees:lookup("k_16", ?B_TREE_16_16)),
    ?assertEqual(none, b_trees:lookup("k_17", ?B_TREE_16_16)),

    ?assertEqual(none, b_trees:lookup("k_00", ?B_TREE_19_19)),
    ?assertEqual({value, "v_01"}, b_trees:lookup("k_01", ?B_TREE_19_19)),
    ?assertEqual({value, "v_02"}, b_trees:lookup("k_02", ?B_TREE_19_19)),
    ?assertEqual({value, "v_03"}, b_trees:lookup("k_03", ?B_TREE_19_19)),
    ?assertEqual({value, "v_04"}, b_trees:lookup("k_04", ?B_TREE_19_19)),
    ?assertEqual({value, "v_05"}, b_trees:lookup("k_05", ?B_TREE_19_19)),
    ?assertEqual({value, "v_06"}, b_trees:lookup("k_06", ?B_TREE_19_19)),
    ?assertEqual({value, "v_07"}, b_trees:lookup("k_07", ?B_TREE_19_19)),
    ?assertEqual({value, "v_08"}, b_trees:lookup("k_08", ?B_TREE_19_19)),
    ?assertEqual({value, "v_09"}, b_trees:lookup("k_09", ?B_TREE_19_19)),
    ?assertEqual({value, "v_10"}, b_trees:lookup("k_10", ?B_TREE_19_19)),
    ?assertEqual({value, "v_11"}, b_trees:lookup("k_11", ?B_TREE_19_19)),
    ?assertEqual({value, "v_12"}, b_trees:lookup("k_12", ?B_TREE_19_19)),
    ?assertEqual({value, "v_13"}, b_trees:lookup("k_13", ?B_TREE_19_19)),
    ?assertEqual({value, "v_14"}, b_trees:lookup("k_14", ?B_TREE_19_19)),
    ?assertEqual({value, "v_15"}, b_trees:lookup("k_15", ?B_TREE_19_19)),
    ?assertEqual({value, "v_16"}, b_trees:lookup("k_16", ?B_TREE_19_19)),
    ?assertEqual({value, "v_17"}, b_trees:lookup("k_17", ?B_TREE_19_19)),
    ?assertEqual({value, "v_18"}, b_trees:lookup("k_18", ?B_TREE_19_19)),
    ?assertEqual({value, "v_19"}, b_trees:lookup("k_19", ?B_TREE_19_19)),
    ?assertEqual(none, b_trees:lookup("k_20", ?B_TREE_19_19)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: map - order 4
%%--------------------------------------------------------------------

map_b_tree_order_4_test(_Config) ->
    ?assertEqual(?B_TREE_04_15_UPDATE, b_trees:map(fun map_value_to_new/2, ?B_TREE_04_15)),

    ok.

map_value_to_new(_, Value) ->
    Value ++ "_new".

%%--------------------------------------------------------------------
%% TEST CASES: map - error
%%--------------------------------------------------------------------

map_error_test(_Config) ->
    ?assertException(error, {empty_tree, ?B_TREE_05_00}, b_trees:map(fun map_value_to_new/2, ?B_TREE_05_00)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: number_key_values
%%--------------------------------------------------------------------

number_key_values_test(_Config) ->
    ?assertEqual(0, b_trees:number_key_values(?B_TREE_05_00)),
    ?assertEqual(2, b_trees:number_key_values(?B_TREE_05_02)),
    ?assertEqual(5, b_trees:number_key_values(?B_TREE_05_05)),
    ?assertEqual(16, b_trees:number_key_values(?B_TREE_05_16)),
    ?assertEqual(29, b_trees:number_key_values(?B_TREE_05_29)),
    ?assertEqual(19, b_trees:number_key_values(?B_TREE_19_19)),
    ?assertEqual(80, b_trees:number_key_values(?B_TREE_07_80)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: size
%%--------------------------------------------------------------------

size_test(_Config) ->
    ?assertEqual(0, b_trees:size(b_trees:empty(5))),
    ?assertEqual(1, b_trees:size(?B_TREE_05_01)),
    ?assertEqual(3, b_trees:size(?B_TREE_05_05)),
    ?assertEqual(5, b_trees:size(?B_TREE_05_11)),
    ?assertEqual(8, b_trees:size(?B_TREE_05_16)),
    ?assertEqual(10, b_trees:size(?B_TREE_05_21)),
    ?assertEqual(0, b_trees:size(b_trees:empty(5, b_star))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: smallest
%%--------------------------------------------------------------------

smallest_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:smallest(?B_TREE_05_00)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_05_01)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_05_02)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_05_05)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_05_09)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_05_16)),
    ?assertEqual({"k_01", "v_01"}, b_trees:smallest(?B_TREE_19_19)),
    ?assertEqual({"k_011", "v_011"}, b_trees:smallest(?B_TREE_07_80)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: take_largest
%%--------------------------------------------------------------------

take_largest_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:take_largest(?B_TREE_05_00)),

    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 3, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 6, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 9, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 12, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 15, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 18, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 21, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 24, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 27, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_largest_b_tree(4, 30, 2)),

    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 4, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 8, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 12, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 16, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 20, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 24, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 28, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 32, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 36, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_largest_b_tree(5, 40, 2)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: take_largest
%%--------------------------------------------------------------------

take_smallest_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:take_smallest(?B_TREE_05_00)),

    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 3, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 6, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 9, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 12, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 15, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 18, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 21, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 24, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 27, 2)),
    ?assertEqual(?B_TREE_04_00, test_generator:take_smallest_b_tree(4, 30, 2)),

    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 4, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 8, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 12, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 16, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 20, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 24, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 28, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 32, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 36, 2)),
    ?assertEqual(?B_TREE_05_00, test_generator:take_smallest_b_tree(5, 40, 2)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: to_list
%%--------------------------------------------------------------------

to_list_test(_Config) ->
    ?assertException(error, {empty_tree, _}, b_trees:to_list(?B_TREE_05_00)),

    ?assertEqual([{"k_01", "v_01"}], b_trees:to_list(?B_TREE_05_01)),

    _KeyValues_05_02 = b_trees:to_list(?B_TREE_05_02),
    ?assertEqual(test_generator:generate_key_values_from(2, 2), _KeyValues_05_02),
    ?assertEqual(2, length(KeyValues_05_02)),

    _KeyValues_05_05 = b_trees:to_list(?B_TREE_05_05),
    ?assertEqual(test_generator:generate_key_values_from(5, 2), _KeyValues_05_05),
    ?assertEqual(5, length(KeyValues_05_05)),

    _KeyValues_05_09 = b_trees:to_list(?B_TREE_05_09),
    ?assertEqual(test_generator:generate_key_values_from(9, 2), _KeyValues_05_09),
    ?assertEqual(9, length(KeyValues_05_09)),

    _KeyValues_05_16 = b_trees:to_list(?B_TREE_05_16),
    ?assertEqual(test_generator:generate_key_values_from(16, 2), _KeyValues_05_16),
    ?assertEqual(16, length(KeyValues_05_16)),

    ?assertEqual(80, length(b_trees:to_list(?B_TREE_07_80))),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: update - order 4
%%--------------------------------------------------------------------

update_b_tree_order_4_test(_Config) ->
    _BTree_04_15_K_01 = b_trees:update("k_01", "v_01_new", ?B_TREE_04_15),
    _BTree_04_15_K_02 = b_trees:update("k_02", "v_02_new", _BTree_04_15_K_01),
    _BTree_04_15_K_03 = b_trees:update("k_03", "v_03_new", _BTree_04_15_K_02),
    _BTree_04_15_K_04 = b_trees:update("k_04", "v_04_new", _BTree_04_15_K_03),
    _BTree_04_15_K_05 = b_trees:update("k_05", "v_05_new", _BTree_04_15_K_04),
    _BTree_04_15_K_06 = b_trees:update("k_06", "v_06_new", _BTree_04_15_K_05),
    _BTree_04_15_K_07 = b_trees:update("k_07", "v_07_new", _BTree_04_15_K_06),
    _BTree_04_15_K_08 = b_trees:update("k_08", "v_08_new", _BTree_04_15_K_07),
    _BTree_04_15_K_09 = b_trees:update("k_09", "v_09_new", _BTree_04_15_K_08),
    _BTree_04_15_K_10 = b_trees:update("k_10", "v_10_new", _BTree_04_15_K_09),
    _BTree_04_15_K_11 = b_trees:update("k_11", "v_11_new", _BTree_04_15_K_10),
    _BTree_04_15_K_12 = b_trees:update("k_12", "v_12_new", _BTree_04_15_K_11),
    _BTree_04_15_K_13 = b_trees:update("k_13", "v_13_new", _BTree_04_15_K_12),
    _BTree_04_15_K_14 = b_trees:update("k_14", "v_14_new", _BTree_04_15_K_13),
    ?assertEqual(?B_TREE_04_15_UPDATE, b_trees:update("k_15", "v_15_new", _BTree_04_15_K_14)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: update - error
%%--------------------------------------------------------------------

update_error_test(_Config) ->
    ?assertException(error, {key_not_found, "k_00"}, b_trees:update("k_00", "v_00_new", ?B_TREE_05_00)),
    ?assertException(error, {key_not_found, "k_00"}, b_trees:update("k_00", "v_00_new", ?B_TREE_05_02)),
    ?assertException(error, {key_not_found, "k_00"}, b_trees:update("k_00", "v_00_new", ?B_TREE_05_29)),
    ?assertException(error, {key_not_found, "k_30"}, b_trees:update("k_30", "v_30_new", ?B_TREE_05_29)),
    ?assertException(error, {key_not_found, "k_000"}, b_trees:update("k_000", "v_000_new", ?B_TREE_07_80)),
    ?assertException(error, {key_not_found, "k_999"}, b_trees:update("k_999", "v_999_new", ?B_TREE_07_80)),
    ?assertException(error, {key_not_found, "k_00"}, b_trees:update("k_00", "v_00_new", ?B_TREE_08_64)),
    ?assertException(error, {key_not_found, "k_65"}, b_trees:update("k_65", "v_65_new", ?B_TREE_08_64)),

    ok.

%%--------------------------------------------------------------------
%% TEST CASES: values
%%--------------------------------------------------------------------

values_test(_Config) ->
    ?assertEqual([], b_trees:values(?B_TREE_05_00)),

    ?assertEqual(["v_01"], b_trees:values(?B_TREE_05_01)),

    ?assertEqual(2, length(b_trees:values(?B_TREE_05_02))),
    ?assertEqual(5, length(b_trees:values(?B_TREE_05_05))),
    ?assertEqual(9, length(b_trees:values(?B_TREE_05_09))),
    ?assertEqual(16, length(b_trees:values(?B_TREE_05_16))),
    ?assertEqual(80, length(b_trees:values(?B_TREE_07_80))),

    ok.

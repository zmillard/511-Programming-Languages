-module(interp).
-export([scanAndParse/1,runFile/1,runStr/1]).
-include("types.hrl").

%% Zoe Millard && Ayse Akin
%% 11/4/17, HW3
%% "I pledge my honor that I have abided by the Stevens Honor System"-zm, aa

loop(InFile,Acc) ->
    case io:request(InFile,{get_until,prompt,lexer,token,[1]}) of
        {ok,Token,_EndLine} ->
            loop(InFile,Acc ++ [Token]);
        {error,token} ->
            exit(scanning_error);
        {eof,_} ->
            Acc
    end.

scanAndParse(FileName) ->
    {ok, InFile} = file:open(FileName, [read]),
    Acc = loop(InFile,[]),
    file:close(InFile),
    {Result, AST} = parser:parse(Acc),
    case Result of 
	ok -> AST;
	_ -> io:format("Parse error~n")
    end.


-spec runFile(string()) -> valType().
runFile(FileName) ->
    valueOf(scanAndParse(FileName),env:new()).

scanAndParseString(String) ->
    {_ResultL, TKs, _L} = lexer:string(String),
    parser:parse(TKs).

-spec runStr(string()) -> valType().
runStr(String) ->
    {Result, AST} = scanAndParseString(String),
    case Result  of 
    	ok -> valueOf(AST,env:new());
    	_ -> io:format("Parse error~n")
    end.


-spec numVal2Num(numValType()) -> integer().
numVal2Num({num, N}) ->
    N.

-spec boolVal2Bool(boolValType()) -> boolean().
boolVal2Bool({bool, B}) ->
    B.

-spec valueOf(expType(),envType()) -> valType().

%%underscore is a place holder, needs a filler val in order to run
valueOf({numExp, {num, _, Value}}, Env) ->
    {num, Value};

valueOf({idExp, {id, _, IdValue}}, Env) ->
    case env:lookup(Env, IdValue) of
        {ok, Val} -> Val;
        _else -> IdValue
    end;

valueOf({diffExp, Left, Right}, Env) ->
    LeftVal = numVal2Num(valueOf(Left, Env)),
    RightVal = numVal2Num(valueOf(Right, Env)),
    {num, (LeftVal - RightVal)};

valueOf({plusExp, Left, Right}, Env) ->
    LeftVal = numVal2Num(valueOf(Left, Env)),
    RightVal = numVal2Num(valueOf(Right, Env)),
    {num, (LeftVal + RightVal)};

valueOf({isZeroExp, NumExp},Env) ->
    ZeroTestingVal = numVal2Num(valueOf(NumExp,Env)),
    {bool, (ZeroTestingVal =:= 0)};

valueOf({ifThenElseExp, IfCheck,ThenExp,ElseExp},Env) ->
    TorF = valueOf(IfCheck,Env),
    case boolVal2Bool(TorF) of
        true -> valueOf(ThenExp,Env);
        _Else -> valueOf(ElseExp,Env)
    end;

valueOf({letExp, {id, _, Var}, Value, Exp}, Env) ->
    LetExpVal = valueOf(Value, Env),
    valueOf(Exp, env:add(Env, Var, LetExpVal));

valueOf({procExp, Value, Body}, Env) ->
    IdExpVal = valueOf({idExp, Value}, Env),
    {proc, IdExpVal, Body, Env};

valueOf({appExp, IdExp, Value},Env) ->
    case valueOf(IdExp, Env) of
        {proc,Param,Body, Fill} ->
            Env2 = {letExp,{id,1,Param},Value,Body},
            valueOf(Env2, Fill);
        _else ->
            valueOf(Value,Env)
    end.
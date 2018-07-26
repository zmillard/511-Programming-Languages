-module(makeup_Millard).
-compile(export_all).

readlines ( FileName ) ->
	{ok , Device } = file : open ( FileName , [ read ]) ,
	try get_all_lines ( Device )
		after file : close ( Device )
	end .

get_all_lines ( Device ) ->
	R = make_ref(),
	case io : get_line ( Device , "") of
		eof -> [];
		Line -> Ss = string : tokens ( Line ," ,\n"),
		[{ hd ( Ss ), tl ( Ss )}] ++ get_all_lines ( Device ),

		Content = hd ( Ss ),
		Content2 = re:replace(Content, "node", "", [global,{return,list}]),
		I = list_to_integer(Content2),

		Content3 = tl ( Ss ),
		Content4 = re:replace(Content3, "node", "", [global,{return,list}]),


		S = spawn(?MODULE,sensor,[I, R, Content4]),
		T = spawn(?MODULE,timer, [20])
	end .

sensor(Pid, Temp, Neighbors) ->
	receive
		{From, Temp, directReading} ->
			sensor(Pid, Temp, Neighbors),
			From!{self(), Temp, ok};
		{From, tick} ->
			From!{self(), tick}
	end.

timer(Amount) ->
	timer:sleep(rand:uniform(Amount)),
	receive
		{From, tick}->
			From!{self(), tick}
	end.



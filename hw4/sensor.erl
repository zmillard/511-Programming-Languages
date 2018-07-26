-module(sensor).
-compile(export_all).
% "I pledge my honor that I have abided by the Stevens Honor System" -ZM, AA


%%sensor()->
	%% has id
	%% measurement_num = rand:uniform(11)
	%% sleep_time = rand:uniform(1000),
	%% timer:sleep(sleep_time)
	%% if measurement_num < 11 ->
	%%		%% report it to the watcher process
	%% else_
	%% 		%% log "anomalous_reading"
	%% generates measurement report with {ID, measurement_num}

%%watcher()->
	%% maintain list of sensors (tuples of ID)

-author("Ayse Akin & Zoe Millard").

reportMeasurement(WPID, SID) ->
	Measurement = rand:uniform(11),
	if Measurement == 11 ->
		WPID ! {kill, {self(), SID}, "analomous reading"},
		exit("analomous reading");
	true ->
		WPID ! {Measurement, {self(), SID}}
	end,
	receive
		{ok} ->
			Sleep_time = rand:uniform(10000),
			timer:sleep(Sleep_time),
			reportMeasurement(WPID, SID)
	end.
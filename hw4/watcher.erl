-module(watcher).
-compile(export_all).
-author("Zoe Millard & Ayse Akin").

% "I pledge my honor that I have abided by the Stevens Honor System" -ZM, AA

updateSensor(SensorList, Sensor_ID) ->
	{SensorPID, _} = spawn_monitor(sensor, reportMeasurement, [self(), Sensor_ID]),
	io:fwrite("Restarted sensor: ~p, new PID:~p~n", [Sensor_ID, SensorPID]),
	SensorList_new = lists:merge(SensorList, [{Sensor_ID, SensorPID}]),
	io:fwrite("Sensor List: ~w~n", [SensorList_new]),
	receiveSignal(SensorList_new).

receiveSignal(SensorList) ->
	receive
		{kill, {From, SID}, "analomous reading"}->
			io:fwrite("Sensor: ~p killed due to analomous reading ~n", [SID]),
			updateSensor(lists:delete({SID, From}, SensorList), SID);
		{Measurement, {From, SID}} ->
			io:fwrite("Sensor: ~4p with message: ~2p~n", [SID, Measurement]),
			From ! {ok},
			receiveSignal(SensorList)
	end. 

setup_loop(N, Num_watchers, SensorList, SensorID) -> 
	if 
		length(SensorList) == 10 -> 
			io:fwrite("Sensor List: ~w~n", [SensorList]),
			if 
				N /= 0 ->
					spawn(?MODULE, setup_loop, [N, Num_watchers, [], SensorID + 1]), 
					receiveSignal(SensorList);
				true ->
					receiveSignal(SensorList)
			end;
		N == 0 ->
			io:fwrite("Sensor List: ~w~n", [SensorList]),
			receiveSignal(SensorList);
		true ->
			{SensorPID, _} = spawn_monitor(sensor, reportMeasurement, [self(), SensorID]),
			TempList = lists:merge(SensorList, [{SensorID, SensorPID}]),
			setup_loop(N-1, Num_watchers, TempList, SensorID+1)
	end.

start() ->
    {ok, [ N ]} = io:fread("enter number of sensors: ", "~d") ,
    if 
    	N =< 1 ->
        	io:fwrite("setup: range must be at least 2~n", []) ;
       	true -> 
        	Num_watchers = 1 + (N div 10) ,
        	io:fwrite("~i~n", [Num_watchers]),
        	setup_loop(N, Num_watchers, [], 0)
 	end.
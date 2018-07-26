# define N 5 /* Number of processes in the ring */
# define L 10 /* size of the buffer is N*2 */
byte I;

mtype = {one, leader}; 
chan q[N] = [ L] of { mtype , byte }; 


proctype nnode ( chan inp , out ; byte mynumber)
{
	bit Active;
	byte nr;
	xr inp;
	xs out;

	Active = 1;

	out!one(mynumber);

	end:do
	:: inp?one (nr) ->

		if
		:: Active ->
			if
			:: nr == mynumber ->
				printf (" I am node %d and I know the leader is %d\n", mynumber, nr);
				out! leader(nr);
				break
			:: nr > mynumber -> 
				out! one(nr);
				Active--
			:: nr < mynumber ->
				printf (" I am a not a leader : %d\n", nr);
			fi
		:: else
			out! one(nr)
		fi
	:: inp?leader (nr) ->
		printf (" I am node %d and I know the leader is %d\n", mynumber, nr);
		out! leader(nr);
		break
	od

}

init {
	byte proc ;
	byte Ini [6]; /* N <=6 randomize the process numbers */
	atomic {
		I = 1; /* pick a number to be assigned 1.. N */
		do
		:: I <= N ->
				if /* non - deterministic choice */
				:: Ini [0] == 0 && N >= 1 -> Ini [0] = I
				:: Ini [1] == 0 && N >= 2 -> Ini [1] = I
				:: Ini [2] == 0 && N >= 3 -> Ini [2] = I
				:: Ini [3] == 0 && N >= 4 -> Ini [3] = I
				:: Ini [4] == 0 && N >= 5 -> Ini [4] = I
				:: Ini [5] == 0 && N >= 6 -> Ini [5] = I /* works for up to N=6 */
				fi;
				I ++
		:: I > N -> /* assigned all numbers 1..N */
				break
		od;

		/* start all nodes in the ring */
		proc = 1;
		do
		:: proc <= N ->
				run nnode (q [ proc -1] , q[ proc %N] , Ini [ proc -1]);
				proc ++
		:: proc > N ->
				break
		od
	}
}

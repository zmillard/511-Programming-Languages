proctype nnode
	state   1 -(tr  19)-> state  18  [id   0 tp   5] [----L] cr_lea.pml:17 => out!mynumber
	state  18 -(tr  20)-> state  16  [id   1 tp 504] [--e-L] cr_lea.pml:21 => inp?one,nr
	state  16 -(tr  21)-> state  12  [id   2 tp   2] [----L] cr_lea.pml:24 => (Active)
	state  16 -(tr   2)-> state  15  [id  13 tp   2] [----L] cr_lea.pml:24 => else
	state  12 -(tr  22)-> state  21  [id   3 tp   2] [----L] cr_lea.pml:26 => ((nr==mynumber))
	state  12 -(tr  23)-> state   8  [id   6 tp   2] [----L] cr_lea.pml:26 => ((nr>mynumber))
	state  12 -(tr  25)-> state  18  [id   9 tp   2] [----L] cr_lea.pml:26 => ((nr<mynumber))
	state  21 -(tr  27)-> state   0  [id  20 tp 3500] [--e-L] cr_lea.pml:39 => -end-
	state   8 -(tr  24)-> state  18  [id   7 tp   5] [----L] cr_lea.pml:30 => out!one,nr
	state  15 -(tr  26)-> state  18  [id  14 tp   5] [----L] cr_lea.pml:36 => out!one,nr
init
	state  32 -(tr   3)-> state  20  [id  21 tp   2] [A---G] cr_lea.pml:45 => I = 1
	state  20 -(tr   4)-> state  15  [id  22 tp   2] [A---G] cr_lea.pml:47 => ((I<=5))
	state  20 -(tr  12)-> state  29  [id  38 tp   2] [A---G] cr_lea.pml:47 => ((I>5))
	state  15 -(tr   5)-> state  20  [id  23 tp   2] [A---G] cr_lea.pml:49 => (((Ini[0]==0)&&(5>=1)))
	state  15 -(tr   6)-> state  20  [id  25 tp   2] [A---G] cr_lea.pml:49 => (((Ini[1]==0)&&(5>=2)))
	state  15 -(tr   7)-> state  20  [id  27 tp   2] [A---G] cr_lea.pml:49 => (((Ini[2]==0)&&(5>=3)))
	state  15 -(tr   8)-> state  20  [id  29 tp   2] [A---G] cr_lea.pml:49 => (((Ini[3]==0)&&(5>=4)))
	state  15 -(tr   9)-> state  20  [id  31 tp   2] [A---G] cr_lea.pml:49 => (((Ini[4]==0)&&(5>=5)))
	state  15 -(tr  10)-> state  20  [id  33 tp   2] [A---G] cr_lea.pml:49 => (((Ini[5]==0)&&(5>=6)))
	state  29 -(tr  14)-> state  25  [id  44 tp   2] [A---G] cr_lea.pml:64 => ((proc<=5))
	state  29 -(tr  17)-> state  31  [id  47 tp   2] [A---G] cr_lea.pml:64 => ((proc>5))
	state  25 -(tr  15)-> state  26  [id  45 tp   2] [A---G] cr_lea.pml:65 => (run nnode(q[(proc-1)],q[(proc%5)],Ini[(proc-1)]))
	state  26 -(tr  16)-> state  29  [id  46 tp   2] [A---G] cr_lea.pml:66 => proc = (proc+1)
	state  31 -(tr   1)-> state  33  [id  51 tp   2] [----G] cr_lea.pml:63 => break
	state  33 -(tr  18)-> state   0  [id  53 tp 3500] [--e-L] cr_lea.pml:71 => -end-

Transition Type: A=atomic; D=d_step; L=local; G=global
Source-State Labels: p=progress; e=end; a=accept;
Note: statement merging was used. Only the first
      stmnt executed in each merge sequence is shown
      (use spin -a -o3 to disable statement merging)

pan: elapsed time 0.002 seconds

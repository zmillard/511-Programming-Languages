	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM p1 */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: // STATE 1
		;
		now.I = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 7: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 8: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 9: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 10: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 11: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[4] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 12: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[5] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 13: // STATE 17
		;
		now.I = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 23
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 23
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 25
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 18: // STATE 26
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 27
		;
	/* 0 */	((P1 *)this)->proc = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 33
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC nnode */
;
		;
		
	case 22: // STATE 2
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 23: // STATE 3
		;
		XX = 1;
		unrecv(((P0 *)this)->inp, XX-1, 0, 3, 1);
		unrecv(((P0 *)this)->inp, XX-1, 1, ((int)((P0 *)this)->nr), 0);
		((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		
	case 26: // STATE 7
		;
		((P0 *)this)->neighbourR = trpt->bup.oval;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 27: // STATE 9
		;
		((P0 *)this)->know_winner = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 10
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 29: // STATE 14
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 30: // STATE 17
		;
		XX = 1;
		unrecv(((P0 *)this)->inp, XX-1, 0, 2, 1);
		unrecv(((P0 *)this)->inp, XX-1, 1, ((int)((P0 *)this)->nr), 0);
		((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 32: // STATE 20
		;
		((P0 *)this)->maximum = trpt->bup.ovals[2];
	/* 1 */	((P0 *)this)->maximum = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->nr = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 33: // STATE 21
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 34: // STATE 23
		;
		((P0 *)this)->Active = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 27
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 36: // STATE 30
		;
		XX = 1;
		unrecv(((P0 *)this)->inp, XX-1, 0, 1, 1);
		unrecv(((P0 *)this)->inp, XX-1, 1, ((int)((P0 *)this)->nr), 0);
		((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;

	case 37: // STATE 31
		;
	/* 0 */	((P0 *)this)->mynumber = trpt->bup.oval;
		;
		;
		goto R999;

	case 38: // STATE 34
		;
		now.nr_leaders = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 38
		;
	/* 0 */	((P0 *)this)->know_winner = trpt->bup.oval;
		;
		;
		goto R999;

	case 41: // STATE 40
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 42: // STATE 47
		;
		p_restor(II);
		;
		;
		goto R999;
	}


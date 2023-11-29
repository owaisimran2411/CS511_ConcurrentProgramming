	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		now.track[0] = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 2
		;
		now.track[1] = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 3
		;
		now.passengerCount[0] = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 4
		;
		now.passengerCount[1] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 5
		;
		((P3 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 9
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 14
		;
		((P3 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 20
		;
		((P3 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 22
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 23
		;
		((P3 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 29
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 31
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC LoadingMachine */
;
		;
		;
		;
		
	case 20: // STATE 4
		;
		now.permToLoad = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 7
		;
		now.doneLoading = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC FreightTrain */
;
		;
		;
		;
		
	case 25: // STATE 4
		;
		now.track[0] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 8
		;
		now.track[1] = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 11
		;
		now.permToLoad = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 14
		;
		now.doneLoading = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 17
		;
		now.freightCount = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 18
		;
		now.track[0] = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 22
		;
		now.freightCount = trpt->bup.ovals[1];
		now.track[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 32: // STATE 24
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC PassengerTrain */
;
		;
		;
		;
		
	case 35: // STATE 7
		;
		now.passengerCount[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.ovals[1];
		now.track[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 36: // STATE 11
		;
		now.passengerCount[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.ovals[1];
		now.track[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 37: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}


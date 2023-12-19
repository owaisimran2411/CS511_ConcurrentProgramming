	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC validate */
;
		;
		
	case 4: // STATE 2
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC patriots */

	case 5: // STATE 6
		;
		now.pCount = trpt->bup.ovals[2];
		now.ticket = trpt->bup.ovals[1];
		now.mutex = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 6: // STATE 7
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC jets */
;
		;
		
	case 9: // STATE 8
		;
		now.jCount = trpt->bup.ovals[3];
		now.ticket = trpt->bup.ovals[2];
		now.ticket = trpt->bup.ovals[1];
		now.mutex = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 10: // STATE 9
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 16
		;
		p_restor(II);
		;
		;
		goto R999;
	}


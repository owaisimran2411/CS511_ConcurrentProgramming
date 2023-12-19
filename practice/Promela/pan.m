#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC validate */
	case 3: // STATE 1 - q10.pml:41 - [assert(((((pCount*2)>=jCount)&&(pCount>=0))&&(jCount>=0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		spin_assert(((((((int)now.pCount)*2)>=((int)now.jCount))&&(((int)now.pCount)>=0))&&(((int)now.jCount)>=0)), "((((pCount*2)>=jCount)&&(pCount>=0))&&(jCount>=0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q10.pml:42 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC patriots */
	case 5: // STATE 1 - q10.pml:8 - [((mutex>0))] (8:0:3 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(8, 2, 8) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		/* merge: ticket = (ticket+1)(8, 5, 8) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.ticket);
		now.ticket = (((int)now.ticket)+1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		/* merge: pCount = (pCount+1)(8, 6, 8) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.pCount);
		now.pCount = (((int)now.pCount)+1);
#ifdef VAR_RANGES
		logval("pCount", ((int)now.pCount));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 6: // STATE 7 - q10.pml:13 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 10 - q10.pml:38 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC jets */
	case 8: // STATE 1 - q10.pml:19 - [((ticket>1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.ticket)>1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - q10.pml:8 - [((mutex>0))] (10:0:4 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(10, 3, 10) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		/* merge: ticket = (ticket-1)(10, 6, 10) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		/* merge: ticket = (ticket-1)(10, 7, 10) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		/* merge: jCount = (jCount+1)(10, 8, 10) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.jCount);
		now.jCount = (((int)now.jCount)+1);
#ifdef VAR_RANGES
		logval("jCount", ((int)now.jCount));
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 10: // STATE 9 - q10.pml:13 - [mutex = (mutex+1)] (0:16:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		/* merge: goto :b0(16, 11, 16) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 11: // STATE 16 - q10.pml:29 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[0][16] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}


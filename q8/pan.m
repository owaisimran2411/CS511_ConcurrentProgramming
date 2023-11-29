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

		 /* PROC :init: */
	case 3: // STATE 1 - tr.pml:69 - [track[0] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		(trpt+1)->bup.oval = ((int)now.track[0]);
		now.track[0] = 1;
#ifdef VAR_RANGES
		logval("track[0]", ((int)now.track[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - tr.pml:70 - [track[1] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((int)now.track[1]);
		now.track[1] = 1;
#ifdef VAR_RANGES
		logval("track[1]", ((int)now.track[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - tr.pml:71 - [passengerCount[0] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		(trpt+1)->bup.oval = ((int)now.passengerCount[0]);
		now.passengerCount[0] = 0;
#ifdef VAR_RANGES
		logval("passengerCount[0]", ((int)now.passengerCount[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - tr.pml:72 - [passengerCount[1] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((int)now.passengerCount[1]);
		now.passengerCount[1] = 1;
#ifdef VAR_RANGES
		logval("passengerCount[1]", ((int)now.passengerCount[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - tr.pml:75 - [i = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->i);
		((P3 *)_this)->i = 1;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P3 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - tr.pml:75 - [((i<=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!((((int)((P3 *)_this)->i)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - tr.pml:77 - [(run PassengerTrain(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][7] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 9 - tr.pml:78 - [(run PassengerTrain(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][9] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 14 - tr.pml:75 - [i = (i+1)] (0:17:1 - 5)
		IfNotBlocked
		reached[3][14] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->i);
		((P3 *)_this)->i = (((int)((P3 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P3 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[3][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 20 - tr.pml:81 - [i = 0] (0:26:1 - 3)
		IfNotBlocked
		reached[3][20] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->i);
		((P3 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P3 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[3][27] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 21 - tr.pml:81 - [((i<=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][21] = 1;
		if (!((((int)((P3 *)_this)->i)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 22 - tr.pml:82 - [(run FreightTrain())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][22] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 23 - tr.pml:81 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][23] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->i);
		((P3 *)_this)->i = (((int)((P3 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P3 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 29 - tr.pml:84 - [(run LoadingMachine())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][29] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 31 - tr.pml:86 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][31] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC LoadingMachine */
	case 18: // STATE 1 - tr.pml:61 - [assert(((passengerCount[0]==0)&&(passengerCount[1]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		spin_assert(((((int)now.passengerCount[0])==0)&&(((int)now.passengerCount[1])==0)), "((passengerCount[0]==0)&&(passengerCount[1]==0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 2 - tr.pml:62 - [assert((freightCount==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		spin_assert((((int)now.freightCount)==1), "(freightCount==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 3 - tr.pml:11 - [((permToLoad>0))] (8:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!((((int)now.permToLoad)>0)))
			continue;
		/* merge: permToLoad = (permToLoad-1)(0, 4, 8) */
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((int)now.permToLoad);
		now.permToLoad = (((int)now.permToLoad)-1);
#ifdef VAR_RANGES
		logval("permToLoad", ((int)now.permToLoad));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 7 - tr.pml:15 - [doneLoading = (doneLoading+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((int)now.doneLoading);
		now.doneLoading = (((int)now.doneLoading)+1);
#ifdef VAR_RANGES
		logval("doneLoading", ((int)now.doneLoading));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 9 - tr.pml:65 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC FreightTrain */
	case 23: // STATE 1 - tr.pml:38 - [assert(((passengerCount[0]==0)&&(passengerCount[1]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		spin_assert(((((int)now.passengerCount[0])==0)&&(((int)now.passengerCount[1])==0)), "((passengerCount[0]==0)&&(passengerCount[1]==0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 2 - tr.pml:39 - [assert((freightCount==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		spin_assert((((int)now.freightCount)==0), "(freightCount==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 3 - tr.pml:11 - [((track[0]>0))] (10:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((int)now.track[0])>0)))
			continue;
		/* merge: track[0] = (track[0]-1)(0, 4, 10) */
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)now.track[0]);
		now.track[0] = (((int)now.track[0])-1);
#ifdef VAR_RANGES
		logval("track[0]", ((int)now.track[0]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 7 - tr.pml:11 - [((track[1]>0))] (12:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!((((int)now.track[1])>0)))
			continue;
		/* merge: track[1] = (track[1]-1)(0, 8, 12) */
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((int)now.track[1]);
		now.track[1] = (((int)now.track[1])-1);
#ifdef VAR_RANGES
		logval("track[1]", ((int)now.track[1]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 27: // STATE 11 - tr.pml:15 - [permToLoad = (permToLoad+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)now.permToLoad);
		now.permToLoad = (((int)now.permToLoad)+1);
#ifdef VAR_RANGES
		logval("permToLoad", ((int)now.permToLoad));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 13 - tr.pml:11 - [((doneLoading>0))] (17:0:1 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!((((int)now.doneLoading)>0)))
			continue;
		/* merge: doneLoading = (doneLoading-1)(0, 14, 17) */
		reached[1][14] = 1;
		(trpt+1)->bup.oval = ((int)now.doneLoading);
		now.doneLoading = (((int)now.doneLoading)-1);
#ifdef VAR_RANGES
		logval("doneLoading", ((int)now.doneLoading));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 29: // STATE 17 - tr.pml:47 - [freightCount = (freightCount+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.freightCount);
		now.freightCount = (((int)now.freightCount)+1);
#ifdef VAR_RANGES
		logval("freightCount", ((int)now.freightCount));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 18 - tr.pml:15 - [track[0] = (track[0]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		(trpt+1)->bup.oval = ((int)now.track[0]);
		now.track[0] = (((int)now.track[0])+1);
#ifdef VAR_RANGES
		logval("track[0]", ((int)now.track[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 20 - tr.pml:15 - [track[1] = (track[1]+1)] (0:24:2 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.track[1]);
		now.track[1] = (((int)now.track[1])+1);
#ifdef VAR_RANGES
		logval("track[1]", ((int)now.track[1]));
#endif
		;
		/* merge: freightCount = (freightCount-1)(24, 22, 24) */
		reached[1][22] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.freightCount);
		now.freightCount = (((int)now.freightCount)-1);
#ifdef VAR_RANGES
		logval("freightCount", ((int)now.freightCount));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 32: // STATE 24 - tr.pml:56 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC PassengerTrain */
	case 33: // STATE 1 - tr.pml:19 - [assert((freightCount==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		spin_assert((((int)now.freightCount)==0), "(freightCount==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 2 - tr.pml:20 - [assert((passengerCount[i]!=0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		spin_assert((((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ])!=0), "(passengerCount[i]!=0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 3 - tr.pml:11 - [((track[i]>0))] (12:0:2 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)now.track[ Index(((P0 *)_this)->i, 2) ])>0)))
			continue;
		/* merge: track[i] = (track[i]-1)(12, 4, 12) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.track[ Index(((P0 *)_this)->i, 2) ]);
		now.track[ Index(((P0 *)_this)->i, 2) ] = (((int)now.track[ Index(((P0 *)_this)->i, 2) ])-1);
#ifdef VAR_RANGES
		logval("track[PassengerTrain:i]", ((int)now.track[ Index(((P0 *)_this)->i, 2) ]));
#endif
		;
		/* merge: passengerCount[i] = (passengerCount[i]+1)(12, 7, 12) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ]);
		now.passengerCount[ Index(((P0 *)_this)->i, 2) ] = (((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ])+1);
#ifdef VAR_RANGES
		logval("passengerCount[PassengerTrain:i]", ((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 9 - tr.pml:15 - [track[i] = (track[i]+1)] (0:13:2 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.track[ Index(((P0 *)_this)->i, 2) ]);
		now.track[ Index(((P0 *)_this)->i, 2) ] = (((int)now.track[ Index(((P0 *)_this)->i, 2) ])+1);
#ifdef VAR_RANGES
		logval("track[PassengerTrain:i]", ((int)now.track[ Index(((P0 *)_this)->i, 2) ]));
#endif
		;
		/* merge: passengerCount[i] = (passengerCount[i]-1)(13, 11, 13) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ]);
		now.passengerCount[ Index(((P0 *)_this)->i, 2) ] = (((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ])-1);
#ifdef VAR_RANGES
		logval("passengerCount[PassengerTrain:i]", ((int)now.passengerCount[ Index(((P0 *)_this)->i, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 37: // STATE 13 - tr.pml:33 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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


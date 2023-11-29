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

		 /* PROC Monitor */
	case 3: // STATE 1 - ex1.pml:32 - [assert(((x>=-(1))&&(x<=200)))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		spin_assert(((now.x>= -(1))&&(now.x<=200)), "((x>= -(1))&&(x<=200))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - ex1.pml:33 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC R */
	case 5: // STATE 1 - ex1.pml:25 - [((x==200))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((now.x==200)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - ex1.pml:25 - [x = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = now.x;
		now.x = 0;
#ifdef VAR_RANGES
		logval("x", now.x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 10 - ex1.pml:29 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Q */
	case 8: // STATE 1 - ex1.pml:15 - [((x>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.x>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - ex1.pml:15 - [x = (x-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = now.x;
		now.x = (now.x-1);
#ifdef VAR_RANGES
		logval("x", now.x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 10 - ex1.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 11: // STATE 1 - ex1.pml:6 - [((x<200))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.x<200)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - ex1.pml:6 - [x = (x+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.x;
		now.x = (now.x+1);
#ifdef VAR_RANGES
		logval("x", now.x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 10 - ex1.pml:10 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
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


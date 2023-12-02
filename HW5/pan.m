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
	case 3: // STATE 1 - DKR-LEA.pml:80 - [I = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = 1;
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - DKR-LEA.pml:82 - [((I<=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)now.I)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - DKR-LEA.pml:84 - [(((Ini[0]==0)&&(5>=1)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(((((int)((P1 *)_this)->Ini[0])==0)&&(5>=1))))
			continue;
		/* merge: Ini[0] = I(20, 4, 20) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[0]);
		((P1 *)_this)->Ini[0] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[0]", ((int)((P1 *)_this)->Ini[0]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 6: // STATE 5 - DKR-LEA.pml:85 - [(((Ini[1]==0)&&(5>=2)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(((((int)((P1 *)_this)->Ini[1])==0)&&(5>=2))))
			continue;
		/* merge: Ini[1] = I(20, 6, 20) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[1]);
		((P1 *)_this)->Ini[1] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[1]", ((int)((P1 *)_this)->Ini[1]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 7: // STATE 7 - DKR-LEA.pml:86 - [(((Ini[2]==0)&&(5>=3)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(((((int)((P1 *)_this)->Ini[2])==0)&&(5>=3))))
			continue;
		/* merge: Ini[2] = I(20, 8, 20) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[2]);
		((P1 *)_this)->Ini[2] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[2]", ((int)((P1 *)_this)->Ini[2]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 8: // STATE 9 - DKR-LEA.pml:87 - [(((Ini[3]==0)&&(5>=4)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!(((((int)((P1 *)_this)->Ini[3])==0)&&(5>=4))))
			continue;
		/* merge: Ini[3] = I(20, 10, 20) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[3]);
		((P1 *)_this)->Ini[3] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[3]", ((int)((P1 *)_this)->Ini[3]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 9: // STATE 11 - DKR-LEA.pml:88 - [(((Ini[4]==0)&&(5>=5)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!(((((int)((P1 *)_this)->Ini[4])==0)&&(5>=5))))
			continue;
		/* merge: Ini[4] = I(20, 12, 20) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[4]);
		((P1 *)_this)->Ini[4] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[4]", ((int)((P1 *)_this)->Ini[4]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 10: // STATE 13 - DKR-LEA.pml:89 - [(((Ini[5]==0)&&(5>=6)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!(((((int)((P1 *)_this)->Ini[5])==0)&&(5>=6))))
			continue;
		/* merge: Ini[5] = I(20, 14, 20) */
		reached[1][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->Ini[5]);
		((P1 *)_this)->Ini[5] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[5]", ((int)((P1 *)_this)->Ini[5]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 11: // STATE 17 - DKR-LEA.pml:91 - [I = (I+1)] (0:20:1 - 7)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 18 - DKR-LEA.pml:92 - [((I>5))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!((((int)now.I)>5)))
			continue;
		/* merge: goto :b1(29, 19, 29) */
		reached[1][19] = 1;
		;
		/* merge: proc = 1(29, 23, 29) */
		reached[1][23] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->proc);
		((P1 *)_this)->proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)_this)->proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 23 - DKR-LEA.pml:97 - [proc = 1] (0:29:1 - 3)
		IfNotBlocked
		reached[1][23] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->proc);
		((P1 *)_this)->proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)_this)->proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: // STATE 24 - DKR-LEA.pml:99 - [((proc<=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (!((((int)((P1 *)_this)->proc)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 25 - DKR-LEA.pml:100 - [(run nnode(q[(proc-1)],q[(proc%5)],Ini[(proc-1)]))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!(addproc(II, 1, 0, now.q[ Index((((int)((P1 *)_this)->proc)-1), 5) ], now.q[ Index((((int)((P1 *)_this)->proc)%5), 5) ], ((int)((P1 *)_this)->Ini[ Index((((int)((P1 *)_this)->proc)-1), 6) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 26 - DKR-LEA.pml:101 - [proc = (proc+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->proc);
		((P1 *)_this)->proc = (((int)((P1 *)_this)->proc)+1);
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)_this)->proc));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 27 - DKR-LEA.pml:102 - [((proc>5))] (31:0:1 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!((((int)((P1 *)_this)->proc)>5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: proc */  (trpt+1)->bup.oval = ((P1 *)_this)->proc;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->proc = 0;
		/* merge: goto :b2(0, 28, 31) */
		reached[1][28] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 33 - DKR-LEA.pml:106 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][33] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC nnode */
	case 19: // STATE 1 - DKR-LEA.pml:20 - [printf('\\nMSC %d',mynumber)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("\nMSC %d", ((int)((P0 *)_this)->mynumber));
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 2 - DKR-LEA.pml:21 - [out!one,mynumber] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->mynumber)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 3, ((int)((P0 *)_this)->mynumber), 2);
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 3 - DKR-LEA.pml:23 - [inp?one,nr] (0:0:1 - 1)
		reached[0][3] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->inp]&1)
		{	q_R_check(((P0 *)_this)->inp, II);
		}
#endif
		if (q_len(((P0 *)_this)->inp) == 0) continue;

		XX=1;
		if (3 != qrecv(((P0 *)_this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->nr);
		;
		((P0 *)_this)->nr = qrecv(((P0 *)_this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)_this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->inp);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 4 - DKR-LEA.pml:25 - [(Active)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(((int)((P0 *)_this)->Active)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 5 - DKR-LEA.pml:27 - [((nr!=maximum))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)_this)->nr)!=((int)((P0 *)_this)->maximum))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 6 - DKR-LEA.pml:28 - [out!two,nr] (50:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 2, ((int)((P0 *)_this)->nr), 2);
		/* merge: neighbourR = nr(0, 7, 50) */
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->neighbourR);
		((P0 *)_this)->neighbourR = ((int)((P0 *)_this)->nr);
#ifdef VAR_RANGES
		logval("nnode:neighbourR", ((int)((P0 *)_this)->neighbourR));
#endif
		;
		/* merge: .(goto)(0, 12, 50) */
		reached[0][12] = 1;
		;
		/* merge: .(goto)(0, 16, 50) */
		reached[0][16] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[0][51] = 1;
		;
		_m = 2; goto P999; /* 4 */
	case 25: // STATE 9 - DKR-LEA.pml:31 - [know_winner = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->know_winner);
		((P0 *)_this)->know_winner = 1;
#ifdef VAR_RANGES
		logval("nnode:know_winner", ((int)((P0 *)_this)->know_winner));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 10 - DKR-LEA.pml:32 - [out!winner,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 1, ((int)((P0 *)_this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 14 - DKR-LEA.pml:35 - [out!one,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 3, ((int)((P0 *)_this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 17 - DKR-LEA.pml:38 - [inp?two,nr] (0:0:1 - 1)
		reached[0][17] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->inp]&1)
		{	q_R_check(((P0 *)_this)->inp, II);
		}
#endif
		if (q_len(((P0 *)_this)->inp) == 0) continue;

		XX=1;
		if (2 != qrecv(((P0 *)_this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->nr);
		;
		((P0 *)_this)->nr = qrecv(((P0 *)_this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)_this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->inp);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 29: // STATE 18 - DKR-LEA.pml:40 - [(Active)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!(((int)((P0 *)_this)->Active)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 19 - DKR-LEA.pml:42 - [(((neighbourR>nr)&&(neighbourR>maximum)))] (21:0:3 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!(((((int)((P0 *)_this)->neighbourR)>((int)((P0 *)_this)->nr))&&(((int)((P0 *)_this)->neighbourR)>((int)((P0 *)_this)->maximum)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nr */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->nr;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->nr = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: maximum */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->maximum;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->maximum = 0;
		/* merge: maximum = neighbourR(0, 20, 21) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->maximum);
		((P0 *)_this)->maximum = ((int)((P0 *)_this)->neighbourR);
#ifdef VAR_RANGES
		logval("nnode:maximum", ((int)((P0 *)_this)->maximum));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 31: // STATE 21 - DKR-LEA.pml:44 - [out!one,neighbourR] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->neighbourR)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 3, ((int)((P0 *)_this)->neighbourR), 2);
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 23 - DKR-LEA.pml:46 - [Active = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->Active);
		((P0 *)_this)->Active = 0;
#ifdef VAR_RANGES
		logval("nnode:Active", ((int)((P0 *)_this)->Active));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 27 - DKR-LEA.pml:49 - [out!two,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 2, ((int)((P0 *)_this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 30 - DKR-LEA.pml:52 - [inp?winner,nr] (0:0:1 - 1)
		reached[0][30] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->inp]&1)
		{	q_R_check(((P0 *)_this)->inp, II);
		}
#endif
		if (q_len(((P0 *)_this)->inp) == 0) continue;

		XX=1;
		if (1 != qrecv(((P0 *)_this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->nr);
		;
		((P0 *)_this)->nr = qrecv(((P0 *)_this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)_this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->inp);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 35: // STATE 31 - DKR-LEA.pml:54 - [((nr!=mynumber))] (47:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)((P0 *)_this)->nr)!=((int)((P0 *)_this)->mynumber))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: mynumber */  (trpt+1)->bup.oval = ((P0 *)_this)->mynumber;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->mynumber = 0;
		/* merge: printf('\\nMSC %d: LOST',inp)(0, 32, 47) */
		reached[0][32] = 1;
		Printf("\nMSC %d: LOST", ((P0 *)_this)->inp);
		/* merge: .(goto)(0, 43, 47) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 34 - DKR-LEA.pml:57 - [printf('\\nMSC %d: LEADER',inp)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		Printf("\nMSC %d: LEADER", ((P0 *)_this)->inp);
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 35 - DKR-LEA.pml:58 - [assert((nr_leaders<=1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		spin_assert((((int)now.nr_leaders)<=1), "(nr_leaders<=1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 36 - DKR-LEA.pml:61 - [((mynumber==5))] (47:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		if (!((((int)((P0 *)_this)->mynumber)==5)))
			continue;
		/* merge: assert((nr==mynumber))(47, 37, 47) */
		reached[0][37] = 1;
		spin_assert((((int)((P0 *)_this)->nr)==((int)((P0 *)_this)->mynumber)), "(nr==mynumber)", II, tt, t);
		/* merge: .(goto)(47, 39, 47) */
		reached[0][39] = 1;
		;
		/* merge: nr_leaders = (nr_leaders+1)(47, 40, 47) */
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.nr_leaders);
		now.nr_leaders = (((int)now.nr_leaders)+1);
#ifdef VAR_RANGES
		logval("nr_leaders", ((int)now.nr_leaders));
#endif
		;
		/* merge: .(goto)(0, 43, 47) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 39: // STATE 44 - DKR-LEA.pml:69 - [(know_winner)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		if (!(((int)((P0 *)_this)->know_winner)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: know_winner */  (trpt+1)->bup.oval = ((P0 *)_this)->know_winner;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->know_winner = 0;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 46 - DKR-LEA.pml:70 - [out!winner,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)_this)->out]&2)
		{	q_S_check(((P0 *)_this)->out, II);
		}
#endif
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 1, ((int)((P0 *)_this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 41: // STATE 53 - DKR-LEA.pml:74 - [-end-] (0:0:0 - 5)
		IfNotBlocked
		reached[0][53] = 1;
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


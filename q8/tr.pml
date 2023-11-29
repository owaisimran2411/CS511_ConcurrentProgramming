// Name: Muhammad Owais Imran
#define PT 5 /* Number of Passenger Trains */
#define FT 2 /* Number of Freight Trains */
byte permToLoad;   /* machine semaphores, 0 permits by default */
byte doneLoading;
byte track[2];     /* track semaphores */
byte passengerCount[2]; /*variable to count number of passenger train on track i at any given instance */
byte freightCount = 0;  /*variable to count number of freight train at any given instance */

inline acquire(s) {
   atomic { 
    s>0;
    s-- }
}

inline release(s) { s++ }

proctype PassengerTrain(int i) {
  /* complete */
  assert(freightCount == 0); /* (a) No freight trains when passenger train arrives */
  assert(passengerCount[i] == 0); /* (b) No other passenger trains travelling in the same direction */

  atomic {
    acquire(track[i]);
    passengerCount[i]++;
  }
  atomic {
    release(track[i]);
    passengerCount[i]--
  }

  
}


proctype FreightTrain() { 
  /* complete */
  assert(passengerCount[0] == 0 && passengerCount[1] == 0); /* No passenger trains when freight train arrives */
  assert(freightCount == 0); /* No other freight trains when freight train arrives */

  
  acquire(track[0]);
  acquire(track[1]);

  release(permToLoad)
  acquire(doneLoading);
  freightCount++;
  atomic {
    release(track[0]);
    release(track[1]);
    freightCount--;
  }

  
  
}

proctype LoadingMachine() {
  end1: /*  avoids invalid end-state error */

  assert(passengerCount[0] == 0 && passengerCount[1]== 0); /* No passenger trains when loading */
  assert(freightCount == 1); /* Only one freight train */
  acquire(permToLoad);
  release(doneLoading);
}

init {
  byte i;
  track[0]=1;
  track[1]=1;
  passengerCount[0] = 0;
  passengerCount[1] = 1;

  atomic {
    for (i:1..(PT)) {     /* spawn passenger trains */
      do  /* randomly choose a direction */
    	:: run PassengerTrain(0);break
    	:: run PassengerTrain(1);break
      od
    };
    for (i:0..(FT)) {     /* spawn freight trains */
      run FreightTrain()
    };
    run LoadingMachine() /* spawn loading machine */
  }
}

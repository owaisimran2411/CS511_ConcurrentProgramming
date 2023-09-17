// // Exercise 1

// public interface Lock {
//     void lock(int id);
//     void unlock(int id);
// }

// public class Peterson implements Lock {
//     private volatile int last;
//     private volatile boolean[] want;

//     Peterson() {
//         last = 0;
//         want = new boolean[2];
//         want[0] = false;
//         want[1] = false;
//     }

//     void lock(int id) {
//         // complete
//         // for P; theadId=1, want[0]=true, whileLoop= want[1]==true && last=1
//         want[id] = true;
//         last = 1-id;

//         while(want[1-id] && last==(1-id)) {
//             // do nothing and wait
//         }
        
//     }

//     void unlock(int id) {
//         want[id] = false;
//     }

// }

// // sample use
// Lock l = new Peterson();
// int c=0;

// P = Thread.start {
//     10.times {
//         l.lock(0);
//         c++;
//         l.unlock(0);
//     }
// }

// Q = Thread.start {
//     10.times {
//         l.lock(1);
//         c++;
//         l.unlock(1);
//     }
// }

// P.join();
// Q.join();
// println c

/*
 * Name: Muhammad Owais Imran
 * Course Code: CS511-A
 * Assignment: 01 (Threads)
 * Due Date: Sep 17th, 2023
 */
import java.io.*;
import java.util.*;

public class TextSwap {

    private static String readFile(String filename, int chunkSize) throws Exception {
        String line;
        StringBuilder buffer = new StringBuilder();
        File file = new File(filename);
	// The "-1" below is because of this:
	// https://stackoverflow.com/questions/729692/why-should-text-files-end-with-a-newline
	// if ((file.length()-1) % chunkSize!=0)
	//     { throw new Exception("File size not multiple of chunk size"); };
        BufferedReader br = new BufferedReader(new FileReader(file));
        while ((line = br.readLine()) != null){
            buffer.append(line);
        }
        br.close();
        return buffer.toString();
    }

    private static Interval[] getIntervals(int numChunks, int chunkSize) {
        // TODO: Implement me!

        /* Steps to implement this getIntervals method 
            1. Initialize an array of Intervals type having length = numChunks
            2. Iterate according to the size of array and append the coordinates in Interval array object based on some mathematical formula
            3. Return the array 
        */

        Interval[] fileIntervals = new Interval[numChunks];
        for(int i=0; i<numChunks; i++) {
            fileIntervals[i] = new Interval(i*chunkSize, (i*chunkSize)+chunkSize-1);
        }

        return fileIntervals;
    }

    private static List<Character> getLabels(int numChunks) {
        Scanner scanner = new Scanner(System.in);
        List<Character> labels = new ArrayList<Character>();
        int endChar = numChunks == 0 ? 'a' : 'a' + numChunks - 1;
        System.out.printf("Input %d character(s) (\'%c\' - \'%c\') for the pattern.\n", numChunks, 'a', endChar);
        for (int i = 0; i < numChunks; i++) {
            labels.add(scanner.next().charAt(0));
        }
        scanner.close();
        // System.out.println(labels);
        return labels;
    }

    // helper method to map a given label to its corresponding integer index to access the chunk of data
    private static int labelToIndexMapper(char label) {
        int index = label;
        index -= 97;
        return index;
    }

    private static char[] runSwapper(String content, int chunkSize, int numChunks) {
        List<Character> labels = getLabels(numChunks);
        Interval[] intervals = getIntervals(numChunks, chunkSize);
        // TODO: Order the intervals properly, then run the Swapper instances.
        
        /*
         * Steps for Implementation:
         *  1. Reordering the intervals variable based on new label mapping obtained
         *  2. Initialize an empty buffer
         *  3. Executing the swapper instance
         *  4. Wait for all threads to complete execution
         *  5. return the newly filled buffer
         */
        Interval[] newIntervals = new Interval[numChunks];
        for (int i=0; i<numChunks; i++) {
            int indexPosition = labelToIndexMapper(labels.get(i));
            newIntervals[i] = new Interval(intervals[indexPosition].getX(), intervals[indexPosition].getY());
            System.out.println(labels.get(i) + "  "  + indexPosition);
            System.out.println("New Interval:" + newIntervals[i].toString());
        }
        char[] buffer = new char[(chunkSize*numChunks)];
        
        for (int i=0; i<numChunks; i++) {
            Swapper swapper = new Swapper(newIntervals[i], content, buffer, i*chunkSize);
            Thread thread = new Thread(swapper);
            thread.start();

            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(buffer);

        // for(int i=0; i<buffer.length; i++) {
        //     System.out.println(String.format("i=%s, buffer[%s]=%s",i,i,buffer[i]));
        // }
        return buffer;
    }

    private static void writeToFile(String contents, int chunkSize, int numChunks) throws Exception {
        char[] buff = runSwapper(contents, chunkSize, contents.length() / chunkSize);
        System.out.println(buff);
        PrintWriter writer = new PrintWriter("output.txt", "UTF-8");
        writer.print(buff);
        writer.close();
    }

     public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java TextSwap <chunk size> <filename>");
            return;
        }
        String contents = "";
        int chunkSize = Integer.parseInt(args[0]);
        try {
            contents = readFile(args[1],chunkSize);
            writeToFile(contents, chunkSize, contents.length() / chunkSize);
        } catch (Exception e) {
            System.out.println("Error with IO.");
            return;
        }
    }
}

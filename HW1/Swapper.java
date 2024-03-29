public class Swapper implements Runnable {
    private int offset;
    private Interval interval;
    private String content;
    private char[] buffer;

    public Swapper(Interval interval, String content, char[] buffer, int offset) {
        this.offset = offset;
        this.interval = interval;
        this.content = content;
        this.buffer = buffer;
    }

    @Override
    public void run() {
        

        /*
         * Steps to implement
         *  1. extract out the relevant chunk of data from original file content
         *  2. place the extracted content into the relevant index position range of buffer
         */
        char[] chunkData = content.substring(interval.getX(), interval.getY()+1).toCharArray();

        // debugging print statements
        // System.out.println("Inside Swapper Function: " + offset);
        // System.out.println(chunkData);

        int chunkIndex = 0;

        // debugging print statements
        // System.out.println(String.format("Loop Range: %s...%s", offset, (offset + (interval.getY() - interval.getX()))) );


        for(int i=offset; i<=(offset + (interval.getY() - interval.getX())); i++) {
            buffer[i] = chunkData[chunkIndex];

            // debugging print statements
            // System.out.println(String.format("chunkIndex=%s, chunkData[%s]=%s, buffer[%s]=%s", chunkIndex, chunkIndex, chunkData[chunkIndex], i, this.buffer[i]));


            chunkIndex++;
        }
    }
}
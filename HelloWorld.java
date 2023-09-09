public class HelloWorld {
    public static void main(String[] args) {
        int numChunks=8;
        int chunkSize=4;

        for (int i=0; i<numChunks; i++) {
            int startIndex = i*chunkSize;
            int endIndex = (i*chunkSize)+chunkSize-1;
            System.out.println("Start Index: " + startIndex + ", End Index: " + endIndex);
        }
    }

}

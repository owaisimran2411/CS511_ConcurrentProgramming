class Bar {
    // your code here
    boolean allowedToEnter
    int patriotsInside;
    Bar() {
        patriotsInside=0
        allowedToEnter=false
    }

    synchronized void jets() {
        println "Jets fan trying to go inside"
        while (allowedToEnter != true && patriotsInside%2==0) {
            println "Jets fan waiting for a Patriot fan"
            wait()
        }
        allowedToEnter=false
        notifyAll()
    }

    synchronized void patriots() {
        println "Patriot fan trying to go inside"
        patriotsInside++
        if (patriotsInside>=2) {
            allowedToEnter=true
            patriotsInside=0
        }
        notifyAll()
    }
    
}

Bar b = new Bar()
100.times {
    Thread.start { //jets
        b.jets()
    }
}

100.times {
    Thread.start { // patriots
        b.patriots()
    }
}
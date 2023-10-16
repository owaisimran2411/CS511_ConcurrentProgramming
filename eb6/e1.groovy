class Bar {
    // professor code
    int delta

    Bar () {
        delta = 0
    }

    synchronized void jets() {
        while (delta<2) {
            wait()
        }
        delta -= 2
    }

    synchronized void patriots() {
        delta++
        notify()
    }

    // your code here
    // boolean allowedToEnter
    // int patriotsInside;
    // Bar() {
    //     patriotsInside=0
    //     allowedToEnter=false
    // }

    // synchronized void jets() {
    //     println "Jets fan trying to go inside"
    //     while (allowedToEnter != true) {
    //         println "Jets fan waiting for a Patriot fan"
    //         wait()
    //     }
    //     allowedToEnter=false
    //     notifyAll()
    // }

    // synchronized void patriots() {
    //     println "Patriot fan trying to go inside"
    //     patriotsInside++
    //     if (patriotsInside>=2) {
    //         allowedToEnter=true
    //         patriotsInside=0
    //     }
    //     notifyAll()
    // }


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
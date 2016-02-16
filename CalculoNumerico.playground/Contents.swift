//: Playground - noun: a place where people can play

import UIKit

let errorMargin = 1E-4

func f(x:Double) -> Double{
    return sin(2*x*x) - cos(x) + 3
}

func derivada(x:Double) -> Double{
    var result:Double = 0.0
    var lastResult:Double = 0.0
    var delta:Double = 0.5
    var error:Double = 1E10
    var lastError:Double = error
    
    repeat {
        lastResult = result
        lastError = error
        delta = delta / 2
        result = (f(x + delta*x) - f(x - delta*x))/(2*delta*x)
        error = fabs(result - lastResult)
    }while ( error > errorMargin && lastError >= error)

    return result
}

let x:Double = 1.25

f(x)
derivada(x)

for i in 1...5000{
    print (derivada(Double(i)))
}

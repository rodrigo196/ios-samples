//: Playground - noun: a place where people can play

import UIKit

let errorMargin = 1E-4

func f(x:Double) -> Double{
    return 2*x*x - 4*x + 3
}

func derivada(x:Double) -> Double{
    var result:Double = 0.0
    var lastResult:Double = 0.0
    var delta:Double = 0.5
    var error:Double = 1E10
    
    repeat {
        lastResult = result
        delta = delta / 2
        result = (f(x + delta*x) - (x - delta*x))/(2*delta*x)
        error = fabs(result - lastResult)
    }while ( error > errorMargin)
    
    return result
}

let x:Double = 1.25
f(x)
derivada(x)



//
//  noise.swift
//  Raytracer
//
//  Created by Andrew David on 1/24/17.
//
//

import Foundation

let size = 256
let mask = size - 1
var perm = [Int](repeating: 0, count: size)
var gradientField = [Vector2D]()
var grads_x = [Int](repeating: 0, count: size)
var grads_y = [Int](repeating: 0, count: size)

// Extend Double to handle Double / Int

extension Double {
    static func / (left: Float64, right: Int) -> Float64 {
        return left / Float64(right)
    }
    
    static func * (left: Float64, right: Int) -> Float64 {
        return left / Float64(right)
    }
    
    static func & (left: Float64, right: Int) -> Float64 {
        return left & right
    }
    
    static func - (left: Float64, right: Int) -> Float64 {
        return left - Float64(right)
    }
}

// Create a random set of indexes from 0 - size of the field.
// Then create an array of Vectors evenly distributed around the unit circle.  We will use the two together to look up random vectors.


func initGrid () {
    for i in 0..<size {
        let random = Int(arc4random_uniform(UInt32(i) + 1))
        if i > random {
            perm[i] = perm[random]
        }
        perm[random] = i
        gradientField[i] = Vector2D(x: cos(2.0 * M_PI * i / size), y: sin(2.0 * M_PI * i / size))
        //grads_x[index] = cos(2.0 * M_PI * index / size)
        //grads_y[index] = sin(2.0 * M_PI * index / size)
    }
}

// This is the smoothing cubic Hermite spline function

func fallOff(t: Float64) -> Float64 {
    let t = abs(t)
    return t >= 1.0 ? 0.0 : (1.0 - (3.0 - 2.0 * t) * t * t)
}

// Take a point anywhere in space and return the smoothed gradient value for the point

func surflet(x: Float64, y: Float64, gradientVector: Vector2D) -> Float64 {
    return fallOff(t: x) * fallOff(t: y) * (gradientVector.x * x + gradientVector.y * y)
}

// Take a point in space, loop over the nearest four grid points, hash them and lookup the gradient vectors.

func noise (x: Float64, y: Float64) -> Float64 {
    var result: Float64 = 0.0
    let cell_x = Int(floor(x))  // For some reason Swift's floor function returns a double.
    let cell_y = Int(floor(y))
    
    for grid_y in stride(from: cell_y, through: cell_y + 1, by: 1) {
        for grid_x in stride(from: cell_x, through: cell_x + 1, by: 1) {
            let hash = perm[ ( perm[grid_x & mask] ) & mask]
            result += surflet(x: x - grid_x, y: y - grid_y, gradientVector: gradientField[hash])
        }
    }
    return result
}

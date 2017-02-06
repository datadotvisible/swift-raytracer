//
//  main.swift
//  Raytracer
//
//  Created by Andrew David on 1/27/17.
//  Copyright © 2017 Andrew David. All rights reserved.
//

import Foundation

/* Test
let twoD: Vector2D = Vector2D(x: 2.0, y: 3.9)
let threeD: Vector3D = Vector3D(x: 2.0, y: 3.9, z: 1.5)
let A: Vector3D = Vector3D(x: 2.0, y: 3.9, z: 1.5)
let B: Vector3D = Vector3D(x: 2.0, y: 3.9, z: 1.5)
print(B.cross(A))
let ray: Ray = Ray(A: A, B: B)
 */

//let image = RenderOutput(width: 1024, height: 788, fileName: "/Users/adavid/output.txt")

let width = 200
let height = 100

let image = RenderOutput(width: width, height: height, fileName: "/Users/adavid/output.txt")
var imageData: String = ""

//image.write()

for j in stride(from: height - 1, through: 0, by: -1) {
    for i in stride(from: 0, to: width, by: 1) {
        
        let pixel = Vector3D(x: Float64(i) / width, y: Float64(j) / height, z: 0.2)
        imageData += "\(255.99 * pixel.x) \(255.9 * pixel.y) \(255.9 * pixel.z)"
    }
}

print(imageData)

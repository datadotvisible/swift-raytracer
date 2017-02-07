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


let width = 200
let height = 100

let image = RenderOutput(width: width, height: height, fileName: "/Users/adavid/output.txt")

do {
    try image.write_header()
}
catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
}


for j in stride(from: height - 1, through: 0, by: -1) {
    var imageData: String = ""
    for i in stride(from: 0, to: width, by: 1) {
        
        let pixel = Vector3D(x: Float64(i) / width, y: Float64(j) / height, z: 0.2)
        imageData += "\(255.99 * pixel.x) \(255.9 * pixel.y) \(255.9 * pixel.z) "
    }
    do {
        try image.write_data(imageData: imageData)
    }
    catch let error as NSError {
        print("Ooops! Something went wrong: \(error)")
    }
}

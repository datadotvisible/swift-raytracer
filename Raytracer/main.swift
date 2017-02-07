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
let camera = Camera(origin: Vector3D(x: 0.0, y: 0.0, z: 0.0 ), lowerLeftCorner: Vector3D(x: -2.0, y: -1.0, z: -1.0), horizontal: Vector3D(x: 4.0, y: 0.0, z: 0.0), vertical: Vector3D(x: 0.0, y: 2.0, z: 0.0))

let image = RenderOutput(width: width, height: height, fileName: "/Users/adavid/output.ppm")

do {
    try image.write_header()
}
catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
}

// Trace rays from the bottom left of the screen, right to left and move up each row.

for j in stride(from: height - 1, through: 0, by: -1) {
    var imageData: String = ""
    for i in stride(from: 0, to: width, by: 1) {
        let u = Float64(i) / Float64(width)
        let v = Float64(j) / Float64(height)
        print("\(camera.lowerLeftCorner + u * camera.horizontal + v * camera.vertical)")
        let ray = Ray(A: camera.origin, B: camera.lowerLeftCorner + u * camera.horizontal + v * camera.vertical)
        let pixel = color(ray: ray)
        imageData += "\(255.99 * pixel.x) \(255.9 * pixel.y) \(255.9 * pixel.z) "
    }
    do {
        try image.write_data(imageData: imageData)
    }
    catch let error as NSError {
        print("Ooops! Something went wrong: \(error)")
    }
}

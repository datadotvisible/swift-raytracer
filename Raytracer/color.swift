//
//  color.swift
//  Raytracer
//
//  Created by Andrew David on 2/2/17.
//  Copyright © 2017 Andrew David. All rights reserved.
//

import Foundation

// Create a gradient backgroun from white to blue based on the y value of the ray

func color (ray: Ray) -> Vector3D {
    // Unit vector range is from -1 < y < 1 rescale to be between 0 < y < 1
    let t = 0.5 * (ray.direction.unit.y + 1.0)
    return (1.0 - t) * Vector3D(x: 1.0, y: 1.0, z: 1.0) + t * Vector3D(x: 0.5, y: 0.7, z: 1.0)
}

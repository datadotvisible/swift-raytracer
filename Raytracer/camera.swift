//
//  camera.swift
//  Raytracer
//
//  Created by Andrew David on 2/7/17.
//  Copyright © 2017 Andrew David. All rights reserved.
//

import Foundation

struct Camera {
    let origin: Vector3D
    let lowerLeftCorner: Vector3D
    let horizontal: Vector3D
    let vertical: Vector3D
}

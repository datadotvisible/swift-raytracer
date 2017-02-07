//
//  ray.swift
//  Raytracer
//
//  Created by Andrew David on 1/23/17.
//
//

import Foundation

struct Ray {
    var A: Vector3D
    var B: Vector3D
    
    var origin: Vector3D {
        return A
    }
    
    var direction: Vector3D {
        return B
    }
    
    func pointAtParameter(t: Float64) -> Vector3D {
        return A + B * t
    }
    
    // Lerp the color 
    
    func color (ray: Ray) -> Vector3D {
        let sphere = Sphere(origin: Vector3D(x: 0.0, y: 0.0, z: -1.0), radius: 0.5)
        if (hit_sphere(sphere: sphere, ray: ray)) {
            return Vector3D(x: 1.0, y: 0.0, z: 0.0)
        }
        let t = 0.5 * (ray.direction.y + 1.0)
        return (1.0 - t) * Vector3D(x: 1.0, y: 1.0, z: 1.0) + t * Vector3D(x: 0.5, y: 0.7, z: 1.0)
    }
    
    func hit_sphere(sphere: Sphere, ray: Ray) -> Bool {
        let oc = Vector3D(self.origin - sphere.origin)
        let a: Float64 = Vector3D.dot(left: self.direction, right: self.direction)
        let b: Float64 = 2.0 * Vector3D.dot(left: oc, right: self.direction)
        let c: Float64 = Vector3D.dot(left: oc, right: oc) - sphere.radius * sphere.radius
        let discriminant = b * b - 4 * a * c
        
        return (discriminant > 0)
    }
}

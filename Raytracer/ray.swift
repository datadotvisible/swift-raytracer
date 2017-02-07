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
        var t = hit_sphere(sphere: sphere, ray: ray)
        
        if (t > 0.0) {
            let normal = Vector3D(ray.pointAtParameter(t: t) - Vector3D(x: 0.0, y: 0.0, z: -1.0))
            return 0.5 * Vector3D(x: normal.x + 1, y: normal.y + 1, z: normal.z + 1)
        }
        
        t = 0.5 * (ray.direction.y + 1.0)
        return (1.0 - t) * Vector3D(x: 1.0, y: 1.0, z: 1.0) + t * Vector3D(x: 0.5, y: 0.7, z: 1.0)
    }
    
    func hit_sphere(sphere: Sphere, ray: Ray) -> Float64 {
        let oc = Vector3D(self.origin - sphere.origin)
        let a: Float64 = Vector3D.dot(left: self.direction, right: self.direction)
        let b: Float64 = 2.0 * Vector3D.dot(left: oc, right: self.direction)
        let c: Float64 = Vector3D.dot(left: oc, right: oc) - sphere.radius * sphere.radius
        let discriminant = b * b - 4 * a * c
        
        return discriminant < 0 ? -1.0 : (-b - sqrt(discriminant)) / (2.0 * a)
    }
}

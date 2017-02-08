//
//  objects.swift
//  Raytracer
//
//  Created by Andrew David on 2/6/17.
//  Copyright © 2017 Andrew David. All rights reserved.
//

import Foundation

protocol Hittable {
    func hit(ray: Ray, tMin: Float64, tMax: Float64, record: HitRecord) -> Bool
}

struct HitRecord {
    var time: Float64
    var point: Vector3D
    var normal: Vector3D
}

struct Sphere {
    let origin: Vector3D
    let radius: Float64
    
    func hit(ray: Ray, tMin: Float64, tMax: Float64, record: HitRecord) -> Bool {
        
        var record = record
        let oc = Vector3D(ray.origin - self.origin)
        let a: Float64 = Vector3D.dot(left: ray.direction, right: ray.direction)
        let b: Float64 = 2.0 * Vector3D.dot(left: oc, right: ray.direction)
        let c: Float64 = Vector3D.dot(left: oc, right: oc) - self.radius * self.radius
        let discriminant = b * b - 4 * a * c
        let discriminantSqrt = sqrt(discriminant)
        
        if discriminant > 0 {
            var temp = (-b - discriminantSqrt) / a
            if (temp < tMax && temp > tMin) {
                record.time = temp
                record.point = ray.pointAtParameter(t: record.time)
                record.normal = (record.point - self.origin) * (1.0 / self.radius) // Avoid having to make a divide function in the Vector class
                return true
            }
            temp = (-b + discriminantSqrt) / a
            
            if (temp < tMax && temp > tMin) {
                record.time = temp
                record.point = ray.pointAtParameter(t: record.time)
                record.normal = (record.point - self.origin) * (1.0 / self.radius)
                return true
            }
        }
        return false
    }
}


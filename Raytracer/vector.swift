import Foundation

protocol Vector {
    static func + (left: Self, right: Self) -> Self
    static func - (left: Self, right: Self) -> Self
    static func * (left: Self, right: Self) -> Float64
    static func * (left: Self, right: Float64) -> Self
    static func * (left: Float64, right: Self) -> Self
    var length: Float64 {get}
    var squaredLength: Float64 {get}
    var unit: Self {get}
}

struct Vector2D: Vector {
    var x: Float64
    var y: Float64
    
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func - (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + -right.x, y: left.y + -right.y)
    }
    
    static func * (left: Vector2D, right: Vector2D) -> Float64 {
        return left.x * right.x + left.y * right.y
    }
    
    static func * (left: Vector2D, right: Float64) -> Vector2D {
        return Vector2D(x: left.x * right, y: left.y * right)
    }
    
    static func * (left: Float64, right: Vector2D) -> Vector2D {
        return Vector2D(x: left * right.x, y: left * right.y)
    }
    
    func dot (_ right: Vector2D) -> Float64{
        return self.x * right.x + self.y * right.y
    }
    
    func cross (_ right: Vector2D) -> Float64 {
        return self.x * right.y - self.y * right.x
    }
    
    var length: Float64 {
        return sqrt(self.x * self.x + self.y * self.y)
    }
    
    var squaredLength: Float64 {
        return (self.x * self.x + self.y * self.y)
    }
    
    var unit: Vector2D {
        let k: Float64 = 1.0 / self.length
        return self * k
    }
}

// Default initializer if a Vector2D is passed through.

extension Vector2D {
    init(_ vector: Vector2D) {
        self.x = vector.x
        self.y = vector.y
    }
}

struct Vector3D: Vector {
    var x: Float64
    var y: Float64
    var z: Float64
    
    static func + (left: Vector3D, right: Vector3D) -> Vector3D {
        return Vector3D(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
    }
    
    static func - (left: Vector3D, right: Vector3D) -> Vector3D {
        return Vector3D(x: left.x + -right.x, y: left.y + -right.y, z: left.z + -right.z)
    }
    
    static func * (left: Vector3D, right: Vector3D) -> Float64 {
        return left.x * right.x + left.y * right.y + left.z * right.z
    }
    
    static func * (left: Vector3D, right: Float64) -> Vector3D {
        return Vector3D(x: left.x * right, y: left.y * right, z: left.z * right)
    }
    
    static func * (left: Float64, right: Vector3D) -> Vector3D {
        return Vector3D(x: left * right.x, y: left * right.y, z: left * right.z)
    }

    static func dot (left: Vector3D, right: Vector3D) -> Float64 {
        return left.x * right.x + left.y * right.y + left.z * right.z
    }
    
    func cross (_ right: Vector3D) -> Vector3D {
        return Vector3D(x: self.y * right.z - self.z * right.y, y: self.z * right.x - self.x * right.z, z: self.x * right.y - self.y * right.x)
    }
    
    var length: Float64 {
        return sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    }
    
    var squaredLength: Float64 {
        return (self.x * self.x + self.y * self.y + self.z * self.z)
    }
    
    var unit: Vector3D {
        let k: Float64 = 1.0 / self.length
        return self * k
    }
}

// Default initializer if a Vector3D is passed through.

extension Vector3D {
    init(_ vector: Vector3D) {
        self.x = vector.x
        self.y = vector.y
        self.z = vector.z
    }
}

//
//  output.swift
//  Raytracer
//
//  Created by Andrew David on 1/27/17.
//
//

import Foundation

struct PpmFile {
    let type: String
    let x: Int
    let y: Int
    
    static func header(width: Int, height: Int) -> String {
        return "P3\n\(width) \(height)\n255\n"
    }
}

struct RenderOutput {
    var width: Int
    var height: Int
    var fileName: String
    
    func write() -> Bool {
        let contents = PpmFile.header(width: width, height: height)
        
        do {
            // Write contents to file
            try contents.write(toFile: self.fileName, atomically: false, encoding: String.Encoding.utf8)
            return true
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
            return false
        }
    }
    
    func write(imageData: String) -> Bool {
        let contents = PpmFile.header(width: width, height: height)
        
        do {
            // Write contents to file
            try contents.write(toFile: self.fileName, atomically: false, encoding: String.Encoding.utf8)
            return true
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
            return false
        }
    }
    
    static func read(filename: String) {
        //let s = try String(contentsOfFile: Bundle.mainBundle.pathForResource(filename))
        //print(s)
    }
}

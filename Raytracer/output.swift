//
//  output.swift
//  Raytracer
//
//  Created by Andrew David on 1/27/17.
//
//

import Foundation

struct RenderOutput {
    var width: Int
    var height: Int
    var fileName: String
    
    func write() -> Bool {
        let contents = "Here are my file's contents"
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

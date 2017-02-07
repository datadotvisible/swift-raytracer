//
//  output.swift
//  Raytracer
//
//  Created by Andrew David on 1/27/17.
//
//

import Foundation

enum FileOutputError: Error {
    case cannotWriteFile
    case generalError
}

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
    
    func write_header() throws {
        let contents = PpmFile.header(width: width, height: height)
        
        do {
            // Write contents to file
            try contents.write(toFile: self.fileName, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
            throw FileOutputError.generalError
        }
    }
    
    func write_data(imageData: String) throws {
        let handle = FileHandle.init(forUpdatingAtPath: self.fileName)
        handle?.readDataToEndOfFile()
        
        do {
            // Write contents to file
            guard let data = imageData.data(using: .utf8) else { throw FileOutputError.generalError }
            handle?.write(data)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
            throw FileOutputError.generalError
        }
    }
    
    static func read(filename: String) {

    }
}

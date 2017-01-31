//
//  output.swift
//  Raytracer
//
//  Created by Andrew David on 1/27/17.
//
//

import Foundation

struct RenderOutput {
    static func write(filename: String) -> Bool {
        do {
            // get the documents folder url
            let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            // create the destination url for the text file to be saved
            let fileDestinationUrl = documentDirectoryURL.appendingPathComponent(filename)
            
            let text = "some text"
            do {
                // writing to disk
                try text.write(to: fileDestinationUrl, atomically: false, encoding: .utf8)
                
                // saving was successful. any code posterior code goes here
                // reading from disk
                do {
                    let mytext = try String(contentsOf: fileDestinationUrl)
                    print(mytext)   // "some text\n"
                } catch let error as NSError {
                    print("error loading contentsOf url \(fileDestinationUrl)")
                    print(error.localizedDescription)
                } 
            } catch let error as NSError {
                print("error writing to url \(fileDestinationUrl)")
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print("error getting documentDirectoryURL")
            print(error.localizedDescription)
        }
        return true
    }
    
    static func read(filename: String) {
        //let s = try String(contentsOfFile: Bundle.mainBundle.pathForResource(filename))
        //print(s)
    }
}

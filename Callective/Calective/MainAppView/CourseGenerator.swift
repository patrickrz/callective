//
//  CourseGenerator.swift
//  Callective
//
//  Created by Patrick Zhu on 11/21/20.
//

import Foundation

class CourseGenerator {
    
    static func getCourseArray() -> [Course] {
        guard let path = Bundle.main.path(forResource: "DummyClassList", ofType: "json") else { print("Couldn't find Course filepath")
            return []
        }
        guard let jsonData = try? NSData(contentsOfFile: path) as Data else {
            print("Couldn't load file")
            return []
        }
        
        let decoder = JSONDecoder()
        
        // Generally this is bad practice, but we need this decoding for the app to load, and the force unwrap will tell us why the error is occurring
        return try! decoder.decode([Course].self, from: jsonData)
    }
}

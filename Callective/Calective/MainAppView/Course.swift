//
//  Course.swift
//  Callective
//
//  Created by Patrick Zhu on 11/21/20.
//

import Foundation

struct Course: Codable {
    let classNum: Int
    let classAbrv, classCode, className: String
    let numUnits: Int
    let professor, lectureDays, semester: String
    let totalOpenSeats, enrolled, capacity, waitlisted: Int
    let waitlistMax: Int

    
    enum CodingKeys: String, CodingKey {
        case classNum = "class_num"
        case classAbrv = "class_abrv"
        case classCode = "class_code"
        case className = "class_name"
        case numUnits = "num_units"
        case professor
        case lectureDays = "lecture_days"
        case semester
        case totalOpenSeats = "total_open_seats"
        case enrolled, capacity, waitlisted
        case waitlistMax = "waitlist_max"
    }

    
//    required init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.class_num = Int(try valueContainer.decode(Int.self, forKey: .class_num))
//        self.class_abrv = try valueContainer.decode(String.self, forKey: .class_abrv)
//        self.class_code = try valueContainer.decode(String.self, forKey: .class_code)
//        self.class_name = try valueContainer.decode(String.self, forKey: .class_name)
//        self.num_units = try valueContainer.decode(Int.self, forKey: .num_units)
//        self.professor = try valueContainer.decode(String.self, forKey: .professor)
//        self.lecture_days = try valueContainer.decode(String.self, forKey: .lecture_days)
//        self.semester = try valueContainer.decode(String.self, forKey: .semester)
//        self.total_open_seats = try valueContainer.decode(Int.self, forKey: .total_open_seats)
//        self.enrolled = try valueContainer.decode(Int.self, forKey: .enrolled)
//        self.capacity = try valueContainer.decode(Int.self, forKey: .capacity)
//        self.waitlisted = try valueContainer.decode(Int.self, forKey: .waitlisted)
//        self.waitlist_max = try valueContainer.decode(Int.self, forKey: .waitlist_max)
//        self.unknown = try valueContainer.decode(Int.self, forKey: .unknown)
//
//
//    }

}

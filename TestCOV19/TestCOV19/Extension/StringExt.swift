//
//  StringExt.swift
//  TestCOV19
//

import Foundation

extension String {
    var getDateFromString : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = "d MMM yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: date!)
    }
}

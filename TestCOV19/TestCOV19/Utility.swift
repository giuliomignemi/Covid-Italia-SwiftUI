//
//  Utility.swift
//  TestCOV19
//

import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

func getDateFromString(str : String) ->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
    let date = dateFormatter.date(from: str)
    
    dateFormatter.dateFormat = "d MMM yyyy"
    dateFormatter.timeZone = NSTimeZone.local
    return dateFormatter.string(from: date!)
    }

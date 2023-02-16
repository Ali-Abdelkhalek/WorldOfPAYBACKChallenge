//
//  DateFormatter.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//

import Foundation


extension Date{
    
    static func from(string:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from:string)
    }
    
    static func forUserTimeZone(from string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current // convert date to user time zone
        guard let date = Date.from(string:string) else { return "Unknown Date"}
        return dateFormatter.string(from: date)
    }
}



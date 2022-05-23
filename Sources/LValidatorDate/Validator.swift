//
//  Validator.swift
//  LValidatorEmail
//
//  Created by Leonardo Mendez on 10/05/22.
//

import Foundation

public struct ValidateEmail {
    
   public static func isValidEmail(_ email: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}"+"\\@"+"[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"+"("+"\\."+"[a-zA-Z0-9][a-zA-Z0-9\\-]{1,25}"+")+"
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0 || email.contains(" ") {
                returnValue = false
            }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return returnValue
    }
    
}

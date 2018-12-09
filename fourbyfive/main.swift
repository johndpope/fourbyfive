//
//  main.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 04/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

print("Hello, World!")

print("\(getCurrentMillis())")

let file = ""

let instagram = Instagram(username: "");

instagram.login(password: "")

instagram.upload(file: file, caption: "Plugin upload!")

RunLoop.current.run(until: Date(timeIntervalSinceNow: 5))






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

//print(2 * Int.max)

let device = Device("username")

print("device: \(device)")

let instagram = Instagram(device: device);

_ = instagram.getCsrfToken()
instagram.login(password: "passsword")


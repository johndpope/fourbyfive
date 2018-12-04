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

let fourbyfive = FourByFive();

fourbyfive.login();

print("s33krit".hmac(algorithm: .sha256, key: PRIVATE_KEY.SIG_KEY))


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

let semaphore = DispatchSemaphore(value: 0)

let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)

Alamofire.request("https://httpbin.org/get")
    .responseJSON(queue: queue) { response in
        if let json = response.result.value {
            print(json)
        }
        semaphore.signal()
}

_ = semaphore.wait(timeout: DispatchTime.distantFuture)

print("Done!")

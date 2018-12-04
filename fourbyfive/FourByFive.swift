//
//  FourByFive.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 04/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

struct PRIVATE_KEY {
    static let SIG_KEY = "109513c04303341a7daf27bb41b268e633b30dcc65a3fe14503f743176113869"
    static let SIG_VERSION = "4"
    static let APP_VERSION = "27.0.0.7.97"
}

class FourByFive {
    
    private let queue: DispatchQueue = DispatchQueue(label: "com.instagram.api", qos: .background, attributes: .concurrent)
    
    func login() {
        
        self.sync { semaphore in
            
            Alamofire.request("https://httpbin.org/get")
                .responseJSON(queue: queue) { response in
                    if let json = response.result.value {
                        print(json)
                    }
                    semaphore.signal()
            }
        }
    }
    
    func sync(call: (DispatchSemaphore) -> ()) {
        let semaphore = DispatchSemaphore(value: 0)
        call(semaphore)
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
}

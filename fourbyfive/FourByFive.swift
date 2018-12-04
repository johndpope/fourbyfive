//
//  FourByFive.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 04/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

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

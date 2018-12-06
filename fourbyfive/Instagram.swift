//
//  FourByFive.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 04/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

struct Login : Codable {
    let device_id: String
    let username: String
    let password: String
    let login_attempt_count: Int
}

class Instagram {
    
    private let defaultHeaders: [String : String] =
        [
            "X-IG-Connection-Type": "WIFI",
            "X-IG-Capabilities": "3QI=",
            "Accept-Language": "en-US",
            "Host": HOSTNAME,
            "Accept": "*/*",
            "Accept-Encoding": "gzip, deflate, sdch",
            "Connection": "Close"
        ]
    
    private let device: Device
    
    private let encoder = JSONEncoder()
    
    private let queue: DispatchQueue = DispatchQueue(label: "com.instagram.api", qos: .background, attributes: .concurrent)
    
    init(username: String) {
        self.device = Device(username)
    }
    
    init(device: Device) {
        self.device = device
    }
    
    func login(password: String) {
        
        let headers = self.defaultHeaders.merging(
            ["User-Agent": self.device.userAgent],
            uniquingKeysWith: { (first, _) in first }
        )
        
        let login = Login(
            device_id: self.device.id,
            username: self.device.username,
            password: password,
            login_attempt_count: 0
        )
        
        let json = try? self.encoder.encode(login)
        let text = String(data: json!, encoding: .utf8)!
        let signature = text.hmac(algorithm: .sha256, key: SIG_KEY)
        let body = "\(signature).\(text)"
        
        print("body: \(body)")
        
        let params = [
            "ig_sig_key_version": SIG_VERSION,
            "signed_body": body
        ]
        
        let endpoint = "https://\(HOSTNAME)/api/v1/accounts/login/"
        //let endpoint = "https://httpbin.org/get"
        
        self.sync { semaphore in
            
            Alamofire
                .request(endpoint, method: .post, parameters: params, headers: headers)
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

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
    let _csrftoken: String
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
    
    private var csrftoken: String? = nil
    
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
            _csrftoken: self.csrftoken!,
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
        
        return self.sync { semaphore in
            
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
    
    func getCsrfToken() -> String? {
        
        if let csrftoken = self.csrftoken {
            return csrftoken
        }
        
        let endpoint = "https://\(HOSTNAME)/api/v1/si/fetch_headers/?challenge_type=signup&guid=\(UUID().asString(keepDashes: false))"
        
        let headers = self.defaultHeaders.merging(
            ["User-Agent": self.device.userAgent],
            uniquingKeysWith: { (first, _) in first }
        )
        
        let semaphore = DispatchSemaphore(value: 0)
        
        Alamofire
            .request(endpoint, method: .post, parameters: [:], headers: headers)
            .response(queue: queue) { response in
                
                if let headers = response.response?.allHeaderFields {
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headers as! [String : String], for: response.request!.url!)
                    self.csrftoken = cookies.first(where: { $0.name == "csrftoken" })?.value
                    print("Done: \(self.csrftoken)")
                    semaphore.signal()
                }
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return self.csrftoken
        
    }
    
    func sync<T>(call: (DispatchSemaphore) -> T) -> T {
        let semaphore = DispatchSemaphore(value: 0)
        let result = call(semaphore)
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return result
    }
}

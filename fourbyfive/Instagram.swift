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
    let guid: String
    let _csrftoken: String
    let device_id: String
    let username: String
    let password: String
    let login_attempt_count: Int
}

class Instagram {
    
    private let defaultHeaders: [String : String] =
        [
            "Connection": "close",
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Cookie2": "$Version=1",
            "Accept-Language": "en-US",
            "User-Agent": Constants.Device.userAgent
        ]
    
    private var csrftoken: String? = nil
    
    private let username: String
    
    private let deviceId: String
    
    private let guid: String = UUID().asString(keepDashes: false)
    
    private let adid: String = UUID().asString(keepDashes: true)
    
    private let encoder = JSONEncoder()
    
    private let queue: DispatchQueue = DispatchQueue(label: "com.instagram.api", qos: .background, attributes: .concurrent)
    
    init(username: String) {
        self.username = username
        self.deviceId = "android-\(self.username.md5()!.prefix(16))"
    }
    
    
    func login(password: String) {
        
//        self.msisdn()
//        self.syncFeatures()
//        self.zeroRatingToken()
//        self.logAttribution()
        
        let login = Login(
            guid: self.guid,
            _csrftoken: self.getCsrfToken()!,
            device_id: self.deviceId,
            username: self.username,
            password: password,
            login_attempt_count: 0
        )
        
        self.post(endpoint: "accounts/login/", request: login)
    }
    
    func getCsrfToken() -> String? {
        
        if let csrftoken = self.csrftoken {
            return csrftoken
        }
        
        let endpoint = "\(Constants.Api.url)si/fetch_headers/?challenge_type=signup&guid=\(self.guid)"
        
        
        let semaphore = DispatchSemaphore(value: 0)
        
        Alamofire
            .request(endpoint, method: .post, parameters: [:], headers: self.defaultHeaders)
            .response(queue: queue) { response in
                
                if let headers = response.response?.allHeaderFields {
                    
                    
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headers as! [String : String], for: response.request!.url!)
                    
                    self.csrftoken = cookies.first(where: { $0.name == "csrftoken" })?.value
                    semaphore.signal()
                }
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return self.csrftoken
        
    }
    
    func msisdn() -> Void {
        
        let request = [
            "devide_id": self.deviceId,
            "_csrftoken": self.getCsrfToken()!
        ]
        
        self.post(endpoint: "accounts/read_msisdn_header/", request: request)
    }
    
    func syncFeatures() -> Void {
        
        let request = [
            "id": self.guid,
            "experiments": Constants.Device.experiments
        ]
        
        self.post(endpoint: "qe/sync/", request: request)
    }
    
    func zeroRatingToken() -> Void {
        
        self.post(endpoint: "zr/token/result/", request: ["token_hash" : ""])
    }
    
    func logAttribution() {
        self.post(endpoint: "attribution/log_attribution/", request: ["advertising_id": self.adid])
    }
    
    func post<R : Codable>(endpoint: String, request: R) -> Void {
        
        self.sync { semaphore in
            
            let url = "\(Constants.Api.url)\(endpoint)"
        
            let json = try? self.encoder.encode(request)
            let text = String(data: json!, encoding: .utf8)!
            let signature = text.hmac(algorithm: .sha256, key: Constants.Api.key)
            let body = "\(signature).\(text)"
            
            let params = [
                "ig_sig_key_version": Constants.Api.keyVersion,
                "signed_body": body
            ]
            
            Alamofire
                .request(url, method: .post, parameters: params, headers: self.defaultHeaders)
                .responseJSON(queue: queue) { response in
                    defer { semaphore.signal() }
                    if let json = response.result.value {
                        print(json)
                    }
            }
        }
    }
    
    func sync<T>(call: (DispatchSemaphore) -> T) -> T {
        let semaphore = DispatchSemaphore(value: 0)
        defer { _ = semaphore.wait(timeout: DispatchTime.distantFuture) }
        let result = call(semaphore)
        return result
    }
}

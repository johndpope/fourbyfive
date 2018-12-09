//
//  FourByFive.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 04/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import AppKit
import Foundation
import Alamofire

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
    
    private var user: User?
    
    private var rankToken: String? {
        get {
            if let user = self.user {
                return "\(user.pk)_\(self.guid)"
            } else {
                return nil
            }
        }
    }
    
    private let queue: DispatchQueue = DispatchQueue(label: "com.instagram.api", qos: .background, attributes: .concurrent)
    
    init(username: String) {
        self.username = username
        self.deviceId = "android-\(self.username.md5()!.prefix(16))"
    }
    
    private var isLoggedIn: Bool {
        get {
            if let _ = self.user {
                return true;
            } else {
                return false;
            }
        }
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
        
        self.post(endpoint: "accounts/login/", request: login) { json in
            let decoder = JSONDecoder()
            print("Login: \(json)")
            do {
                self.user = try decoder.decode(LoginResponse.self, from: json).logged_in_user
                print("user: \(self.user!)")
            } catch {
                print("Error decoding json")
            }
        }
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
    
    func post<R : Codable>(endpoint: String, request: R, complete: ((_ data: Data) -> Void)? = nil) -> Void {
        
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
                .response(queue: queue) { response in
                    defer { semaphore.signal() }
                    if let json = response.data {
                        //print("Response: \(response)")
                        print("json: \(String(data: json, encoding: .utf8)!)")
                        if let complete = complete {
                            complete(json)
                        }
                    }
            }
        }
    }
    
    func upload(file: String, caption: String) -> Void {
        
        guard self.isLoggedIn else {
            print("Not logged in!")
            return;
        }
        
        print("Uploading: \(file)")
        
        let uploadId = getCurrentMillis()
    
        let fileUrl: URL = URL(fileURLWithPath: file)
        
        let headers = [
            "X-IG-Capabilities": "3Q4=",
            "X-IG-Connection-Type": "WIFI",
            "Cookie2": "$Version=1",
            "Accept-Language": "en-US",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "close",
            //"Content-Type": "multipart/form-data; boundary=\(self.guid)",
            "User-Agent": Constants.Device.userAgent,
        ]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append("\(self.guid)".utf8(), withName: "_uuid")
                multipartFormData.append("\(uploadId)".utf8(), withName: "upload_id")
                multipartFormData.append("\(self.getCsrfToken()!)".utf8(), withName: "_csrftoken")
                multipartFormData.append(Constants.Api.imageCompression.utf8(), withName: "image_compression")
                multipartFormData.append(fileUrl, withName: "photo", fileName: "pending_media_\(uploadId).jpg", mimeType: "application/octet-stream")
        },
            to: "\(Constants.Api.url)upload/photo/",
            method: .post,
            headers: headers
        ) { result in
            
            print("Upload is done!")
            
            switch result {
            case .success(let upload, _, _):
                print("Upload was as success!")
                upload.responseJSON { response in
                    print("Upload response: \(response)")
                    self.configure(
                        uploadId: "\(uploadId)",
                        fileUrl: fileUrl,
                        caption: caption
                    )
                }
                
            case .failure(let encodingError):
                
                print("Error uploading: \(encodingError)")
                
            }
        }
        
    }
    
    private func configure(uploadId: String, fileUrl: URL, caption: String) -> Void {
        
        print("configuring: \(uploadId)")
    
        if let size = fileUrl.getImageSize() {
         
            let request = Configure(
                _csrftoken: self.getCsrfToken()!,
                _uid: self.user!.pk,
                _uuid: self.guid,
                caption: caption,
                upload_id: uploadId,
                extra: Configure.Extra(
                    source_width: size.width,
                    source_height: size.height),
                edits: Configure.Edits(crop_original_size: size.asArray())
            )
            
            self.post(endpoint: "media/configure/?", request: request)
            
        }
    }
    
    func sync<T>(call: (DispatchSemaphore) -> T) -> T {
        let semaphore = DispatchSemaphore(value: 0)
        defer { _ = semaphore.wait(timeout: DispatchTime.distantFuture) }
        let result = call(semaphore)
        return result
    }
}

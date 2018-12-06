//
//  Device.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 05/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation

struct Info {
    let model: String
    let device: String
    let manufacturer: String
}

struct Device {
    
    public let username: String
    
    public let id: String
    public let md5: String
    public let api: Int
    public let dpi: String
    public let info: Info
    public let release: String
    public let userAgent: String
    public let resolution: String
    
    private let hashCode: Int
    
    init(_ username: String) {
        
        self.username = username
        
        self.hashCode = abs(Int(self.username.hashCode()))
        self.md5 = self.username.md5()!
        self.id = "android-\(self.md5.prefix(16))"
        self.api = 18 + (self.hashCode % 5)
        
        self.dpi = DOTSPERINCH.atHash(self.hashCode)!
        self.release = RELEASES.atHash(self.hashCode)!
        self.resolution = RESOLUTIONS.atHash(self.hashCode)!
        
        let device: [String] = DEVICES.atHash(self.hashCode)!
        self.info = Info(
            model: device[2],
            device: device[1],
            manufacturer: device[0]
        )
        
        let agent: [String] = ["\(self.api)/\(self.release)", "\(self.dpi)dpi", self.resolution, self.info.manufacturer, self.info.model, self.info.device, "en_US"];
        
        self.userAgent = "Instagram \(APP_VERSION) Android (\(agent.joined(separator: "; "))"
    }
    
}

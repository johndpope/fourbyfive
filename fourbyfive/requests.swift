//
//  requests.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 09/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation

struct Login : Codable {
    let guid: String
    let _csrftoken: String
    let device_id: String
    let username: String
    let password: String
    let login_attempt_count: Int
}

struct Size : Codable {
    let width: Int
    let height: Int
}

extension Size {
    func asArray() -> [Int] {
        return [self.width, self.height]
    }
}

struct Configure : Codable {
    
    let _csrftoken: String
    let media_folder = "Instagram"
    let source_type = 4
    let _uid: Int64
    let _uuid: String
    let caption: String
    let upload_id: String
    
    let extra: Extra
    let edits: Edits
    let device: Device = Device()
    
    struct Device : Codable {
        let model = Constants.Device.model
        let android_version = Constants.Device.version
        let android_release = Constants.Device.release
        let manufacturer = Constants.Device.manufacturer
    }
    
    struct Edits : Codable {
        let crop_original_size: [Int]
        let crop_center: [Int] = [0, 0]
        let crop_zoom: Double = 1.0
    }
    
    struct Extra : Codable {
        let source_width: Int
        let source_height: Int
    }
}

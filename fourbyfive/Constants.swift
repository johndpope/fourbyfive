//
//  Constants.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 05/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation

let HOSTNAME = "i.instagram.com"

let SIG_KEY = "109513c04303341a7daf27bb41b268e633b30dcc65a3fe14503f743176113869"
let SIG_VERSION = "4"
let APP_VERSION = "27.0.0.7.97"

let RELEASES = ["4.0.4", "4.3.1", "4.4.4", "5.1.1", "6.0.1"]
let RESOLUTIONS = ["3840x2160", "1440x2560", "2560x1440", "1440x2560",
                          "2560x1440", "1080x1920", "1080x1920", "1080x1920"]
let DOTSPERINCH = ["801", "577", "576", "538", "515", "424", "401", "373"]

let DEVICES: [[String]] = loadFromResource()

public extension Array {
    
    public func atHash(_ hash: Int) -> Element? {
        if (self.isEmpty) {
            return nil
        } else {
            return self[hash % self.count]
        }
    }
}

private func loadFromResource() -> [[String]] {
    if let url = Bundle.main.url(forResource: "devices", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let devices = json as? [[String]] {
                return devices
            }
        } catch {
            print("Unable to parse devices.json")
        }
    }
    return []
}

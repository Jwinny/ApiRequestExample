//
//  KeyService.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

class KeysService {
    enum Keys: String {
        case username
    }

    static func get(_ key: KeysService.Keys) -> Any? {
        UserDefaults.standard.value(forKey: key.rawValue)
    }

    static func set(_ value: Any?, for key: KeysService.Keys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    static func has(key: KeysService.Keys) -> Bool {
        UserDefaults.standard.value(forKey: key.rawValue) != nil
    }

}

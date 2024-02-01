//
//  User.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 05.01.24.
//

import Foundation


struct User: Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let joined: TimeInterval
}

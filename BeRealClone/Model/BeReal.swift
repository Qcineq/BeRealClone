//
//  BeReal.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 20/01/2024.
//

import SwiftUI

struct BeReal: Decodable {
    var username: String
    var frontImgaeUrl: String
    var backImgaeUrl: String
    var userId: String
    var user: User?
}

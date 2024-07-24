//
//  Design.swift
//  Polaroid
//
//  Created by 홍정민 on 7/24/24.
//

import UIKit

enum FontType {
    static let primary = UIFont.systemFont(ofSize: 16)
    static let secondary = UIFont.systemFont(ofSize: 15)
    static let tertiary = UIFont.systemFont(ofSize: 14)
    static let quaternary = UIFont.systemFont(ofSize: 13)
}

enum ImageType {
    static let like_circle = UIImage(named: "like_circle")!
    static let like_circle_inactive = UIImage(named: "like_circle_inactive")!
    static let sort = UIImage(named: "sort")
}

enum ProfileType:String, CaseIterable {
    case profile_0
    case profile_1
    case profile_2
    case profile_3
    case profile_4
    case profile_5
    case profile_6
    case profile_7
    case profile_8
    case profile_9
    case profile_10
    case profile_11
    
    static var randomTitle: String {
        return ProfileType.allCases.randomElement()!.rawValue
    }

}

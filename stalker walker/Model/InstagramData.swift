//
//  instagramData.swift
//  stalker walker
//
//  Created by nato on 11/04/2022.
//

import Foundation

struct InstagramData: Codable {

    let data: Top
    
    
}

struct Top: Codable {
    let biography: String
    let is_private: Bool
    let full_name: String
    var figures: Figures
    var profile_picture: Profile_picture
    
    
    
    
    //let figures = posts: Int, followers: Int, following: Int
    
    
    
//    enum figures: Decodable {
//        case posts: Int, followers: Int, following: Int
//    }
    
}


struct Figures: Codable {
    let posts: Int
    let followers: Int
    let followings: Int
}

struct Profile_picture: Codable {
    let normal: String
}



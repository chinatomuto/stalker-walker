//
//  InstagramModel.swift
//  stalker walker
//
//  Created by nato on 11/04/2022.
//

import Foundation

struct InstagramModel {
    let fullName: String
    let bio: String
    let locked: Bool
    let post: Int
    let followers: Int
    let following: Int
    let profilePicture: String
    
    var postString: String {
        return String(post)
    }
    
    var followersString: String {
        return String(followers)
    }
    
    var followingString: String {
        return String(following)
    }
    
    var lockedbool: String {
        if locked == true{
            return "Yes"
        } else {
            return "No"
        }
    }
    
    
    
}


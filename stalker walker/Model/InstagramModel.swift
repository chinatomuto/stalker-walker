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
    let followings: Int
    let profilePicture: String
    
    var postString: String {
        return String(post)
    }
    
    var followersString: String {
        
        switch followers {
        case 10000...99999:
            let thousand = "K"
            let fs = String(followers)
            let two = String(fs.prefix(2))
            return two + thousand
        case 100000...999999:
            let thousand = "K"
            let fs = String(followers)
            let two = String(fs.prefix(3))
            return two + thousand
        case 1000000...9999999:
            let million = "M"
            let fs = String(followers)
            let two = String(fs.prefix(1))
            return two + million
        case 10000000...99999999:
            let million = "M"
            let fs = String(followers)
            let two = String(fs.prefix(2))
            return two + million
        case 100000000...999999999:
            let million = "M"
            let fs = String(followers)
            let two = String(fs.prefix(3))
            return two + million
        case 1000000000...9999999999:
            let billion = "B"
            let fs = String(followers)
            let two = String(fs.prefix(1))
            return two + billion
        default:
            return String(followers)
        }
        
        //return String(followers)
    }
    

    
    var followingString: String {
        switch followings {
        case 10000...99999:
            let thousand = "K"
            let fs = String(followings)
            let two = String(fs.prefix(2))
            return two + thousand
        case 100000...999999:
            let thousand = "K"
            let fs = String(followings)
            let two = String(fs.prefix(3))
            return two + thousand
        case 1000000...9999999:
            let million = "M"
            let fs = String(followings)
            let two = String(fs.prefix(1))
            return two + million
        case 10000000...99999999:
            let million = "M"
            let fs = String(followings)
            let two = String(fs.prefix(2))
            return two + million
        case 100000000...999999999:
            let million = "M"
            let fs = String(followings)
            let two = String(fs.prefix(3))
            return two + million
        case 1000000000...9999999999:
            let billion = "B"
            let fs = String(followings)
            let two = String(fs.prefix(1))
            return two + billion
        default:
            return String(followings)
        }
        //return String(followings)
    }
    
    var lockedbool: String {
        if locked == true{
            return "Yes"
        } else {
            return "No"
        }
    }
    
    
    
}

